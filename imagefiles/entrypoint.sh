#!/bin/sh

# This is the entrypoint script for the dockerfile. Executed in the
# container at runtime.

# If we are running docker natively, we want to create a user in the container
# with the same UID and GID as the user on the host machine, so that any files
# created are owned by that user. Without this they are all owned by root.
# If we are running from boot2docker, this is not necessary.
# The dockcross script sets the BUILDER_UID and BUILDER_GID vars.

if [[ -n $BUILDER_UID ]] && [[ -n $BUILDER_GID ]]; then

  addgroup -g $BUILDER_GID $BUILDER_GROUP
  adduser -u $BUILDER_UID -D -H -G $BUILDER_GROUP $BUILDER_USER

  cp -r /root /home/$BUILDER_USER
  chown -R $BUILDER_USER:$BUILDER_GROUP  /home/$BUILDER_USER

  chown -R $BUILDER_USER:$BUILDER_GROUP  /travis

  export HOME=/home/${BUILDER_USER}

  # Run the command as the specified user/group.
  exec sudo -E -u $BUILDER_USER "$@"

else
    # Just run the command as root.
    exec "$@"
fi
