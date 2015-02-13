;; Some emacs sanity
(fset 'yes-or-no-p 'y-or-n-p)
(setq confirm-nonexistent-file-or-buffer nil)

(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)
(define-key global-map (kbd "RET") 'newline-and-indent)

;;; This might need to go away? Maybe not?

(define-key input-decode-map "\e[1;5A" [C-up])
(define-key input-decode-map "\e[1;5B" [C-down])
(define-key input-decode-map "\e[1;5C" [C-right])
(define-key input-decode-map "\e[1;5D" [C-left])

(require 'package)

(add-to-list
 'package-archives
 '("melpa" . "http://melpa.org/packages/"))

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))



(defvar my-packages '(better-defaults paredit idle-highlight-mode ido-ubiquitous
                                      find-file-in-project magit smex scpaste clojure-mode))

(package-initialize)
(dolist (p my-packages)
  (when (not (package-installed-p p))
        (package-install p)))


;; IDO mode setup
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-create-new-buffer 'always)
(setq ido-everywhere t)

;; Clojure setup
(require 'clojure-mode)
(require 'paredit)
(define-key paredit-mode-map (kbd "M-[") nil)
(define-key paredit-mode-map (kbd "<C-right>") 'paredit-forward-slurp-sexp)

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'subword-mode)
(add-hook 'clojure-mode-hook 'cider-mode)
(add-hook 'clojure-mode-hook 'auto-complete-mode)
(add-hook 'clojure-mode-hook 'clj-refactor-mode)


(cljr-add-keybindings-with-prefix "C-c C-m")

(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
(add-hook 'cider-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)

(eval-after-load "auto-complete"
   '(add-to-list 'ac-modes 'cider-mode))

(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))

(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)

(defun smart-open-line-above ()
  "Insert an empty line above the current line.
  Position the cursor at it's beginning, according to the current mode."
  (interactive)
  (move-beginning-of-line nil)
  (newline-and-indent)
  (forward-line -1)
  (indent-according-to-mode))

(global-set-key [(control shift return)] 'smart-open-line-above)

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)
