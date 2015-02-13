;; An Emacs configuration that doesn't suck too much.
;; Sean Duckett <sduckett@gmail.com>
;;
;; In progress since: 5 February 2008
;; Last updated: 22 September 2012
;;
;; Remember - 10 Tips for Effective Emacs
;; <http://steve.yegge.googlepages.com/effective-emacs>
;;
;;------------------------------------------------------------------------------
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;------------------------------------------------------------------------------
;; Tip 7 - Lose the UI
;;
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;;
;;------------------------------------------------------------------------------
;; E X E C  P A T H S
;;------------------------------------------------------------------------------
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

;;
;;------------------------------------------------------------------------------
;; L O A D    P A T H S
;;------------------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d")


(load "~/.emacs.d/keybindings.el")
(load "~/.emacs.d/extra-modes.el")

(fset 'yes-or-no-p 'y-or-n-p)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(csv-separators (quote ("," "|")))
 '(org-agenda-files (quote ("~/docs/org-mode/work.org" "~/docs/org-mode/organizer.org"))))



(put 'upcase-region 'disabled nil)
(setq tramp-default-method "ssh")
