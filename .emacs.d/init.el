(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)

(message "in init.el")

(defmacro with-system (type &rest body)
  "Evaluate BODY if `system-type' equals TYPE."
  (declare (indent defun))
  `(when (eq system-type ',type)
     ,@body))

(with-system windows-nt
  (setq user-home-dir (file-name-as-directory "C:/Users/nanospin/"))  ;; used by me 
  (setq user-emacs-directory "c:/Users/nanospin/misc/dotemacs/.emacs.d/")  ;; used by emacs
  (setq user-init-file (concat user-emacs-directory "init.el"))  ;; used by emacs
  
  ;; (setq default-directory user-home-dir)
  ;; (setenv "HOME" "D:/my/home/directory")
  )

(with-system gnu/linux
  (setq user-home-dir (file-name-as-directory (expand-file-name "~")))  ;; used by me 
  (setq user-emacs-directory (concat user-home-dir ".emacs.d/"))  ;; used by emacs
  (setq user-init-file (concat user-emacs-directory "init.el"))  ;; used by emacs
  
  ;; (setq default-directory user-home-dir)
  ;; (setenv "HOME" "D:/my/home/directory")
  )

;; according to http://wikemacs.org/wiki/User's_Initialization_File#With_org-mode
(require 'org)
(require 'ob-tangle)


(message "hi from init.el")
(message (expand-file-name
  (concat (file-name-as-directory user-emacs-directory) "dotemacs.org")))


(message "babel-load-file starting")

(org-babel-load-file
 (expand-file-name
  (concat (file-name-as-directory user-emacs-directory) "dotemacs.org")))

(message "babel-load-file finished")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-gtags-auto-update t)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-path-style 'relative)
 '(package-selected-packages
   '(company-jedi scimax elpy markdown-mode yasnippet ws-butler which-key visual-regexp swiper-helm stickyfunc-enhance srefactor smartparens rotate pyvenv py-autopep8 pdfgrep paredit origami org-ref org-noter org-elisp-help org-download multiple-cursors magit iedit ialign hy-mode hide-mode-line helm-projectile helm-gtags helm-ag golden-ratio god-mode function-args free-keys flycheck exec-path-from-shell evil erefactor elisp-slime-nav dumb-jump doom-themes darkroom crux counsel company-c-headers company-anaconda backward-forward auctex all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
