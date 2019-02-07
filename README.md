
# Ginkgo Grav-Util

Helper for creating grav-instances in the Ginkgo Street Documentation Server.

This is a make-do module: https://github.com/ginkgostreet/make-do.git

## Usage

`project` is required to be set for all usage. This should exist under /home, i.e., it should be a system user created using `docs-user`.

### install

Create a grav instance for the docs-user, "user":
`grav-util install project=user`

### update

Call gpm selfupgrade to upgrade the grav release.
`grav-util update project=user`
