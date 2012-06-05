;; An Emacs configuration that doesn't suck too much....most of the time.
;; Sean Duckett <sduckett@gmail.com>
;;
;; In progress since: 5 February 2008
;; Last updated: 2011-09-22
;;
;; Remember - 10 Tips for Effective Emacs
;; <http://steve.yegge.googlepages.com/effective-emacs>
;;
(setq dotfiles-dir "/home/smd/.emacs.d/")
(server-start)
(require 'cl)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(fset 'yes-or-no-p 'y-or-n-p)


(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))


;;
;;------------------------------------------------------------------------------
;; E N V I R O N M E N T    P A T H S
;;------------------------------------------------------------------------------
; show env var named path
(getenv "PATH")

; example of setting env var named “path”
; by appending a new path to existing path
(setenv "PATH"
  (concat (getenv "PATH") ":~/.lein/bin" ":~/opt/leiningen/"))
;;
;;------------------------------------------------------------------------------
;; L O A D    P A T H S
;;------------------------------------------------------------------------------
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path "/home/smd/.emacs.d/el-get/color-theme/")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/elib")


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(erc-autojoin-channels-alist (quote (("freenode.net" "#emacs" "#ruby-lang"))))
 '(erc-nick "bitrot")
 '(erc-nick-uniquifier "_")
 '(erc-nickserv-passwords (quote ((freenode (("bitrot" . "bitrothappens") ("" . "mtg58or"))))))
 '(w3m-use-cookies t))


(defun unix-file ()
  "Change the current buffer to Latin 1 with Unix line-ends."
  (interactive)
  (set-buffer-file-coding-system 'iso-latin-1-unix t))
(defun dos-file ()
  "Change the current buffer to Latin 1 with DOS line-ends."
  (interactive)
  (set-buffer-file-coding-system 'iso-latin-1-dos t))
(defun mac-file ()
  "Change the current buffer to Latin 1 with Mac line-ends."
  (interactive)
  (set-buffer-file-coding-system 'iso-latin-1-mac t))


(put 'upcase-region 'disabled nil)
(setq tramp-default-method "ssh")

(defun eval-url (url)
  (let ((buffer (url-retrieve-synchronously url)))
    (save-excursion
      (set-buffer buffer)
      (goto-char (point-min))
      (re-search-forward "^$" nil 'move)
      (eval-region (point) (point-max))
      (kill-buffer (current-buffer)))))

;; Load ELPA
(add-to-list 'load-path "~/.emacs.d/elpa")

(defun install-elpa ()
  (eval-url "http://tromey.com/elpa/package-install.el"))

(if (require 'package nil t)
    (progn
      ;; Emacs 24+ includes ELPA, but requires some extra setup
      ;; to use the (better) tromey repo
      (if (>= emacs-major-version 24)
	  (setq package-archives
		(cons '("tromey" . "http://tromey.com/elpa/")
		      package-archives)))
      (package-initialize))
  (install-elpa))

(setq package-archives
      '(("ELPA" . "http://tromey.com/elpa/")
	("gnu" . "http://elpa.gnu.org/packages/")))
;;
;; Manage packages with el-get
;;

(add-to-list 'load-path (concat dotfiles-dir "el-get/el-get"))
(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))

(setq el-get-sources
      '(;(:name ruby-compilation)
	(:name magit
	 :after (lambda () (global-set-key (kbd "C-x C-z") 'magit-status)))
	ruby-mode fixme-mode slime paredit flymake-ruby clojure-mode swank-clojure haml-mode yaml-mode markdown-mode window-number rinari color-theme color-theme-solarized color-theme-zen-and-art color-theme-twilight))

(el-get 'sync)

(require 'color-theme)
(color-theme-initialize)
(load-file "~/.emacs.d/el-get/color-theme-twilight/color-theme-twilight.el")
(color-theme-twilight)

(load-file (concat dotfiles-dir "keybindings.el"))
(load-file (concat dotfiles-dir "extra-modes.el"))
(load-file (concat dotfiles-dir "programming-modes.el"))
(load-file (concat dotfiles-dir "macros.el"))


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

;; (custom-set-faces
;;   ;; custom-set-faces was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :stipple nil :background "#000000" :foreground "#f6f3e8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :height 110 :width normal :foundry "unknown" :family "Inconsolata")))))
(put 'narrow-to-region 'disabled nil)
