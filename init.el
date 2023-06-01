(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

;; Use-package
(unless package-archive-contents
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; Theme
(use-package atom-one-dark-theme
  :ensure t
  :init
  (load-theme 'atom-one-dark t))

(use-package emacs
  :ensure t
  :config
  (setq inhibit-startup-message t
	initial-scratch-message nil
	default-directory "~/"
	indent-tabs-mode nil
	tab-width 2
	color-number-mode t)
   (setq create-lockfiles nil
	 make-backup-files nil)
  (menu-bar-mode -1)
  (global-display-line-numbers-mode 1)
  (global-hl-line-mode 1)
  (set-face-background 'default "undefined"))

; To send text (copy) from emacs to OS.
(use-package clipetty
  :ensure t
  :hook (after-init . global-clipetty-mode))

;(use-package evil
;  :ensure t
;  :init
;  (setq evil-want-C-u-scroll t)
;  :config
;  (evil-mode))

;(use-package evil-escape
;  :ensure t
;  :init
;  (setq-default evil-escape-key-sequence "kj")
;  :config
;  (evil-escape-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(evil use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
