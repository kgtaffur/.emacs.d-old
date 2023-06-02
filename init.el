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
	 make-backup-files nil
	 auto-save-default nil)
   (setq gc-cons-threshold 100000000
	 read-process-output-max (* 1024 1024))
  (menu-bar-mode -1)
  (global-display-line-numbers-mode 1)
  (global-hl-line-mode 1)
  (set-face-background 'default "undefined"))

; To send text(copy) from emacs to OS.
(use-package clipetty
  :ensure t
  :hook (after-init . global-clipetty-mode))

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l"))

(use-package web-mode
  :ensure t
  :mode (("\\.html?\\'" . web-mode)
	 ("\\.css\\'" . web-mode)
	 ("\\.jsx?\\'" . web-mode)
	 ("\\.tsx?\\'" . web-mode)
	 ("\\.json\\'" . web-mode))
  :hook (web-mode . lsp-deferred)
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))
  (setq web-mode-auto-close-style 2))

(use-package apheleia
  :ensure t
  :config
  (setf (alist-get 'prettier apheleia-formatters)
	'(npx "prettier"
	      "--tab-width" "2"
	      file))
  (add-to-list 'apheleia-mode-alist '(web-mode . prettier))
  (apheleia-global-mode t))

;; Completion framework
(use-package company
  :ensure t
  :after lsp-mode
  :hook (prog-mode . company-mode)
  :bind
  (:map company-active-map ("<tab>" . company-complete-selection))
  (:map lsp-mode-map ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

;; Company icons
(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode))

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
 '(delete-selection-mode nil)
 '(lsp-clients-angular-language-server-command
   '("node" "/usr/local/lib/node_modules/@angular/language-server" "--ngProbeLocations" "/usr/local/lib/node_modules" "--tsProbeLocations" "/usr/local/lib/node_modules" "--stdio"))
 '(package-selected-packages '(evil use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
