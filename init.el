;;; init.el --- Emacs init file

;;; Commentary:
;;

;;; Code:

(package-initialize)

(require 'package)

(eval-when-compile 
  (require 'use-package))

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(setq use-package-always-ensure t)

(use-package 
  bind-key)

(use-package 
  server)

(use-package 
  exec-path-from-shell 
  :config (exec-path-from-shell-initialize))

(use-package 
  which-key 
  :init (which-key-mode))

(use-package 
  beacon 
  :init (beacon-mode 1))

(use-package 
  rjsx-mode 
  :mode "\\.js\\'")

(defun setup-tide-mode () 
  "Set up Tide mode." 
  (interactive) 
  (tide-setup) 
  (flycheck-mode +1) 
  (setq flycheck-check-syntax-automatically '(save-mode-enabled)) 
  (eldoc-mode +1) 
  (tide-hl-identifier-mode +1) 
  (company-mode +1))

(use-package 
  tide 
  :config (setq company-tooltip-align-annotations t) 
  (add-hook 'rjsx-mode-hook #'setup-tide-mode))

(use-package 
  projectile 
  :init (projectile-mode))

(use-package 
  avy)

(use-package 
  ace-window 
  :bind ("M-o" . ace-window) 
  :config (setq aw-keys '(?a ?r ?s ?t ?1 ?2 ?3 ?4 ?5)))

(setq projectile-completion-system 'ivy)

(use-package 
  ivy 
  :init (ivy-mode 1))

(use-package 
  zenburn-theme)

(use-package 
  counsel)

(use-package 
  counsel-projectile)

(use-package 
  clojure-mode)

(use-package 
  cider)

(use-package 
  wgrep)

(use-package 
  elisp-format)

(use-package 
  paredit 
  :config (add-hook 'emacs-lisp-mode-hook 'paredit-mode) 
  (add-hook 'scheme-mode-hook 'paredit-mode) 
  (add-hook 'lisp-mode-hook 'paredit-mode) 
  (add-hook 'lisp-interaction-mode-hook 'paredit-mode) 
  (add-hook 'clojure-mode-hook 'paredit-mode) 
  (if (bound-and-true-p paredit-mode) 
      (electric-pair-mode -1) 
    (electric-pair-mode 1)))

(use-package 
  paredit-everywhere 
  :config (add-hook 'prog-mode-hook 'paredit-everywhere-mode))

(use-package 
  geiser)

(use-package 
  company)

(use-package 
  telephone-line 
  :init (telephone-line-mode 1))

(use-package 
  magit 
  :bind ("C-x g" . magit-status))

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
  flycheck 
  :init (global-flycheck-mode))
(setq flycheck-check-syntax-automatically '(mode-enabled save idle-change))

(use-package 
  expand-region)

(setq company-tooltip-align-annotations t)

(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'auto-mode-alist '("\\.symlink$" . shell-script-mode))

(setq make-backup-files nil)
(setq auto-save-default nil)

(setq js-indent-level 2)
(setq js2-indent-level 2)
(setq rjsx-indent-level 2)

(setq-default js2-strict-trailing-comma-warning nil)
(set-frame-font "-*-Source Code Pro-regular-r-normal-*-16-*-*-*-m-0-iso10646-1" t t)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(setq ivy-height 5)

(tool-bar-mode -1)
(menu-bar-mode 1)
(scroll-bar-mode 0)
(global-visual-line-mode 1)
(desktop-save-mode 1)

(setq initial-frame-alist '((menu-bar-lines . 0) 
			    (tool-bar-lines . 0)))

(when (version<= "26.0.50" emacs-version ) 
  (global-display-line-numbers-mode))
(global-auto-revert-mode t)

(or (server-running-p) 
    (server-start))

(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "s-=") 'text-scale-increase)
(global-set-key (kbd "s--") 'text-scale-decrease)
(global-set-key (kbd "s-/") 'comment-or-uncomment-region)

(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)

(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)

(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "C-'") 'avy-goto-char)
(global-set-key (kbd "C-;") 'avy-goto-char-timer)
(global-set-key (kbd "C-=") 'er/expand-region)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(provide 'init)

;;; init.el ends here
