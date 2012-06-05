(require 'fixme-mode)
(require 'clojure-mode)

(defun turn-on-paredit () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'turn-on-paredit)
(add-to-list 'auto-mode-alist '("\.cljs$" . clojure-mode))

;;
;;------------------------------------------------------------------------------
;; LISP / Clojure Hacking Tools:
;;------------------------------------------------------------------------------
;;
;; SLIME - Superior Lisp Interaction Mode for Emacs
;;         As taught in Peter Seibel's "Practical Common Lisp"
;;(setq inferior-lisp-program "/usr/bin/clisp")
;;
;; The slime directory is a clone of the repo at: git://git.boinkor.net/slime.git
;; Clojure mode is from: clone git://github.com/jochu/clojure-mode.git
;; Swank-clojure is from: clone git://github.com/jochu/swank-clojure.git
;;
;;
(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)
;;(require 'paredit)

(add-to-list 'load-path (concat dotfiles-dir "el-get/slime/"))
(add-to-list 'load-path (concat dotfiles-dir "el-get/slime/contrib/"))
(add-hook 'slime-repl-mode-hook 'clojure-mode-font-lock-setup)

(require 'slime)
(require 'slime-autoloads)

(setq inferior-lisp-program "/home/smd/opt/clojure-contrib/launchers/bash/clj-env-dir"
      slime-startup-animation t)

;; (setq inferior-lisp-program "/usr/bin/clisp"
;;       slime-startup-animation t)

(slime-setup)

;;--------------------------------------------------------------------
;;--------------------------------------------------------------------

(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Allow input to be sent to somewhere other than inferior-lisp
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; This is a total hack: we're hardcoding the name of the shell buffer
(defun shell-send-input (input)
  "Send INPUT into the *shell* buffer and leave it visible."
  (save-selected-window
    (switch-to-buffer-other-window "*shell*")
    (goto-char (point-max))
    (insert input)
    (comint-send-input)))

(defun defun-at-point ()
  "Return the text of the defun at point."
  (apply #'buffer-substring-no-properties
         (region-for-defun-at-point)))

(defun region-for-defun-at-point ()
  "Return the start and end position of defun at point."
  (save-excursion
    (save-match-data
      (end-of-defun)
      (let ((end (point)))
        (beginning-of-defun)
        (list (point) end)))))

(defun expression-preceding-point ()
  "Return the expression preceding point as a string."
  (buffer-substring-no-properties
   (save-excursion (backward-sexp) (point))
   (point)))

(defun shell-eval-last-expression ()
  "Send the expression preceding point to the *shell* buffer."
  (interactive)
  (shell-send-input (expression-preceding-point)))

(defun shell-eval-defun ()
  "Send the current toplevel expression to the *shell* buffer."
  (interactive)
  (shell-send-input (defun-at-point)))

(add-hook 'clojure-mode-hook
          '(lambda ()
             (define-key clojure-mode-map (kbd "C-c e") 'shell-eval-last-expression)
             (define-key clojure-mode-map (kbd "C-c x") 'shell-eval-defun)))


;;
;;------------------------------------------------------------------------------
;; Ruby (and Rails) Hacking Tools
;;------------------------------------------------------------------------------
;;
;; The basic ruby setup includes:
;;
;;   * Flay (via Flymake) for complexity analysis (score sits in the
;;     sidebar and is recalculated when the file is saved.)
;;   *
;;

;; Replace $RSENSE_HOME with the directory where RSense was installed in full path
;; Example for UNIX-like systems
;; (setq rsense-home "/home/tomo/opt/rsense-0.2")
;; or
;; (setq rsense-home (expand-file-name "~/opt/rsense-0.2"))
;; Example for Windows
;; (setq rsense-home "C:\\rsense-0.2")


;; Complete by C-c .
(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c .") 'ac-complete-rsense)
	    (local-set-key (kdb "M-.") 'rsense-jump-to-definition)))

(autoload 'ruby-mode "ruby-mode"  "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist
      (append '(("ruby" . ruby-mode))
	      interpreter-mode-alist))

;; (2) set to load inf-ruby and set inf-ruby key definition in ruby-mode.
(autoload 'run-ruby "inf-ruby"  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")
(add-to-list 'inf-ruby-implementations '("pry" . "pry"))
(setq inf-ruby-default-implementation "pry")
(setq inf-ruby-first-prompt-pattern "^\\[[0-9]+\\] pry\\((.*)\\)> *")
(setq inf-ruby-prompt-pattern "^\\[[0-9]+\\] pry\\((.*)\\)[>*\"'] *")


(setq rsense-home "/home/smd/opt/rsense-0.3")
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)

(add-to-list 'load-path "~/.emacs.d/feature-mode")
(setq feature-default-i18n-file "/home/smd/.rvm/gems/ruby-1.9.3-p0/gems/gherkin-2.7.2/lib/gherkin/i18n.yml")
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))
(require 'feature-mode)

(require 'haml-mode)
(require 'linum)

;;(require 'ruby-complexity)
(require 'flymake-ruby)

(add-hook 'ruby-mode-hook
	  '(lambda ()
	     (define-key ruby-mode-map "\C-c#" 'comment-or-uncomment-region)
	     (inf-ruby-keys)
	     (flymake-mode)
	     (linum-mode)
	     (ruby-complexity-mode)
	     (flymake-ruby-load)
	     (fixme-mode t)
	     (add-to-list 'ac-sources 'ac-source-rsense-method)
	     (add-to-list 'ac-sources 'ac-source-rsense-constant)))

;;
;; Bits for working with the rails framework
;;

(autoload 'haml-mode     "haml-mode.el"     "Major mode for editing HAML files"     t)
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)

(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist
      (append '(("\\.haml$" . haml-mode)) auto-mode-alist))
(add-hook 'haml-mode-hook
	  '(lambda ()
	     (setq indent-tabs-mode nil)
	     (define-key haml-mode-map "\C-m" 'newline-and-indent)))


(add-to-list 'load-path "~/node_modules/jshint-mode")
(require 'flymake-jshint)

(add-hook 'javascript-mode-hook
	  '(lambda ()
	     (setq indent-tabs-mode nil)
	     (fixme-mode t)
	     (flymake-mode t)))

(add-hook 'find-file-hook 'flymake-find-file-hook)
;; Working with programmers who use Eclipse is like working with special needs children.
;; You have to stoop to their level, since abstract concepts are beyond them.
(defconst eclipse-java-style
  '((c-basic-offset . 8)
    (c-comment-only-line-offset . (0 . 0))
    ;; the following preserves Javadoc starter lines
    (c-offsets-alist . ((inline-open . 0)
                        (topmost-intro-cont    . +)
                        (statement-block-intro . +)
                        (knr-argdecl-intro     . 5)
                        (substatement-open     . +)
                        (substatement-label    . +)
                        (label                 . +)
                        (statement-case-open   . +)
                        (statement-cont        . +)
                        (arglist-intro  . c-lineup-arglist-intro-after-paren)
                        (arglist-close  . c-lineup-arglist)
                        (access-label   . 0)
                        (inher-cont     . c-lineup-java-inher)
                        (func-decl-cont . c-lineup-java-throws)
                        (arglist-cont-nonempty . ++)
                        )))
  "Eclipse Java Programming Style")
(c-add-style "ECLIPSE" eclipse-java-style)
(customize-set-variable 'c-default-style (quote ((java-mode . "eclipse") (awk-mode . "awk") (other . "gnu"))))