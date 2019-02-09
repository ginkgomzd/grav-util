----
# Ginkgo Grav-Util

Helper for creating grav-instances in the Ginkgo Street Documentation Server.

## Configure

Supply configurations by exporting variables to your shell session:
```shell
export user_name=docs
export PUBLIC_HTML=/var/www/docs
```

`user_name` is required to be set for all usage. This should exist under /home, i.e., it should be a system user created using `docs-user`.

Override the default install location (`/home/$user_name/public_html`) by setting `PUBLIC_HTML`.

### Create

Create a grav instance for the docs-user, "user":
`grav-util create user_name=user`

### Update

Call gpm selfupgrade to upgrade the grav release.
`grav-util update user_name=user`

----
This is a make-do module: https://github.com/ginkgostreet/make-do.git
----
