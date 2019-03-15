
# Ginkgo Grav-Util

Helper for creating grav-instances in the Ginkgo Street Documentation Server.

Some commands are used on the central server only. Others are useful for working in a local copy of the Project Lab.

## New Feature
Generate Project Lab Feature Boilerplate. Creates each section as a grav page collection listing. Sets cannonical URL's appropriately.

```shell
grav-util new-feature TITLE='Super Snazzy Whiz Bang'
```
It is safe to run `new-feature` on an existing feature because only missing files will be created.

## Configure (Server Only)

Supply configurations by exporting variables to your shell session:
```shell
export USER_NAME=docs
export PUBLIC_HTML=/home/${USER_NAME}/public_html
```

`USER_NAME` is required to be set for creating a `project-lab`. This will be created under /home, i.e., it should be a system user created using `docs-user`.

Override the default install location (`/home/$USER_NAME/public_html`) by setting `PUBLIC_HTML`.

## Project Lab (Server Only)

Create a grav instance for the docs-user, "user":
`grav-util project-lab USER_NAME=user`

## Create

`grav-util create`

Create a working environment to update the Project Lab content

## Project Lab Development Environment

Create a local copy of a Project Lab to update content from. Commits pushed to GitHub will automatically be published to the Project Lab.

NOTE: standard practice is to include a dev-environment config in the repo. So, confirm that you do not have a loclahost config before using this.

```shell
export PUBLIC_HTML=project-dir 
grav-util dev-env
export PROJ_LAB_REPO=git@github.com:/ginkgostreet/<project-repo>
grav-util proect-lab-repo
```
Dev Env configs are contained in `user/localhost`.

## Clone the Intance Repo
Remove the default `user/` directory and replace it with the git-sync'd repo:
```shell
cd project-dir/
rm -rf user/
git clone git@github.com:ginkgostreet/fis-docs.git user
```

## Serve

`grav-util serve`

Start the PHP builtin server for a development instance. Uses `PUBLIC_HTML`.

## Update

Call gpm selfupgrade to upgrade the grav release.
`grav-util update USER_NAME=user`

----
This is a make-do module: https://github.com/ginkgostreet/make-do.git
