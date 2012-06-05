(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

(require 'window-number)
(require 'flymake)
(require 'git)

(require 'color-theme)

(defadvice comment-or-uncomment-region (before slick-comment activate compile)
  "When called interactively with no active region, comment a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
	   (line-beginning-position 2)))))
;;------------------------------------------------------------------------------
;; Window number mode comes from emacs-wiki.
;; It allows selection of a window (in a fixed-order list, minibuff last)
;; by C-x C-j N, where N is the number
;;------------------------------------------------------------------------------
;;(window-number-mode)


;;
;;------------------------------------------------------------------------------
;; Saving Emacs Sessions is covered in section 51 of the emacs manual.
;; I've got the desktops saved in ~/.emacs.d/desktop/
(desktop-save-mode 1)

(add-to-list 'auto-mode-alist        '("\\.dot$"    . graphviz-dot-mode))
(add-to-list 'auto-mode-alist        '("\\.org$"    . org-mode))


;;
;;------------------------------------------------------------------------------
;; Remember Mode - as described in "Getting Things Done with Emacs"
;; <http://sachachua.com/wp/2007/12/28/emacs-getting-things-done-with-org-basic/>
;; ------------------------------------------------------------------------------
(require 'org)

(setq org-directory "~/docs/VC-docs/org-mode")
(setq org-mobile-inbox-for-pull "~/docs/VC-docs/org-mode/flagged.org")
(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-mobile-files
      (quote ("organizer.org" "hacklog.org" "shopping.org" "masters.org")))

;;------------------------------------------------------------------------
;;------------------------------------------------------------------------
;; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
(ido-mode t)


