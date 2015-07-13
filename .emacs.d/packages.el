(require 'package)

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/"))

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(clj-refactor . "melpa-stable") t)

(package-initialize)

(defvar my-packages '(better-defaults paredit idle-highlight-mode ido-ubiquitous
                      find-file-in-project magit smex scpaste clojure-mode clj-refactor rainbow-delimiters))

(dolist (p my-packages)
  (when (not (package-installed-p p))
        (package-install p)))


(setq package-enable-at-startup nil)
