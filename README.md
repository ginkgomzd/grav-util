----

# Ginkgo Grav-Util

Helper for creating grav-instances in the Ginkgo Street Documentation Server.

## Configure

Supply configurations by exporting variables to your shell session:
```shell
export USER_NAME=docs
export PUBLIC_HTML=/var/www/docs
```

`USER_NAME` is required to be set for all usage. This should exist under /home, i.e., it should be a system user created using `docs-user`.

Override the default install location (`/home/$USER_NAME/public_html`) by setting `PUBLIC_HTML`.

### Create

Create a grav instance for the docs-user, "user":
`grav-util create USER_NAME=user`

### Update

Call gpm selfupgrade to upgrade the grav release.
`grav-util update USER_NAME=user`


----
This is a make-do module: https://github.com/ginkgostreet/make-do.git
