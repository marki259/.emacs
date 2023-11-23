;; MELPA package manager
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(set-frame-font "Source Code Pro-12" nil t)

;; Show/not showing menus
(menu-bar-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(load-theme 'twilight-bright t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(conda projectile yaml docker docker-tramp dockerfile-mode jedi yaml-mode rust-playground use-package which-key ess elpy lsp-mode rust-mode visual-regexp-steroids visual-regexp twilight-bright-theme magit cyberpunk-theme))
 '(warning-suppress-types '((comp) (comp) (comp) (comp) (comp) (comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Removing annoying bell 
(setq ring-bell-function 'ignore)

;; Opening buffer list in same buffer + some other perks
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; No startup screen
(setq inhibit-startup-screen t)

;; Rust mode for Rust programming
(require 'rust-mode)
;; Formatting on save
(setq rust-format-on-save t)

;; (require 'lsp-mode)
;; (add-hook 'rust-mode-hook #'lsp)

;; Enable elpy for python editing
;; (elpy-enable)

;; Helps buffer navigation 
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; line numbers
(global-linum-mode)

;; (use-package lsp-mode
;;   :init
;;   (setq lsp-auto-configure t)
;;   :hook ((rust-mode . lsp)))

(use-package company
  :init
  (global-company-mode)
  (setq company-backends '(company-lsp)))

(require 'yasnippet)
(yas-global-mode 1)

;; Attach company-mode to ess
(add-hook 'ess-mode-hook 'company-mode)
(add-to-list 'company-backends 'company-yasnippet)

(add-hook 'after-init-hook 'global-company-mode)

(add-hook 'python-mode-hook 'jedi:setup)

;; Which-key mode
(which-key-mode)

;; projectile
(projectile-mode +1)

;; Recommended keymap prefix
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; ido-mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(show-paren-mode 1)

;; Set-up conda env
(require 'conda)
(setq conda-env-home-directory "/home/marc/mambaforge")
(setq conda-anaconda-home "/home/marc/mambaforge")
(add-to-list 'exec-path "/home/marc/mambaforge/bin")
