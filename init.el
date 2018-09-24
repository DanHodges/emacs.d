;;; init.el --- Emacs init file

;;; Commentary:
;; New install instructions
;; 1.) M-x package-refresh-contents RET
;; 2.) M-x package-install RET use-package RET
;; 3.) Restart Emacs

;;; Code:
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(eval-when-compile
  (require 'use-package))

(setq use-package-always-ensure t)

(use-package
  server)

(use-package
  exec-path-from-shell
  :config (exec-path-from-shell-initialize))

(use-package
  which-key
  :init (which-key-mode))

(use-package
  rjsx-mode
  :mode "\\.js\\'")

(use-package
  flycheck
  :init (global-flycheck-mode))

(use-package
  elisp-format)

(use-package
  diminish)

(use-package
  tide
  :config
  (add-hook 'rjsx-mode-hook (lambda () "Set up Tide mode."
			      (interactive)
			      (tide-setup)
			      (flycheck-mode +1)
			      (setq flycheck-check-syntax-automatically '(mode-enabled save))
			      (eldoc-mode +1)
			      (tide-hl-identifier-mode +1)
			      (company-mode +1))))

(use-package
  projectile
  :init (projectile-mode))

(setq projectile-completion-system 'ivy)

(use-package
  avy)

(use-package
  ace-window
  :config (setq aw-keys '(?a ?r ?s ?t ?1 ?2 ?3 ?4 ?5)))

(use-package
  zenburn-theme)

(use-package
  ivy-hydra)

(use-package
  counsel
  :init (counsel-mode 1)
  (ivy-mode 1)
  :config (setq ivy-use-virtual-buffers t
	        ivy-count-format "(%d/%d) "
	        ivy-height 10))

(use-package
  counsel-projectile)

(use-package
  clojure-mode)

(use-package
  cider)

(use-package
  wgrep)

(use-package
  geiser)

(use-package
  company)

(use-package
  spaceline
  :init (spaceline-emacs-theme))

(use-package
  magit)

(use-package
  evil-magit
  :after magit)

(use-package
  key-chord
  :init (key-chord-mode 1))

(use-package
  general)

(use-package
  super-save
  :init (super-save-mode +1))

(use-package
  prettier-js
  :init (add-hook 'rjsx-mode-hook 'prettier-js-mode))

(use-package
  add-node-modules-path
  :init (add-hook 'rjsx-mode-hook #'add-node-modules-path))

(use-package
  dumb-jump
  :config (setq dumb-jump-selector 'ivy)
  :init (dumb-jump-mode))

(use-package
  evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package
  evil-collection
  :after evil
  :custom (evil-collection-setup-minibuffer t)
  :config
  (evil-collection-init))

(use-package
  evil-mc
  :init (global-evil-mc-mode 1))

(use-package
  expand-region)

(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'auto-mode-alist '("\\.symlink$" . shell-script-))
(set-face-attribute 'default nil
		    :family "Source Code Pro"
		    :height 160
		    :weight 'normal
		    :width 'normal)

(global-undo-tree-mode 1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(desktop-save-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)

(setq scroll-preserve-screen-position 1
      company-tooltip-align-annotations t
      next-line-add-newlines nil
      make-backup-files nil
      auto-save-default nil
      js-indent-level 2
      js2-strict-trailing-comma-warning nil
      ns-command-modifier 'meta
      ns-option-modifier 'super
      initial-frame-alist '((menu-bar-lines . 0) (tool-bar-lines . 0)))

(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode))
(global-auto-revert-mode t)

(or (server-running-p)
    (server-start))

(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(general-define-key
  "C-x g"  'magit-status
  "C-x C-b" 'ibuffer
  "M-=" 'text-scale-increase
  "M--" 'text-scale-decrease

  "M-/" 'comment-or-uncomment-region

  "M-f" 'swiper
  "M-x" 'counsel-M-x
  "M-v" 'clipboard-yank
  "M-c" 'clipboard-kill-ring-save
  "M-o" 'counsel-find-file
  "M-w" 'delete-window

  "C-x C-f" 'counsel-find-file
  "<f1> f" 'counsel-describe-function
  "<f1> v" 'counsel-describe-variable
  "<f1> l" 'counsel-find-library
  "<f2> i" 'counsel-info-lookup-symbol
  "<f2> u" 'counsel-unicode-char

  "C-c g" 'counsel-git
  "C-c j" 'counsel-git-grep
  "C-c k" 'counsel-ag
  "C-x l" 'counsel-locate
  "C-S-o" 'counsel-rhythmbox

  "C-c C-r" 'ivy-resume

  (general-chord ",,") 'avy-goto-char-timer)

(general-define-key
  :states 'normal
  :prefix "SPC"
  "SPC" 'counsel-git
  "w" 'ace-window
  "s" 'save-buffer
  "f" 'counsel-projectile-ag
  "d" 'delete-window
  "D" 'delete-other-windows
  "h" 'split-window-vertically
  "v" 'split-window-horizontally
  "i" 'dumb-jump-go
  "o" 'dumb-jump-back
  "b" 'ivy-switch-buffer)

(general-define-key
  :states 'visual
  "af" 'er/expand-region)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(provide 'init)

;;; init.el ends here
