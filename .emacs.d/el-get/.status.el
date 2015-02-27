((ack status "installed" recipe
      (:name ack :type http :localname "ack.el" :url "http://repo.or.cz/w/ShellArchive.git?a=blob_plain;hb=HEAD;f=ack.el" :shallow nil :description "Use ack where you might usually use grep." :features ack))
 (el-get status "installed" recipe
	 (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "4.stable" :pkgname "dimitri/el-get" :features el-get :info "." :load "el-get.el"))
 (essh status "installed" recipe
       (:name essh :auto-generated t :type emacswiki :description "a set of commands that emulate for bash what ESS is to R." :website "https://raw.github.com/emacsmirror/emacswiki.org/master/essh.el"))
 (magit status "removed" recipe nil)
 (nxhtml status "removed" recipe nil)
 (webgen-mode status "installed" recipe
	      (:name webgen-mode :auto-generated t :type emacswiki :description "webgen mode" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/webgen-mode.el"))
 (zencoding-mode status "installed" recipe
		 (:name zencoding-mode :description "Unfold CSS-selector-like expressions to markup" :type github :pkgname "rooney/zencoding" :features zencoding-mode)))
