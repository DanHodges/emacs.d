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

(eval-when-compile
  (require 'use-package))

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

(use-package
  flycheck
  :init (global-flycheck-mode))

(use-package
  elisp-format)

(use-package
  tide
  :config (setq company-tooltip-align-annotations t)
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

(use-package
  avy)

(use-package
  ace-window
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

(use-package paredit
  :config (add-hook 'emacs-lisp-mode-hook 'paredit-mode)
  (add-hook 'scheme-mode-hook 'paredit-mode)
  (add-hook 'lisp-mode-hook 'paredit-mode)
  (add-hook 'lisp-interaction-mode-hook 'paredit-mode)
  (add-hook 'clojure-mode-hook 'paredit-mode)
  (if (bound-and-true-p paredit-mode)
      (electric-pair-mode -1)
    (electric-pair-mode 1)))

(use-package paredit-everywhere
  :config (add-hook 'prog-mode-hook 'paredit-everywhere-mode))

(use-package
  geiser)

(use-package
  company)

(use-package
  telephone-line
  :init (telephone-line-mode 1))

(use-package
  magit)

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
  expand-region)

(setq company-tooltip-align-annotations t)

(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'auto-mode-alist '("\\.symlink$" . shell-script-mode))

(setq make-backup-files nil)
(setq auto-save-default nil)

(setq js-indent-level 2)
(setq js2-indent-level 2)
(setq rjsx-indent-level 2)
(setq next-line-add-newlines t)

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
(delete-selection-mode 1)

(setq initial-frame-alist '((menu-bar-lines . 0)
			    (tool-bar-lines . 0)))

(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))
(global-auto-revert-mode t)

(or (server-running-p)
    (server-start))

(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

(general-define-key
 "C-x g"  'magit-status
 "C-x C-b" 'ibuffer
 "s-=" 'text-scale-increase
 "s--" 'text-scale-decrease
 "s-/" 'comment-or-uncomment-region

 "C-s" 'swiper
 "M-x" 'counsel-M-x

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
 "C-'" 'avy-goto-char
 "C-;" 'avy-goto-char-timer
 "C-=" 'er/expand-region

 ;; https://blogs.sas.com/content/iml/2014/10/03/double-letter-bigrams.html#prettyPhoto

 (general-chord "bb") 'ivy-switch-buffer
 (general-chord "cc") (general-simulate-key "C-c")
 (general-chord "yy") 'avy-goto-char
 (general-chord "xx") (general-simulate-key "C-x")
 (general-chord "vv") 'er/expand-region
 (general-chord "ww") 'ace-window)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(provide 'init)

;;; init.el ends here
