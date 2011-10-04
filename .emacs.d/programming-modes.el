(require 'fixme-mode)
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
(require 'slime)
(require 'slime-autoloads)

(setq inferior-lisp-program "/usr/bin/clisp"
      slime-startup-animation t)

(slime-setup '(slime-fancy))

;;--------------------------------------------------------------------
;;--------------------------------------------------------------------

(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))


;(require 'cl)


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


(autoload 'ruby-mode "ruby-mode"  "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist
      (append '(("ruby" . ruby-mode))
	      interpreter-mode-alist))
;; (2) set to load inf-ruby and set inf-ruby key definition in ruby-mode.
(autoload 'run-ruby "inf-ruby"  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")
(require 'haml-mode)
(require 'linum)
;;(require 'ruby-complexity)
(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
(add-hook 'ruby-mode-hook
	  '(lambda ()
	     (define-key ruby-mode-map "\C-c#" 'comment-or-uncomment-region)
	     (inf-ruby-keys)
	     (flymake-mode)
	     (linum-mode)
	     (ruby-complexity-mode)
	     (flymake-ruby-load)
	     (fixme-mode t))
)

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


;; ;;
;; ;;------------------------------------------------------------------------------
;; ;; Haskell Mode
;; ;;------------------------------------------------------------------------------
;; (add-to-list 'load-path "~/.emacs.d/haskellmode-emacs")
;; (load (concat dotfiles-dir "/haskellmode-emacs/haskell-site-file.el"))
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;; (add-hook 'haskell-mode-hook (load (concat dotfiles-dir "/hs-lint.el")))
;; (defun my-haskell-mode-hook ()
;;   (local-set-key "\C-cl" 'hs-lint))

;; (add-hook 'haskell-mode-hook 'my-haskell-mode-hook)
;; ;; Indentation modes are mutually exclusive...haskell-indentation
;; ;; is considered to be the most advanced.
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;; ;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;; ;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

(add-hook 'javascript-mode-hook
	  '(lambda ()
	     (setq indent-tab-mode nil)
	     (fixme-mode t)))
	     ))

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