
# Ginkgo Grav-Util

Helper for creating grav-instances in the Ginkgo Street Documentation Server.

Some commands are used on the central server only. Others are useful for working in a local copy of the Project Lab.

Requires Gnu Make, [PHP Composer](https://getcomposer.org), and [GinkgoStreet/Make-do](https://github.com/ginkgostreet/make-do)

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

### Serve Locally

A stand-alone command is installed along with grav-util to use the PHP built-in server for a development environment.

From the web-root:
`serve-grav`

## Generate Document Starters

Generate Project Lab document boilerpalte. Creates each section as a grav page collection listing. Sets cannonical URL's appropriately.

### Available Starters
Get the list of available templates using: `grav-util list-tpls`

Document starters require the `TITLE` be provided.

```shell
grav-util new-feature TITLE='Super Snazzy Whiz Bang'
```
If a requested files already exist, only missing files will be created.

## Adding Document Starter Templates
New templates can be added by adding a directory that contains the templates to the assets folder of this module. If the naming convention is followed, `new-*`, then that is all that is required.

If derrived or programmatic values are needed for tokens in the templates, you will have to fork this module and declare the logic. Any token can be used in a template so long as an environment variable of that name will be available. Make automatically exports any variables present, so you don't need to explicitly export variables to use them in the templates.

## Project Lab (Server Only)

Create a grav instance for the docs-user, "user":
`grav-util project-lab USER_NAME=user`

## Update

Call gpm selfupgrade to upgrade the grav release.
`grav-util update USER_NAME=user`

----
This is a make-do module: https://github.com/ginkgostreet/make-do.git
