(require 'package)

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/"))

(package-initialize)

(defvar my-packages '(better-defaults paredit idle-highlight-mode ido-ubiquitous
                      find-file-in-project magit smex scpaste clojure-mode))

(dolist (p my-packages)
  (when (not (package-installed-p p))
        (package-install p)))


(setq package-enable-at-startup nil)

;; This is a list of the packages I've got installed. Just for funsies.

;; ac-cider           20141013.... installed             Clojure auto-complete sources using CIDER
;; ace-jump-mode      20140616.115 installed             a quick cursor location minor mode for emacs
;; auto-complete      20141111.... installed             Auto Completion for GNU Emacs
;; better-defaults    0.1.2        installed             Fixing weird quirks and poor defaults
;; cider              20141120.... installed             Clojure Integrated Development Environment and REPL
;; clj-refactor       20141119.454 installed             A collection of clojure refactoring functions
;; clojure-mode       20141120.... installed             Major mode for Clojure code
;; clojure-snippets   20140831.912 installed             Yasnippets for clojure
;; dash               2.9.0        installed             A modern list library for Emacs
;; epl                0.7          installed             Emacs Package Library
;; find-file-in-pr... 3.3          installed             Find files in a project quickly.
;; htmlize            1.39         installed             Convert buffer text and decorations to HTML.
;; idle-highlight-... 1.1.2        installed             highlight the word the point is on
;; ido-ubiquitous     2.10         installed             Use ido (nearly) everywhere.
;; magit              1.2.2        installed             Control Git from Emacs.
;; markdown-mode      20140914.... installed             Emacs Major mode for Markdown-formatted text files
;; multiple-cursors   20141026.503 installed             Multiple cursors for Emacs.
;; paredit            22           installed             minor mode for editing parentheses
;; pkg-info           0.5          installed             Information about packages
;; popup              20141120.... installed             Visual Popup User Interface
;; queue              0.1.1        installed             Queue data structure
;; rainbow-delimiters 20141107.... installed             Highlight nested parens, brackets, braces a different color at each depth.
;; s                  20140910.334 installed             The long lost Emacs string manipulation library.
;; scpaste            0.6.3        installed             Paste to the web via scp.
;; smex               3.0          installed             M-x interface with Ido-style fuzzy matching.
;; w3m                20141106.... installed             an Emacs interface to w3m
;; yasnippet          20141117.327 installed             Yet another snippet extension for Emacs.
