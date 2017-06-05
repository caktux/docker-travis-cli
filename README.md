# docker-travis-cli

Dockerized version of [Travis Command Line Client](https://github.com/travis-ci/travis.rb)

[![](https://images.microbadger.com/badges/version/jcfr/travis-cli.svg)](https://microbadger.com/images/jcfr/travis-cli "Get your own version badge on microbadger.com")

## Installation

This image does not need to be run manually. Instead, there is a helper script
to execute it.

To install the helper script, copy the script `travis-cli` in your `PATH`:

```shell
curl https://raw.githubusercontent.com/jcfr/docker-travis-cli/master/travis-cli.sh \
  -o ~/bin/travis-cli && \
chmod +x ~/bin/travis-cli
```

## Examples

### Encrypting environment variables
```shell
travis-cli encrypt SECRET=123 -r org/repo
```

### Interactive setup of `.travis.yml`
```shell
travis-cli setup pypi
```

### Validating your `.travis.yml` with travis lint
```shell
travis-cli lint .travis.yml
```

## Usage

```shell
$ travis-cli help
Usage: travis COMMAND ...

Available commands:

	accounts       displays accounts and their subscription status
	branches       displays the most recent build for each branch
	cache          lists or deletes repository caches
	cancel         cancels a job or build
	console        interactive shell
	disable        disables a project
	enable         enables a project
	encrypt        encrypts values for the .travis.yml
	encrypt-file   encrypts a file and adds decryption steps to .travis.yml
	endpoint       displays or changes the API endpoint
	env            show or modify build environment variables
	help           helps you out when in dire need of information
	history        displays a projects build history
	init           generates a .travis.yml and enables the project
	lint           display warnings for a .travis.yml
	login          authenticates against the API and stores the token
	logout         deletes the stored API token
	logs           streams test logs
	monitor        live monitor for what's going on
	open           opens a build or job in the browser
	pubkey         prints out a repository's public key
	raw            makes an (authenticated) API call and prints out the result
	report         generates a report useful for filing issues
	repos          lists repositories the user has certain permissions on
	requests       lists recent requests
	restart        restarts a build or job
	settings       access repository settings
	setup          sets up an addon or deploy target
	show           displays a build or job
	sshkey         checks, updates or deletes an SSH key
	status         checks status of the latest build
	sync           triggers a new sync with GitHub
	token          outputs the secret API token
	version        outputs the client version
	whatsup        lists most recent builds
	whoami         outputs the current user

run `/usr/local/bundle/bin/travis help COMMAND` for more infos
```

## Maintenance

To rebuild the image:

```shell
git clone git://github.com/jcfr/docker-travis-cli
make build
```

To publish the image:

```shell
docker login -u <user> -p <password>
make push
```

---

Credits go to [sdt/docker-raspberry-pi-cross-compiler](https://github.com/sdt/docker-raspberry-pi-cross-compiler), who invented the base of the dockerized script.

