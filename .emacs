		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;                                    ;;
		;;      Set-up the environment        ;;
		;;                                    ;;
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


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

;; Automatically pair brackets and string quotes
;; (add-to-list 'load-path "/Users/jankocizel/.emacs.d/elpa/autopair-20121123.1829/")
;; (require 'autopair)
;; (autopair-global-mode) ;; to enable in all buffers

;; Tags table list
(setq tags-table-list
      '("~/Documents/Dropbox"))

;; Evil mode
;; (add-to-list 'load-path "/Users/jankocizel/.emacs.d/elpa/evil-20131023.2315/")
;; (require 'evil)
;; (evil-mode 0)


;; Enable speed-bar
;; (when window-system          ; start speedbar if we're using a window system
;;   (speedbar t))

(add-to-list 'load-path "/Users/jankocizel/.emacs.d/elpa/move-text-20130506.1826/")
(require 'move-text)
(move-text-default-bindings)

;; Enable TERN (for javascript)

;; (add-to-list 'load-path "/opt/local/lib/node_modules/tern/emacs/")
;; (autoload 'tern-mode "tern.el" nil t)
;; ;; (add-hook 'js-mode-hook (lambda () (tern-mode t)))

;; (eval-after-load 'tern
;;   '(progn
;;      (require 'tern-auto-complete)
;;      (tern-ac-setup)));

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
(add-to-list 'load-path "~/elisp")
(add-to-list 'load-path "~/.emacs.d/")

;; Improve buffer switching experience
(iswitchb-mode 1)

;; Load org-reveal (installation directions can be found in
;; https://github.com/yjwen/org-reveal/blob/master/Readme.org)
;;(require 'ox-reveal)
;;(setq org-reveal-root "file:///Users/jankocizel/elisp/reveal.js")

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

      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      ;;                     ORG MODE CUSTOMIZATION                              ;;
      ;;                                                                         ;;
      ;;                                                                         ;;
      ;; Inspired by: http://orgmode.org/worg/org-tutorials/orgtutorial_dto.html ;;
      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Set to the location of your Org files on your local system
(setq org-directory "~/Documents/Dropbox/ORG/")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/Documents/Dropbox/ORG/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Documents/Dropbox/Apps/MobileOrg")

;; Define the file that will capture all random notes at the central location
(setq org-default-notes-file "/Users/jankocizel/Documents/Dropbox/ORG/NOTES.org")
(define-key global-map "\C-cc" 'org-capture)

;; Create org-mode capture templates (see http://orgmode.org/manual/Capture-templates.html and
;; http://stackoverflow.com/questions/11116712/using-properties-in-org-mode-capture-templates)
(setq org-capture-templates
      '(("\C-w" "Todo (work)" entry (file+headline "~/Documents/Dropbox/ORG/work.org" "Tasks")
	 "* TODO %?\n  %i\n  %a")
	("\C-p" "Todo (personal)" entry (file+headline "~/Documents/Dropbox/ORG/personal.org" "Tasks")
	 "* TODO %?\n  %i\n  %a")
	("\C-t" "Tips and Tricks" entry (file "~/Documents/Dropbox/ORG/tipsNtricks.org")
	 "* %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/Documents/Dropbox/ORG/journal.org")
	 "* %?\nEntered on %U\n  %i\n  %a")
	("w" "Writing log" table-line (file  "~/Documents/Dropbox/ORG/workrecord.org")
	 "|%U|%A||%?|" :prepend t :kill-buffer t)))

;; The following lines are always needed. Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode)) ; not needed since Emacs 22.2
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; Org-babel (allows evaluation of R code)


;; Disable asking for confirmation when evaluating code blocks
(setq org-confirm-babel-evaluate nil)

;; Define skeleton
					; See http://orgmode.org/worg/org-contrib/babel/examples/foo.org.html for the additional details
(define-skeleton org-skeleton
  "Header info for a emacs-org file."
  "Title: \n"
  "#+DATE:" str " \n"
  "#+TITLE:" str " \n"
  "#+AUTHOR: Janko Cizel\n"
  "#+email: j.cizel@vu.nl\n"
  "#+OPTIONS: texht:t\n"
  "#+LATEX_CLASS: article\n"
  "#+INFOJS_OPT: \n"
  "#+BABEL: :session *R* :cache yes :results output graphics :exports both :tangle yes \n"
  "-----"
  )
(global-set-key [C-S-f4] 'org-skeleton)


(setq org-agenda-files (list "~/Documents/Dropbox/ORG/work.org"
			     "~/Documents/Dropbox/ORG/personal.org"
			     "~/Documents/Dropbox/ORG/tipsNtricks.org"
			     "~/Documents/Dropbox/ORG/journal.org"))

;; Define keywords
(setq org-todo-keywords
      '((sequence "TODO(t)" "FEEDBACK(f)" "VERIFY(v)" "|" "DONE(d)")))


		 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		 ;;       TESTS OF NEW PACKAGES        ;;
		 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; AUCTEX
(add-to-list 'load-path "/Applications/Emacs.app/Contents/Resources/site-lisp")
(require 'tex-site)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-reftex)   ; with Emacs latex mode
(setq reftex-plug-into-auctex t)



;;  ess-r-data-view
;; (require 'ess-r-data-view)

;; expand-region package
;; (add-to-list 'load-path "/Users/jankocizel/.emacs.d/elpa/expand-region-20130911.319")
;; (require 'expand-region)
;; (global-set-key (kbd "C-=") 'er/expand-region)
;; (global-set-key (kbd "C--") 'er/contract-region)

;; Icicle package (very useful for auto completing commands after M-x)
;; (add-to-list 'load-path "~/.emacs.d/elpa/icicles-20130929.1722/")
;; (require 'icicles)
;; (icy-mode 1)

;; Icy overrides the IDO find file shortcul. set it right again
(global-set-key (kbd "C-x f") 'ido-find-file)

;; Projectile (helps with project management)
;; (add-to-list 'load-path "/Users/jankocizel/.emacs.d/elpa/projectile-20130826.1")
;; (require 'projectile)


;; EXPERIMENTAL: unbind SPACE and ? in minibuffer, to allow typing in completions with those chars
;; (add-hook 'minibuffer-setup-hook (lambda ()
;;                                    (define-key minibuffer-local-completion-map " " nil)
;;                                    (define-key minibuffer-local-must-match-map " " nil)
;;                                    (define-key minibuffer-local-completion-map "?" nil)
;;                                    (define-key minibuffer-local-must-match-map "?" nil)))


		 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		 ;;            MY MACROS               ;;
		 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; open a file at point after running the mdfind command
(fset 'open
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([1 67108896 5 134217847 24 6 25 return] 0 "%d")) arg)))

					; open a highlighted file
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

;; Imenu
;;(global-set-key (kbd "M-i") 'ido-goto-symbol)

		 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		 ;; CUSTOMIZATION OF EMACS FACES PARAMETERS ;;
		 ;;                                         ;;
		 ;; INCLUDES CUSTOMIZATION OF:              ;;
		 ;; (1) FONTS                               ;;
		 ;; (2) BACKGROUNGDS                        ;;
		 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :stipple nil :background "#eeeeec" :foreground "#2e3436" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 180 :width normal :foundry "apple" :family "Monaco")))))

;; Easily switch between minibuffer and main window
;; (see http://superuser.com/questions/132225/how-to-get-back-to-an-active-minibuffer-prompt-in-emacs-without-the-mouse)
(defun switch-to-minibuffer-window ()
  "switch to minibuffer window (if active)"
  (interactive)
  (when (active-minibuffer-window)
    (select-window (active-minibuffer-window))))
(global-set-key (kbd "<f7>") 'switch-to-minibuffer-window)


;; PYTHON IDE CONFIGURATION (SEE http://caisah.info/emacs-for-python/)

;; (add-hook 'python-mode-hook 'auto-complete-mode)
;; (add-hook 'python-mode-hook 'jedi:ac-setup)
;; (add-hook 'after-init-hook #'global-flycheck-mode)

;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(TeX-source-correlate-method (quote synctex))
;;  '(TeX-source-correlate-mode t)
;;  '(TeX-source-correlate-start-server t)
;;  '(TeX-view-program-selection (quote (((output-dvi style-pstricks) "dvips and PDF Viewer") (output-dvi "PDF Viewer") (output-pdf "Evince") (output-html "Safari")))))


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

;; Compile and view Latex document
;; see: http://stackoverflow.com/questions/14664829/emacs-auctex-prefix-arguments/14717941#14717941
;; (defun build-view ()
;;   (interactive)
;;   (if (buffer-modified-p)
;;       (progn
;; 	(let ((TeX-save-query nil))
;; 	  (TeX-save-document (TeX-master-file)))
;; 	(setq build-proc (TeX-command "LaTeX" 'TeX-master-file -1))
;; 	(set-process-sentinel  build-proc  'build-sentinel))
;;     (TeX-view)))

;; (defun build-sentinel (process event)
;;   (if (string= event "finished\n")
;;       (TeX-view)
;;     (message "Errors! Check with C-`")))

;; (add-hook 'LaTeX-mode-hook '(lambda () (local-set-key (kbd "<f2>") 'build-view)))
;; Sync between Skim and latex code
;; (define-key LaTeX-mode-map [M-S-mouse-1] 'TeX-view) ;

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

;; auto-yasnippet
;; (add-to-list 'load-path
;; 	     "/Users/jankocizel/.emacs.d/elpa/auto-yasnippet-20130820.959/")
;; (require 'auto-yasnippet)
;; (global-set-key (kbd "<f6>") 'aya-create)
;; (global-set-key (kbd "<f7>") 'aya-expand)

;;r snippets
;; (add-to-list 'load-path
;; 	     "/Users/jankocizel/.emacs.d/elpa/r-autoyas-0.28/")
;; (require 'r-autoyas)
;; (add-hook 'ess-mode-hook 'r-autoyas-ess-activate)

;; (add-to-list 'load-path "/Users/jankocizel/.emacs.d/elpa/yasnippet-bundle-0.6.1/")
;; (require 'yasnippet-bundle)

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

;; (add-hook 'TeX-mode-hook (lambda ()
;; 			   (set (make-local-variable 'rebox-style-loop) '(625 624))
;; 			   (set (make-local-variable 'rebox-min-fill-column) 80)
;; 			   (rebox-mode 1)))


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


;; Theme
;; (load-theme 'tango t)

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

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;;;;  Set IPython interpreter as default ;;;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (setq
;;  python-shell-interpreter "ipython"
;;  python-shell-interpreter-args ""
;;  python-shell-prompt-regexp "In \\[[0-9]+\\]: "
;;  python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
;;  python-shell-completion-setup-code
;;  "from IPython.core.completerlib import module_completion"
;;  python-shell-completion-string-code
;;  "';'.join(__IP.complete('''%s'''))\n"
;;  python-shell-completion-module-string-code "")

;; ; pymacs
;; (add-to-list 'load-path "~/.emacs.d/elpa/pymacs-0.25")
;; (autoload 'pymacs-apply "pymacs")
;; (autoload 'pymacs-call "pymacs")
;; (autoload 'pymacs-eval "pymacs" nil t)
;; (autoload 'pymacs-exec "pymacs" nil t)
;; (autoload 'pymacs-load "pymacs" nil t)
;; (autoload 'pymacs-autoload "pymacs")

;; ; ropemacs
;; (add-to-list 'load-path "~/.emacs.d/ropemacs-0.7")
;; (add-to-list 'load-path "~/.emacs.d/pymacs")
;; (require 'pymacs)
;; (pymacs-load "ropemacs" "rope-")



;; Enable isearch+ package
(add-to-list 'load-path "~/.emacs.d/elpa/isearch+-20130930.1644")
(eval-after-load "isearch" '(require 'isearch+))

(put 'upcase-region 'disabled nil)

;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(LaTeX-command "xelatex"))

;; node.js configuration
;; (add-to-list 'load-path "/Users/jankocizel/.emacs.d/elpa/nodejs-repl-20130521.42/")
;; (add-to-list 'load-path "/Users/jankocizel/.emacs.d/elpa/js-comint-20080530.957/")
;; (require 'js-comint)
;; (setq inferior-js-program-command "node --interactive")
;; (setq inferior-js-mode-hook
;;       (lambda ()
;;      ;; We like nice colors
;;         (ansi-color-for-comint-mode-on)
;;      ;; Deal with some prompt nonsense
;;         (add-to-list 'comint-preoutput-filter-functions
;;                      (lambda (output)
;;                        (replace-regexp-in-string ".*1G\.\.\..*5G" "..."
;;                                               (replace-regexp-in-string ".*1G.*3G" "&gt;" output))))))

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

;; Theme
;; (load-theme 'tango-dark t)
;; (load-theme 'manoj-dark)
(load-theme 'tango)

;; (if (not window-system);; Only use in tty-sessions.
;;      (progn
;;       (defvar arrow-keys-map (make-sparse-keymap) "Keymap for arrow keys")
;;       (define-key esc-map "[" arrow-keys-map)
;;       (define-key arrow-keys-map "A" 'previous-line)
;;       (define-key arrow-keys-map "B" 'next-line)
;;       (define-key arrow-keys-map "C" 'forward-char)
;;       (define-key arrow-keys-map "D" 'backward-char)))"]")))


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


;; Mouse mode in terminal
(add-hook 'term-setup-hook
	  '(lambda ()
	     (require 'mouse)
	     (xterm-mouse-mode t)
	     (defun track-mouse (e)) 
	     (setq mouse-sel-mode 1)))


;; Require ESS
(require 'ess-site)

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


;; Enable zotelo.el
(add-to-list 'load-path "/Users/jankocizel/.emacs.d/elpa/zotelo-20130428.2053/")
(require 'zotelo)
(add-hook 'TeX-mode-hook 'zotelo-minor-mode)
(add-hook 'org-mode-hook 'zotelo-minor-mode)

;; (define-key org-mode-map (kbd "C-c (") 'org-mode-reftex-search))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/Documents/Dropbox/Projects/EU_bank_exits/Literature/reviews.org" "~/Documents/Dropbox/ORG/work.org" "~/Documents/Dropbox/ORG/personal.org" "~/Documents/Dropbox/ORG/tipsNtricks.org" "~/Documents/Dropbox/ORG/journal.org")))
 '(org-export-backends (quote (ascii html icalendar latex md)))
 '(safe-local-variable-values (quote ((zotero-collection . #("0" 0 1 (name "*ALL*")))))))


;; Enable jade-mode
(add-to-list 'load-path "/Users/jankocizel/.emacs.d/elpa/jade-mode-20131018.1010")
(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))
;; (add-to-list 'load-path "")
;; (require 'sws-mode)


;; ENABLE EMACS FOR PYTHON
(load-file "~/.emacs.d/emacs-for-python/epy-init.el")
(add-to-list 'load-path "~/.emacs.d/emacs-for-python/") ;; tell where to load
;; ;; the various files
;; (require 'epy-setup)      ;; It will setup other loads, it is required!
;; (require 'epy-python)     ;; If you want the python facilities [optional]
;; (require 'epy-completion) ;; If you want the autocompletion settings [optional]
;; (require 'epy-editing)    ;; For configurations related to editing [optional]
;; (require 'epy-bindings)   ;; For my suggested keybindings [optional]
;; (require 'epy-nose)       ;; For nose integration


;; HIGHLIGHT INDENTATION
;; (add-to-list 'load-path "/Users/jankocizel/.emacs.d/elpa/indent-guide-20140913.435/")
;; (require 'indent-guide)
;; (indent-guide-global-mode)
;; (setq indent-guide-recursive t)


;; KEYBINDINGS TO CHANGE WINDOW SIZES
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)



(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
;; (add-to-list 'auto-mode-alist '("\\.Rmd\\'" . markdown-mode))

(require 'poly-R)
(require 'poly-markdown)
