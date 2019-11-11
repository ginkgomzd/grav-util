include mdo-modules.mk
include mdo-require.mk

$(call require-env, PUBLIC_HTML)
CMD_PLUGIN = ${PUBLIC_HTML}/bin/plugin
CMD_GPM = ${PUBLIC_HTML}/bin/gpm

all: skelington admin-login ginkgo-rtfm

admin-login: skelington
	cd ${PUBLIC_HTML} && \
	${CMD_PLUGIN} login new-user -P b -N 'Ginkgo Street' -e docs@ginkgostreet.com -u admin -p '0Use the source Luke!'

# Ginkgo Docs Grav Plugin Install Profile.
# composer is sometimes behind on releases, so upgrade before installing plugins
skelington: self-upgrade
	cd ${PUBLIC_HTML} && \
	${CMD_GPM} install -n admin archives email error external_links featherlight feed form git-sync \
	login markdown-fontawesome page-inject pagination problems relatedpages simplesearch sitemap taxonomylist \
	youtube learn2-git-sync

ginkgo-rtfm:
	cd ${PUBLIC_HTML}/user/themes && \
	git clone git@github.com:ginkgostreet/grav-theme-ginkgo-rtfm ginkgo-rtfm

self-upgrade:
	cd ${PUBLIC_HTML} && \
	${CMD_GPM} selfupgrade -yf

dev-env:
	cp -r $(THIS_DIR)/assets/localhost ${PUBLIC_HTML}/user/localhost
