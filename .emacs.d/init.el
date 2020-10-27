(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)

;; according to http://wikemacs.org/wiki/User's_Initialization_File#With_org-mode
(require 'org)
(require 'ob-tangle)
(message "before loading dotemacs.org")

(org-babel-load-file (expand-file-name
		      (concat (file-name-as-directory (expand-file-name user-emacs-directory)) "dotemacs.org")))
(message "before loading dotemacs.org")
