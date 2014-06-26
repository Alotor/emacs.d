;; Cask installation
;; curl -fsSkL https://raw.github.com/cask/cask/master/go | python
;; echo export PATH=~/.cask/bin:$PATH >> .zshrc
;; cd ~/.emacs.d && cask install

(add-to-list 'load-path "~/.emacs.d/")

;; Package Manager
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)

;; Root directory
(setq root-dir (file-name-directory
                (or (buffer-file-name) load-file-name)))

;; Theme
(load-theme 'afternoon t)

;; Disable default modes
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(setq dabbrev-case-fold-search nil)

(setq inhibit-startup-screen t)
(setq visible-bell 1)
(setq echo-keystrokes 0.02)

;; Tabs/spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-stop-list (number-sequence 4 120 4))

(setq-default c-basic-offset 4)
(setq-default tab-width 4)
(setq-default sgml-basic-offset 4)
(setq-default nxml-child-indent tab-width)
(setq-default nxml-outline-child-indent tab-width)
(setq js-indent-level 4)

(setq x-stretch-cursor 1)

(require 'highlight-chars)
(defun set-highlight (mode-hook)
  (add-hook mode-hook 'hc-highlight-tabs)
  (add-hook mode-hook 'hc-highlight-trailing-whitespace))

(set-highlight 'prog-mode-hook)
(set-highlight 'c-mode-common-hook)

;; Set auto-indent when enter
(global-set-key "\C-m" 'newline-and-indent)

;; Backup files
(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))
(setq backup-by-copying t)
(setq delete-old-versions t)
(setq version-control t)

;; Flex IDO
(require 'flx-ido)
(ido-mode)
(ido-everywhere)
(ido-vertical-mode)
(ido-at-point-mode)

(flx-ido-mode)

(setq ido-use-faces nil)
(setq ido-enable-flex-matching t)

;; Projectile
(projectile-global-mode)
;; C-c p f -> open file
;; C-c p s -> switch project
;; C-c p F -> files on all known projects
;; C-c p A -> Ag search
;; C-c p C-h -> Keybinding help

;; Neotree
(add-to-list 'load-path "~/.emacs.d/neotree/")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; Expand Region
(require 'expand-region)
(global-set-key (kbd "C-'") 'er/expand-region)
(pending-delete-mode t) ;; once selected you can replace the selection

;; Ace Jump
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c j w") 'ace-jump-word-mode)
(define-key global-map (kbd "C-c j c") 'ace-jump-char-mode)
(define-key global-map (kbd "C-c j l") 'ace-jump-line-mode)

;; Org mode
(setq org-log-done t)

;; Nyam-mode
(nyan-mode)
(nyan-start-animation)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("9eb5269753c507a2b48d74228b32dcfbb3d1dbfd30c66c0efed8218d28b8f0dc" default)))
 '(scheme-program-name "mit-scheme"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
