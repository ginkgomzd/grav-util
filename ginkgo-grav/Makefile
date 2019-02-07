include make-do.mk

$(call require-env, PUBLIC_HTML)
cmd_plugin = ${PUBLIC_HTML}/bin/plugin
cmd_gpm = ${PUBLIC_HTML}/bin/gpm

all: skelington admin-login

admin-login: skelington
	${cmd_plugin} login new-user -P b -N 'Ginkgo Street' -e docs@ginkgostreet.com -u admin -p '0Use the source Luke!'

skelington:
	${cmd_gpm} install -y admin archives email error external_links featherlight feed form git-sync \
	login markdown-fontawesome page-inject pagination problems relatedpages simplesearch sitemap taxonomylist \
	youtube learn2-git-sync
	cd ${PUBLIC_HTML}/user/plugins && git clone git@github.com:fulltrucker/modified-date.git
	

