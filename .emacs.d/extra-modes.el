(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

(require 'window-number)
(require 'flymake)
(require 'git)
(add-to-list 'load-path "/home/smd/.emacs.d/el-get/color-theme/")
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

(add-hook 'org-mode-hook
	  (lambda ()
	    (auto-fill-mode 1)))


(setq org-remember-templates
      '(("Tasks" ?t "* TODO %?\n  %i\n  %a" "~/docs/organizer.org")                 ;; (2)
        ("Appointments" ?a "* Appointment: %?\n%^T\n%i\n  %a" "~/docs/organizer.org")))
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))

(eval-after-load 'remember
  '(add-hook 'remember-mode-hook 'org-remember-apply-template))

(setq org-todo-keywords '("TODO" "STARTED" "WAITING" "ON-HOLD" "DONE"))          ;; (6)
(setq org-agenda-include-diary t)                                                ;; (7)
(setq org-agenda-include-all-todo t)
(setq comment-start 'nil)


;; 'smd-org-article' for export org documents to the LaTex 'article', using
;; XeTeX and some fancy fonts; requires XeTeX (see org-latex-to-pdf-process)
(setq org-export-latex-classes ())
(add-to-list 'org-export-latex-classes
  '("smd"
"\\documentclass[11pt,a4paper]{article}
\\usepackage[T1]{fontenc}
\\usepackage{fontspec}
\\usepackage{graphicx}
\\defaultfontfeatures{Mapping=tex-text}
\\setromanfont{Gentium}
\\setromanfont [BoldFont={Gentium Basic Bold},
                ItalicFont={Gentium Basic Italic}]{Gentium Basic}
\\setsansfont{Charis SIL}
\\setmonofont[Scale=0.8]{Bitstream Vera Sans}
\\usepackage{geometry}
\\geometry{a4paper, textwidth=6.5in, textheight=10in,
            marginparsep=7pt, marginparwidth=.6in}
\\pagestyle{empty}
\\title{}
      [NO-DEFAULT-PACKAGES]
      [NO-PACKAGES]"
     ("\\section{%s}" . "\\section*{%s}")
     ("\\subsection{%s}" . "\\subsection*{%s}")
     ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
     ("\\paragraph{%s}" . "\\paragraph*{%s}")
     ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(setq org-latex-to-pdf-process
      '("xelatex -interaction nonstopmode %f"
	"xelatex -interaction nonstopmode %f")) ;; for multiple passes





;;------------------------------------------------------------------------
;;------------------------------------------------------------------------
;; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
(ido-mode t)


