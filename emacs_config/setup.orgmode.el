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
