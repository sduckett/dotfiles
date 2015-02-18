;; load the package management configuration
(setq package-configuration (expand-file-name "packages.el" user-emacs-directory))
(when (file-exists-p package-configuration)
  (load package-configuration))

;; keep customize settings in their own file
(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file)
  (load custom-file))

;; translate the literate configuration and load.
(require 'org)
(org-babel-load-file
 (expand-file-name "settings.org"
                   user-emacs-directory))
