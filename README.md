
# Ginkgo Grav-Util

Helper for creating grav-instances in the Ginkgo Street Documentation Server.

Some commands are used on the central server only. Others are useful for working in a local copy of the Project Lab.

Requires [PHP Composer](https://getcomposer.org).

## Configure Commands
You can supply values each time you call the command by setting the shell variable.

Optionally, export variables to your shell session to avoid repeating yourself:
```shell
export USER_NAME=docs
export PUBLIC_HTML=/home/${USER_NAME}/public_html
```

`USER_NAME` is required to be set for creating a `project-lab`. This will be created under /home, i.e., it should be a system user created using `docs-user`.

Override the default install location (`/home/$USER_NAME/public_html`) by setting `PUBLIC_HTML`.


## Local Working Copy Setup

A local copy lets you preview changes and use a git workflow to collaborate with others. Pushes to the GitHub repo will automatically be published to the central server.

Grav supports environment-specific config. These are identified by the hostname used to access the site, e.g. localhost, or docs.ginkgo.st/~docs. Dev Env configs are contained in `user/localhost`.

Replace `<project-repo>` below with the proper repo URL. 
```shell
export PUBLIC_HTML=project-dir 
export PROJ_LAB_REPO=git@github.com:/ginkgostreet/<project-repo>

grav-util create
grav-util dev-env
```

The working copy setup consists of:
 - a fresh install of grav
 - check-out the repo
 - creates an admin user

## Command Reference
### New Feature
Generate Project Lab Feature Boilerplate. Creates each section as a grav page collection listing. Sets cannonical URL's appropriately.

```shell
grav-util new-feature TITLE='Super Snazzy Whiz Bang'
```
It is safe to run `new-feature` on an existing feature because only missing files will be created.


### Project Lab (Server Only)

Create a grav instance for the docs-user, "user":
`grav-util project-lab USER_NAME=user`

### Create Grav Instance

`grav-util create`

Install a fresh copy of Grav with the Project Lab install profile (RTFM theme).

### Serve Locally

`grav-util serve`

Start the PHP builtin server for a development instance. Uses `PUBLIC_HTML`.

### Update

Call gpm selfupgrade to upgrade the grav release.
`grav-util update USER_NAME=user`

----
This is a make-do module: https://github.com/ginkgostreet/make-do.git
