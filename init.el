;; Cask installation
;; curl -fsSkL https://raw.github.com/cask/cask/master/go | python
;; echo export PATH=~/.cask/bin:$PATH >> .zshrc
;; cd ~/.emacs.d && cask install

; (add-to-list 'load-path "~/.emacs.d/")

;; Package Manager

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

;; Root directory
(setq root-dir (file-name-directory
                (or (buffer-file-name) load-file-name)))

;; Theme
;(load-theme 'wombat t)
;(load-theme 'afternoon t)
;(load-theme 'ujelly t)

; Light
;(load-theme 'material-light t)

(load-theme 'material t)


;; Disable window-system s**t
(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

;; Change emacs defaults
(setq dabbrev-case-fold-search nil)
(setq inhibit-startup-screen t)
(setq visible-bell 1)
(setq echo-keystrokes 0.02)

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "chromium")
(fset 'yes-or-no-p 'y-or-n-p)
(prefer-coding-system 'utf-8)
(define-key global-map (kbd "C-c SPC") 'pop-to-mark-command)
(define-key global-map (kbd "M-o") 'mode-line-other-buffer)

;; Text size
;; (set-face-attribute 'default nil :height 90)
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C-=") 'text-scale-decrease)

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
(setq sws-tab-width 4)

(require 'highlight-chars "~/.emacs.d/highlight-chars.el")
(defun set-highlight (mode-hook)
  (add-hook mode-hook 'hc-highlight-tabs)
  (add-hook mode-hook 'hc-highlight-trailing-whitespace))

(set-highlight 'prog-mode-hook) ;
(set-highlight 'c-mode-common-hook)

(add-hook 'go-mode-hook 'hc-dont-highlight-tabs)

;; Set auto-indent when enter
(global-set-key "\C-m" 'newline-and-indent)

;; Backup files
(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))
(setq delete-old-versions -1) ;; Extra saving
(setq backup-by-copying t)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list" t)))

;; History
(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode 1)
(setq history-length t)
(setq history-delete-duplicates t)
(setq savehist-save-minibuffer-history 1)
(setq savehist-additional-variables
      '(kill-ring
        search-ring
        regexp-search-ring))

;; Flex IDO
(require 'flx-ido)
(ido-mode)
(ido-everywhere)
(ido-vertical-mode)
(ido-at-point-mode)

(flx-ido-mode)

(setq ido-use-faces nil)
(setq ido-enable-flex-matching t)

(setq ido-vertical-define-keys 'C-n-and-C-p-only)

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
(define-key global-map (kbd "C-;") 'ace-jump-word-mode)
;(define-key global-map (kbd "C-c j c") 'ace-jump-char-mode)
;(define-key global-map (kbd "C-c j l") 'ace-jump-line-mode)

;; Org mode
(setq org-log-done t)
(add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))
(define-key global-map (kbd "C-c o l") 'org-store-link)
(define-key global-map (kbd "C-c o c") 'org-capture)
(define-key global-map (kbd "C-c o a") 'org-agenda)
(define-key global-map (kbd "C-c o b") 'org-iswitchb)

;; Undo Tree
(global-undo-tree-mode)
(setq undo-tree-visualizer-timestamps t)
(setq undo-tree-visualizer-diff t)

;; Smartparens
(smartparens-global-strict-mode)

;; Rainbow delimiter
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Dired-X
(require 'dired-x)

;; Web Mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))

(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.pug\\'" . jade-mode))

(require 'scala-mode)
(add-to-list 'auto-mode-alist '("\\.sbt\\'" . scala-mode))
(add-to-list 'auto-mode-alist '("\\.scala\\'" . scala-mode))

(require 'typescript-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))

;; everything is indented 2 spaces
(setq web-mode-markup-indent-offset 4)
(setq web-mode-css-indent-offset 4)
(setq web-mode-code-indent-offset 4)
(setq js-indent-level 4)
(setq web-mode-content-types-alist '(("jsx"  . ".*\\.js[x]?\\'")))

(add-hook
 'html-mode-hook
 (lambda ()
   (set (make-local-variable 'sgml-basic-offset) 2)))

;; Nyam-mode
;(nyan-mode)
;(nyan-start-animation)

;;;;;;;;;;;;;;;;;;;;;;;;
;; Smart Parents Config

(define-key sp-keymap (kbd "C-M-f") 'sp-forward-sexp)
(define-key sp-keymap (kbd "C-M-b") 'sp-backward-sexp)

(define-key sp-keymap (kbd "C-M-d") 'sp-down-sexp)
(define-key sp-keymap (kbd "C-M-a") 'sp-backward-down-sexp)
(define-key sp-keymap (kbd "C-S-a") 'sp-beginning-of-sexp)
(define-key sp-keymap (kbd "C-S-d") 'sp-end-of-sexp)

(define-key sp-keymap (kbd "C-M-e") 'sp-up-sexp)
(define-key emacs-lisp-mode-map (kbd ")") 'sp-up-sexp)
(define-key sp-keymap (kbd "C-M-u") 'sp-backward-up-sexp)
(define-key sp-keymap (kbd "C-M-t") 'sp-transpose-sexp)

(define-key sp-keymap (kbd "C-M-n") 'sp-next-sexp)
(define-key sp-keymap (kbd "C-M-p") 'sp-previous-sexp)

(define-key sp-keymap (kbd "C-M-k") 'sp-kill-sexp)
(define-key sp-keymap (kbd "C-M-w") 'sp-copy-sexp)

(define-key sp-keymap (kbd "M-<delete>") 'sp-unwrap-sexp)
(define-key sp-keymap (kbd "M-<backspace>") 'sp-backward-unwrap-sexp)

(define-key sp-keymap (kbd "C-<right>") 'sp-forward-slurp-sexp)
(define-key sp-keymap (kbd "C-<left>") 'sp-forward-barf-sexp)
(define-key sp-keymap (kbd "C-M-<left>") 'sp-backward-slurp-sexp)
(define-key sp-keymap (kbd "C-M-<right>") 'sp-backward-barf-sexp)

(define-key sp-keymap (kbd "M-D") 'sp-splice-sexp)
(define-key sp-keymap (kbd "C-M-<delete>") 'sp-splice-sexp-killing-forward)
(define-key sp-keymap (kbd "C-M-<backspace>") 'sp-splice-sexp-killing-backward)
(define-key sp-keymap (kbd "C-S-<backspace>") 'sp-splice-sexp-killing-around)

(define-key sp-keymap (kbd "C-]") 'sp-select-next-thing-exchange)
(define-key sp-keymap (kbd "C-<left_bracket>") 'sp-select-previous-thing)
(define-key sp-keymap (kbd "C-M-]") 'sp-select-next-thing)

(define-key sp-keymap (kbd "M-F") 'sp-forward-symbol)
(define-key sp-keymap (kbd "M-B") 'sp-backward-symbol)

(define-key sp-keymap (kbd "H-t") 'sp-prefix-tag-object)
(define-key sp-keymap (kbd "H-p") 'sp-prefix-pair-object)
(define-key sp-keymap (kbd "H-s c") 'sp-convolute-sexp)
(define-key sp-keymap (kbd "H-s a") 'sp-absorb-sexp)
(define-key sp-keymap (kbd "H-s e") 'sp-emit-sexp)
(define-key sp-keymap (kbd "H-s p") 'sp-add-to-previous-sexp)
(define-key sp-keymap (kbd "H-s n") 'sp-add-to-next-sexp)
(define-key sp-keymap (kbd "H-s j") 'sp-join-sexp)
(define-key sp-keymap (kbd "H-s s") 'sp-split-sexp)

;;;;;;;;;;;;;;;;;;
;; pair management

(sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil)

;;; markdown-mode
(sp-with-modes '(markdown-mode gfm-mode rst-mode)
  (sp-local-pair "*" "*" :bind "C-*")
  (sp-local-tag "2" "**" "**")
  (sp-local-tag "s" "```scheme" "```")
  (sp-local-tag "<"  "<_>" "</_>" :transform 'sp-match-sgml-tags))

;;; tex-mode latex-mode
(sp-with-modes '(tex-mode plain-tex-mode latex-mode)
  (sp-local-tag "i" "\"<" "\">"))

;;; html-mode
(sp-with-modes '(html-mode sgml-mode)
  (sp-local-pair "<" ">"))

;;; lisp modes
(sp-with-modes sp--lisp-modes
  (sp-local-pair "(" nil :bind "C-("))


;(custom-set-variables
; ;; custom-set-variables was added by Custom.
; ;; If you edit it by hand, you could mess it up, so be careful.
; ;; Your init file should contain only one such instance.
; ;; If there is more than one, they won't work right.
; '(ansi-color-faces-vector
;   [default default default italic underline success warning error])
; '(custom-enabled-themes (quote (wombat)))
; '(custom-safe-themes
;   (quote
;    ("d725097d2547e9205ab6c8b034d6971c2f0fc64ae5f357b61b7de411ca3e7ab2" "28ec8ccf6190f6a73812df9bc91df54ce1d6132f18b4c8fcc85d45298569eb53" "f0ea6118d1414b24c2e4babdc8e252707727e7b4ff2e791129f240a2b3093e32" "42ac06835f95bc0a734c21c61aeca4286ddd881793364b4e9bc2e7bb8b6cf848" "9eb5269753c507a2b48d74228b32dcfbb3d1dbfd30c66c0efed8218d28b8f0dc" default)))
; '(fci-rule-color "#14151E")
; '(scheme-program-name "mit-scheme")
; '(vc-annotate-background nil)
; '(vc-annotate-color-map
;   (quote
;    ((20 . "#d54e53")
;     (40 . "goldenrod")
;     (60 . "#e7c547")
;     (80 . "DarkOliveGreen3")
;     (100 . "#70c0b1")
;     (120 . "DeepSkyBlue1")
;     (140 . "#c397d8")
;     (160 . "#d54e53")
;     (180 . "goldenrod")
;     (200 . "#e7c547")
;     (220 . "DarkOliveGreen3")
;     (240 . "#70c0b1")
;     (260 . "DeepSkyBlue1")
;     (280 . "#c397d8")
;     (300 . "#d54e53")
;     (320 . "goldenrod")
;     (340 . "#e7c547")
;     (360 . "DarkOliveGreen3"))))
; '(vc-annotate-very-old-color nil))
;(custom-set-faces
; ;; custom-set-faces was added by Custom.
; ;; If you edit it by hand, you could mess it up, so be careful.
; ;; Your init file should contain only one such instance.
; ;; If there is more than one, they won't work right.
; )
;(put 'downcase-region 'disabled nil)

; closing ask for confirmation
(setq confirm-kill-emacs #'y-or-n-p)

;; Invalidate C-z key
(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-z C-z") 'my-suspend-frame)

;; Custom to change to a register
(global-set-key (kbd "C-c r") 'jump-to-register)

;; ORG MODE
(add-to-list 'load-path "~/.emacs.d/org-mode/")
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(require 'org)

;; We only need Emacs Lisp and Clojure in this tutorial:
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (clojure . t)))

;; Use cider as the clojure execution backend
(setq org-babel-clojure-backend 'cider)

;; Let's have pretty source code blocks
(setq org-edit-src-content-indentation 0
      org-src-tab-acts-natively t
      org-src-fontify-natively t
      org-confirm-babel-evaluate nil)

(setq org-use-speed-commands t)
(setq org-directory "~/Notas")
(setq org-default-notes-file (concat org-directory "/capture.org"))

(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cb" 'org-iswitchb)

;(add-to-list 'org-babel-load-languages '(emacs-lisp . t))
;(add-to-list 'org-babel-load-languages '(clojure . t))
;(add-to-list 'org-babel-load-languages '(python . t))
;(org-babel-do-load-languages 'org-babel-load-languages org-babel-load-languages)

(set-register ?o (cons 'file (concat org-directory "/organizer.org")))
(set-register ?t (cons 'file (concat org-directory "/capture.org")))
(set-register ?e (cons 'file "~/.emacs.d/init.el"))

(setq org-agenda-files (quote ("~/Notas/organizer.org"
                               "~/Notas/capture.org")))

(setq org-refile-targets '((org-agenda-files . (:maxlevel . 6))))

(add-hook
 'org-mode-hook
 (lambda ()
   (org-defkey org-mode-map [(control ?\')] 'er/expand-region)))

;; Export to asciidoctor
(require 'ox-asciidoc)

;; CIDER
(require 'cider)
(setq nrepl-hide-special-buffers t
      cider-repl-pop-to-buffer-on-connect nil
      cider-popup-stacktraces nil
      cider-repl-popup-stacktraces t)


;; Modeline config
(display-time-mode t)
(column-number-mode t)

;; Smart modeline
(setq sml/no-confirm-load-theme t)
(sml/setup)
(setq sml/theme 'powerline)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "4a162cd971cf3c059e827d6b5aa0bd07488cb5995782c0fa0ce20621bbc4a596" "c18fd02975a561463871fe37752f7143c620054b9898d6d59d95a18531222d7d" "26614652a4b3515b4bbbb9828d71e206cc249b67c9142c06239ed3418eff95e2" default)))
 '(hl-sexp-background-color "#1c1f26")
 '(org-agenda-files
   (quote
    ("~/kaleidos/notas/seequestor/issues24enero.org" "~/Notas/organizer.org" "~/Notas/capture.org")))
 '(package-selected-packages
   (quote
    (htmlize pg kotlin-mode wgrep-ag multiple-cursors stylus-mode adoc-mode protobuf-mode focus restclient csharp-mode fsharp-mode go-mode elm-mode tuareg haskell-mode cmake-mode matlab-mode dockerfile-mode magit yaml-mode web-mode volatile-highlights undo-tree ujelly-theme smex smartparens smart-mode-line-powerline-theme sicp scala-mode sass-mode rainbow-delimiters python-mode projectile php-mode pallet ox-asciidoc nyan-mode moe-theme material-theme markdown-mode less-css-mode json-mode jade-mode ido-vertical-mode ido-at-point highlight-chars groovy-mode flx-ido expand-region editorconfig django-mode cider ag afternoon-theme ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line-inactive ((t (:inherit mode-line :background "Black" :foreground "gray60" :box (:line-width -2 :color "black") :slant italic :weight normal))))
 '(sml/line-number ((t (:inherit sml/global :background "black" :foreground "White" :weight normal))))
 '(sml/minor-modes ((t (:inherit sml/folder :foreground "gold")))))

;; Show paren mode
(require 'paren)
(show-paren-mode 1)

;; Magit
(global-set-key (kbd "C-c g") 'magit-status)
(setq magit-push-always-verify nil)

;; smex
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

;; visual improvement
(setq default-line-spacing 3)


;; Clojure mode
(add-hook
 'clojure-mode-hook
 '(lambda ()
    ;; Om Specific
    (define-clojure-indent
      (h1 'defun)
      (h2 'defun)
      (h3 'defun)
      (h4 'defun)
      (h5 'defun)
      (h6 'defun)
      (div 'defun)
      (span 'defun)
      (section 'defun)
      (nav 'defun)
      (article 'defun)
      (aside 'defun)
      (input 'defun)
      (form 'defun)
      (textarea 'defun)
      (ul 'defun)
      (ol 'defun)
      (li 'defun))

    (define-clojure-indent
      (init-state 'defun)
      (render 'defun)
      (render-state 'defun)
      (will-mount 'defun)
      (will-unmount 'defun)
      (will-receive-props 'defun)
      (did-mount 'defun)
      (did-update 'defun)
      (match 'defun)
      )

    (define-clojure-indent
      (it 1)
      (async 'defun)
      (errlet 1)
      (maybe-let 1)
      (atomic 'defun)
      (mlet 1))))


;; Volatile highlight for certain operations
(require 'volatile-highlights)
(volatile-highlights-mode t)

;; Haskell mode
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)


; (require 'sicp)

(require 'editorconfig)
(editorconfig-mode 1)

(require 'js-import "~/.emacs.d/js-import.el")

(add-to-list 'load-path "~/.emacs.d/org-asciidoc/")
(require 'ox-asciidoc)
(put 'upcase-region 'disabled nil)

;;; toggle type of window split
(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
         (next-win-buffer (window-buffer (next-window)))
         (this-win-edges (window-edges (selected-window)))
         (next-win-edges (window-edges (next-window)))
         (this-win-2nd (not (and (<= (car this-win-edges)
                     (car next-win-edges))
                     (<= (cadr this-win-edges)
                     (cadr next-win-edges)))))
         (splitter
          (if (= (car this-win-edges)
             (car (window-edges (next-window))))
          'split-window-horizontally
        'split-window-vertically)))
    (delete-other-windows)
    (let ((first-win (selected-window)))
      (funcall splitter)
      (if this-win-2nd (other-window 1))
      (set-window-buffer (selected-window) this-win-buffer)
      (set-window-buffer (next-window) next-win-buffer)
      (select-window first-win)
      (if this-win-2nd (other-window 1))))))

(global-set-key (kbd "C-x t") 'toggle-window-split)


(defun sudo-edit ()
  "Edit the file that is associated with the current buffer as root"
  (interactive)
  (let ((file-name (buffer-file-name)))
    (if file-name
        (progn
          (kill-buffer)
          (setq file (concat "/sudo:root@localhost:" file-name))
          (find-file file))
      (message "Current buffer does not have an associated file."))))

(global-set-key (kbd "C-x p") 'sudo-edit)



; smart-beginning-of-line
(defun smart-beginning-of-line ()
  "Move point to first non-whitespace character or beginning-of-line.
   Move point to the first non-whitespace character on this line.
   If point was already at that position, move point to beginning of line."
  (interactive)
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))

(global-set-key (kbd "C-a") 'smart-beginning-of-line)

(delete-selection-mode 1)
