		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;                                    ;;
		;;      Set-up the environment        ;;
		;;                                    ;;
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-theme 'tango)

;; Redefine key signals for terminal mode
(add-hook 'term-setup-hook
  '(lambda ()
     (define-key function-key-map "\e[1;9A" [M-up])
     (define-key function-key-map "\e[1;9B" [M-down])
     (define-key function-key-map "\e[1;9C" [M-right])
     (define-key function-key-map "\e[1;9D" [M-left])
     (define-key function-key-map "\e[1;5A" [C-up])
     (define-key function-key-map "\e[1;5B" [C-down])
     (define-key function-key-map "\e[1;5C" [C-right])
     (define-key function-key-map "\e[1;5D" [C-left])
     (define-key function-key-map "\e[1;XX" [C-return])
     (define-key function-key-map "\e[1;Y1" (kbd "C-="))
     (define-key function-key-map "\e[1;Y2" (kbd "C--"))
     (define-key function-key-map "\e[1;l1" (kbd "C-l"))
     (define-key function-key-map "\e[1;S9" [S-return])
     (define-key function-key-map "\e[1;R1" [C-M-right])
     (define-key function-key-map "\e[1;R2" [C-M-left])
     ))

;; KEYBINDINGS TO CHANGE WINDOW SIZES
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; Require ESS
(require 'ess-site)

;; Mouse mode in terminal
;; (add-hook 'term-setup-hook
;; 	  '(lambda ()
;; 	     (require 'mouse)
;; 	     (xterm-mouse-mode t)
;; 	     (defun track-mouse (e)) 
;; 	     (setq mouse-sel-mode 1)))

;; Disable toolbar mode
(if (display-graphic-p)
    (tool-bar-mode -1)
  (normal-erase-is-backspace-mode 0)) 	; value should be == 1 if in iterm2, and
					; 0 if in Terminal.app

;; Add electric-pair-mode
;; turn on automatic bracket insertion by pairs. New in emacs 24
(electric-pair-mode 1)

;; Set the highlighting of the current line on
(global-hl-line-mode 1)
;; (set-face-background hl-line-face "gray70")
(set-face-background hl-line-face "darkseagreen2")

;; Set default window size
(add-to-list 'default-frame-alist '(height . 80))
(add-to-list 'default-frame-alist '(width . 180))

;; Locate files with mdfind
(setq locate-command "mdfind")


;; Tags table list
(setq tags-table-list
      '("~/Documents/Dropbox"))

(add-to-list 'load-path "/Users/jankocizel/.emacs.d/elpa/move-text-20130506.1826/")
(require 'move-text)
(move-text-default-bindings)


    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;                                                                  ;;
    ;;               Install Other elisp packages                       ;;
    ;; (See http://edward.oconnor.cx/2005/09/installing-elisp-files for ;;
    ;; further directions)                                              ;;
    ;;                                                                  ;;
    ;; ALSO SEE:                                                        ;;
    ;; http://ergoemacs.org/emacs/emacs_installing_packages.html        ;;
    ;;                                                                  ;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Set the package repositories that should be looked for when using MELPA
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
			 ("SC"   . "http://joseito.republika.pl/sunrise-commander/")))

;; Increase font size
(set-face-attribute 'default nil :height 120)

;; Tell emacs where is your personal elisp lib dir
;; this is default dir for extra packages
;; (add-to-list 'load-path "~/elisp")
(add-to-list 'load-path "~/.emacs.d/")

;; Improve buffer switching experience
(iswitchb-mode 1)

;; enable ido completion features
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)


		     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		     ;;     Auto-complete.el       ;;
		     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; This is what is required to make the installation of auto-complete package to be finalised.
;; (add-to-list 'load-path "/Users/jankocizel/.emacs.d/elpa/auto-complete-20130724.1750/")
(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
(global-auto-complete-mode t)

(setq ac-auto-start 2)
(setq ac-ignore-case nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                             KEY BINDINGS                                                 ;;
;;                                                                                          ;;
;;                                                                                          ;;
;; See also: http://www.masteringemacs.org/articles/2011/02/08/mastering-key-bindings-emacs ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-c r") 'align-regexp)

;; Switching between windows
(global-set-key [C-left] 'windmove-left)          ; move to left windnow
(global-set-key [C-right] 'windmove-right)        ; move to right window
(global-set-key [C-up] 'windmove-up)              ; move to upper window
(global-set-key [C-down] 'windmove-down)          ; move to downer window


		 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		 ;;       TESTS OF NEW PACKAGES        ;;
		 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; AUCTEX
(add-to-list 'load-path "/Applications/Emacs.app/Contents/Resources/site-lisp")
(require 'tex-site)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-reftex)   ; with Emacs latex mode
(setq reftex-plug-into-auctex t)


;; Icy overrides the IDO find file shortcul. set it right again
(global-set-key (kbd "C-x f") 'ido-find-file)

		 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		 ;;            MY MACROS               ;;
		 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; open a file at point after running the mdfind command
(fset 'open
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([1 67108896 5 134217847 24 6 25 return] 0 "%d")) arg)))

;; open a highlighted file
(fset 'open-region
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([134217847 24 6 25 return] 0 "%d")) arg)))

;; Copy rectangle
(defun my-copy-rectangle (start end)
  "Copy the region-rectangle instead of `kill-rectangle'."
  (interactive "r")
  (setq killed-rectangle (extract-rectangle start end)))

(global-set-key (kbd "C-x r M-w") 'my-copy-rectangle)


;; Kill ring navigation
(add-to-list 'load-path "/Users/jankocizel/.emacs.d/elpa/browse-kill-ring-20140915.616/")
(require 'browse-kill-ring)
(browse-kill-ring-default-keybindings)

		 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		 ;; CUSTOMIZATION OF EMACS FACES PARAMETERS ;;
		 ;;                                         ;;
		 ;; INCLUDES CUSTOMIZATION OF:              ;;
		 ;; (1) FONTS                               ;;
		 ;; (2) BACKGROUNGDS                        ;;
		 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Easily switch between minibuffer and main window
;; (see http://superuser.com/questions/132225/how-to-get-back-to-an-active-minibuffer-prompt-in-emacs-without-the-mouse)
(defun switch-to-minibuffer-window ()
  "switch to minibuffer window (if active)"
  (interactive)
  (when (active-minibuffer-window)
    (select-window (active-minibuffer-window))))
(global-set-key (kbd "<f7>") 'switch-to-minibuffer-window)

		    ;;;;;;;;;;;;;;;;;;;;;;;;;;;
		    ;; AUCTeX Configuration  ;;
		    ;;                       ;;
		    ;; Notes:                ;;
		    ;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; See: http://stackoverflow.com/questions/16004805/create-a-key-binding-for-latex-jump-to-pdf-synctex
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq LaTeX-syntactic-comments t)

(global-set-key (kbd "<f7>") 'TeX-command-master)	; need to set a default for this to work.
(global-set-key (kbd "<f8>") 'TeX-view)			; jump to *.pdf with synctex (or C-c C-v)
(global-set-key (kbd "<f9>") 'TeX-clean)		; clean, but leave the *.pdf

(setq TeX-PDF-mode t)
(setq TeX-view-program-selection '((output-pdf "Skim")))

(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
(setq TeX-source-correlate-method 'synctex)

(add-hook 'LaTeX-mode-hook
	  (lambda()
	    (add-to-list 'TeX-expand-list
			 '("%q" skim-make-url))))

(defun skim-make-url () (concat
			 (TeX-current-line)
			 " "
			 (expand-file-name (funcall file (TeX-output-extension) t)
					   (file-name-directory (TeX-master-file)))
			 " "
			 (buffer-file-name)
			 ))

(setq TeX-view-program-list
      '(("Skim" "/Applications/Skim.app/Contents/SharedSupport/displayline %q")))


;; Set auto fill to 80 characters
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
(add-hook 'latex-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq-default fill-column 80)

		  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		  ;;            YASNIPPETS              ;;
		  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path
	     "/Users/jankocizel/.emacs.d/elpa/yasnippet-20130907.1855/")
(require 'yasnippet)
(yas-global-mode 0)

		 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		 ;;          Rebox2 comments           ;;
		 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "/Users/jankocizel/.emacs.d/elpa/rebox2-20121113.2100/")
(setq rebox-style-loop '(11 13 15 21 23 25 31 33 35 41 43 45))
(require 'rebox2)

;; setup rebox for emacs-lisp
(add-hook 'emacs-lisp-mode-hook (lambda ()
				  (set (make-local-variable 'rebox-style-loop) '(25 17 21))
				  (set (make-local-variable 'rebox-min-fill-column) 40)
				  (rebox-mode 1)))
(add-hook 'ess-mode-hook (lambda ()
			   (set (make-local-variable 'rebox-style-loop) '(11 13 15 21 23 25 31 33 35 41 43 45))
			   (set (make-local-variable 'rebox-min-fill-column) 80)
			   (rebox-mode 1)))


		 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		 ;;      DIRED RELATED THINGS          ;;
		 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Dired+
(package-initialize)
(add-to-list 'load-path "/Users/jankocizel/.emacs.d/elpa dired+-20130927.600/")
(require 'dired+)


;; Hack dired to launch files with 'l' key.  Put this in your ~/.emacs file
;; see http://omniorthogonal.blogspot.nl/2008/05/useful-emacs-dired-launch-hack.html
(defun dired-launch-command ()
  (interactive)
  (dired-do-shell-command
   (case system-type
     (gnu/linux "gnome-open") ;right for gnome (ubuntu), not for other systems
     (darwin "open"))
   nil
   (dired-get-marked-files t current-prefix-arg)))

(setq dired-load-hook
      (lambda (&rest ignore)
	(define-key dired-mode-map
	  kbd("C-c C-l") 'dired-launch-command)))


;; Open files with whitespace in the path
;; EXPERIMENTAL: unbind SPACE and ? in minibuffer, to allow typing in completions with those chars
(add-hook 'minibuffer-setup-hook (lambda ()
                                   (define-key minibuffer-local-completion-map " " nil)
                                   (define-key minibuffer-local-must-match-map " " nil)
                                   (define-key minibuffer-local-completion-map "?" nil)
                                   (define-key minibuffer-local-must-match-map "?" nil)))

;; Skim does not work with paths with spaces
;; http://tex.stackexchange.com/questions/11613/launching-an-external-pdf-viewer-from-emacs-auctex-on-a-mac-osx-fails
(defun skim-make-url ()
  (concat
   (TeX-current-line)
   " \""
   (expand-file-name (funcall file (TeX-output-extension) t)
             (file-name-directory (TeX-master-file)))
   "\" \""
   (buffer-file-name)
   "\""))


		     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		     ;;     PYTHON AUTOCONFIGURATION       ;;
		     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (add-to-list 'load-path "/Users/jankocizel/.emacs.d/elpa/pymacs-0.25/")
;; (autoload 'python-mode "python-mode" "Python Mode." t)
;; (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;; (add-to-list 'interpreter-mode-alist '("python" . python-mode))
;; (require 'python-mode)
;; (autoload 'pymacs-apply "pymacs")
;; (autoload 'pymacs-call "pymacs")
;; (autoload 'pymacs-eval "pymacs" nil t)
;; (autoload 'pymacs-exec "pymacs" nil t)
;; (autoload 'pymacs-load "pymacs" nil t)
;; (pymacs-load "ropemacs" "rope-")
;; (setq ropemacs-enable-autoimport t)

;; (require 'auto-complete)
;; (global-auto-complete-mode t)

;; see http://www.kurup.org/blog/2012/10/15/emacs-autocomplete-stumbles-on-yasnippet/
;; (delq 'ac-source-yasnippet ac-sources)


;; Use ibuffer by default
(defalias 'list-buffers 'ibuffer)


;; Customize movemente between different frames
;; (add-to-list 'load-path "/Users/jankocizel/.emacs.d/elpa/framemove-20130328.1133/")
;; (require 'framemove)
;; ;; (framemove-default-keybindings) ;; default prefix is Meta
;; (global-set-key (kbd "<C-M-right>") 'fm-right-frame)
;; (global-set-key (kbd "<C-M-left>") 'fm-left-frame)
;; (global-set-key (kbd "<C-M-up>") 'fm-up-frame)
;; (global-set-key (kbd "<C-M-down>") 'fm-down-frame)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 180 :width normal :foundry "apple" :family "Monaco")))))


;; Set easy key for eval buffer
(global-set-key (kbd "C-<f5>") 'eval-buffer)


;; Recreate *scratch* buffer every time it is killed
;; If the *scratch* buffer is killed, recreate it automatically
;; FROM: Morten Welind
;;http://www.geocrawler.com/archives/3/338/1994/6/0/1877802/
(save-excursion
  (set-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode)
  (make-local-variable 'kill-buffer-query-functions)
  (add-hook 'kill-buffer-query-functions 'kill-scratch-buffer))

(defun kill-scratch-buffer ()
  ;; The next line is just in case someone calls this manually
  (set-buffer (get-buffer-create "*scratch*"))
  ;; Kill the current (*scratch*) buffer
  (remove-hook 'kill-buffer-query-functions 'kill-scratch-buffer)
  (kill-buffer (current-buffer))
  ;; Make a brand new *scratch* buffer
  (set-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode)
  (make-local-variable 'kill-buffer-query-functions)
  (add-hook 'kill-buffer-query-functions 'kill-scratch-buffer)
  ;; Since we killed it, don't let caller do that.
  nil)


;; Make ioccur keybinding
;; Enable isearch+ package
(add-to-list 'load-path "~/.emacs.d/elpa/isearch+-20130930.1644")
(eval-after-load "isearch" '(require 'isearch+));; Enable isearch+ package

(define-key isearch-mode-map (kbd "C-o") 'isearch-occur)

;; Set interface to ack
(add-to-list 'load-path "/Users/jankocizel/.emacs.d/elpa/ack-and-a-half-20130815.1917")
(require 'ack-and-a-half)
(defalias 'ack 'ack-and-a-half)
(defalias 'ack-same 'ack-and-a-half-same)
(defalias 'ack-find-file 'ack-and-a-half-find-file)
(defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)


		   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		   ;;      Enable matlab-mode            ;;
		   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/matlab-emacs")
(load-library "matlab-load")

(put 'upcase-region 'disabled nil)


		   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		   ;; JAVASCRIPT IDE SETUP               ;;
		   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load "js-config.el")
(require 'sws-mode)
(require 'jade-mode)    
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

;; Set the highlighting of region to yelow
(set-face-background 'region "yellow")

;; imenu-anywhere
(add-to-list 'load-path "/Users/jankocizel/.emacs.d/elpa/imenu-anywhere-20130509.2231/")
(global-set-key (kbd "C-.") 'imenu-anywhere)

;; for smooth scrolling and disabling the automatical recentering of emacs when moving the cursor
(setq scroll-margin 1
      scroll-conservatively 0
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)

;; get rid of annoying scrolling
(setq auto-window-vscroll nil)
(put 'downcase-region 'disabled nil)



;; Enable undo-tree package
(add-to-list 'load-path "/Users/jankocizel/.emacs.d/elpa/undo-tree-20130812.1224/")
(require 'undo-tree)
(global-undo-tree-mode)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;        el-get package system       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Sunrise Commander                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "/Users/jankocizel/.emacs.d/elpa/sunrise-commander-6.448/")
(require 'sunrise-commander)




;; Enable ipython
;; (defvar server-buffer-clients)
;; (when (and (fboundp 'server-start) (string-equal (getenv "TERM") 'xterm))
;;   (server-start)
;;   (defun fp-kill-server-with-buffer-routine ()
;;     (and server-buffer-clients (server-done)))
;;   (add-hook 'kill-buffer-hook 'fp-kill-server-with-buffer-routine))

;; (add-to-list 'load-path "/Users/jankocizel/.emacs.d/elpa/ipython-2927/")
;; (require 'ipython)
;; (require 'python)


;; IPython notebook
;; (add-to-list 'load-path "/Users/jankocizel/.emacs.d/elpa/ein-20130710.2114/")
;; (require 'ein)

;; dictionary.el
(add-to-list 'load-path "/Users/jankocizel/.emacs.d/elpa/dictionary-20131005.1021/")
(require 'dictionary)
;; press F8 on keypad to lookup definition
(global-set-key (kbd "<f8>") 'dictionary-lookup-definition)
(global-set-key (kbd "<f9>") 'dictionary-search)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; RefTex setup for org-mode                                                                          ;;
;;                                                                                                    ;;
;; see                                                                                                ;;
;; http://tincman.wordpress.com/2011/01/04/research-paper-management-with-emacs-org-mode-and-reftex/  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun org-mode-reftex-search ()
  ;;jump to the notes for the paper pointed to at from reftex search
  (interactive)
  (org-open-link-from-string (format "[[notes:%s]]" (reftex-citation t))))

(defun org-mode-reftex-setup ()
  (load-library "reftex")
  (and (buffer-file-name) (file-exists-p (buffer-file-name))
       (progn
	 (global-auto-revert-mode t)
	 (reftex-parse-all)
	 ;;add a custom reftex cite format to insert links
	 (reftex-set-cite-format
	  '((?b . "[[bib:%l][%l-bib]]")
	    (?n . "[[note:%l][%l-note]]")
	    (?t . "%t")
	    (?h . "* %t. (%A, %y, %j) \n:PROPERTIES:\n:Custom_ID: %l\n:END:\n[[bib:%l][%l-bib]]")))))
  (define-key org-mode-map (kbd "C-c )") 'reftex-citation)
  (define-key org-mode-map (kbd "C-c (") 'org-mode-reftex-search))

(add-hook 'org-mode-hook 'org-mode-reftex-setup)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Obtained from:                                                                                                             ;;
;;                                                                                                                            ;;
;; http://www-public.it-sudparis.eu/~berger_o/weblog/2012/03/23/how-to-manage-and-export-bibliographic-notesrefs-in-org-mode/ ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-rtcite-export-handler (path desc format)
  (message "my-rtcite-export-handler is called : path = %s, desc = %s, format = %s" path desc format)
  (let* ((search (when (string-match "::#?\\(.+\\)\\'" path)
                   (match-string 1 path)))
         (path (substring path 0 (match-beginning 0))))
    (cond ((eq format 'latex)
           (if (or (not desc) 
                   (equal 0 (search "rtcite:" desc)))
               (format "\\cite{%s}" search)
             (format "\\cite[%s]{%s}" desc search))))))

(require 'org)

(org-add-link-type "rtcite" 
                   'org-bibtex-open
                   'my-rtcite-export-handler)


	     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	     ;; Enable zotelo.el                   ;;
	     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "/Users/jankocizel/.emacs.d/elpa/zotelo-20130428.2053/")
(require 'zotelo)
(add-hook 'TeX-mode-hook 'zotelo-minor-mode)
(add-hook 'org-mode-hook 'zotelo-minor-mode)


;; Enable jade-mode
(add-to-list 'load-path "/Users/jankocizel/.emacs.d/elpa/jade-mode-20131018.1010")
(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))
;; (add-to-list 'load-path "")
;; (require 'sws-mode)



(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
;; (add-to-list 'auto-mode-alist '("\\.Rmd\\'" . markdown-mode))

