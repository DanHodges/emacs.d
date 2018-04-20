(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package) 
  (package-refresh-contents) 
  (package-install 'use-package))

(eval-when-compile 
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

(setq use-package-always-ensure t)

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
  projectile 
  :init (projectile-mode))

(use-package
  avy)
  
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
  flycheck)

(use-package 
  clojure-mode)

(use-package 
  cider)

(use-package 
  wgrep)

(use-package 
  elisp-format)

(use-package 
  paredit)

(use-package 
  geiser)

(use-package 
  company)

(use-package 
  telephone-line 
  :init (telephone-line-mode 1))

;;(use-package 
;;  evil)

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

(use-package flycheck
  :init (global-flycheck-mode))

(use-package expand-region)

(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'auto-mode-alist '("\\.symlink$" . shell-script-mode))

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq js-indent-level 2)
(setq js2-indent-level 2)
(setq rjsx-indent-level 2)
(setq-default js2-basic-offset 2 js2-bounce-indent-p nil)
(setq-default js2-strict-trailing-comma-warning nil)
(set-default-font "-*-Source Code Pro-regular-r-normal-*-16-*-*-*-m-0-iso10646-1")

(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(setq ivy-height 5)

(tool-bar-mode -1)
(menu-bar-mode 1)
(scroll-bar-mode -1)
(global-visual-line-mode 1)
(desktop-save-mode 1)
(when (version<= "26.0.50" emacs-version ) 
  (global-display-line-numbers-mode))
(global-auto-revert-mode t)

(require 'server)
(or (server-running-p) 
    (server-start))

(defun move-line-up () 
  (interactive) 
  (transpose-lines 1) 
  (forward-line -2))

(defun move-line-down () 
  (interactive) 
  (forward-line 1) 
  (transpose-lines 1) 
  (forward-line -1))

(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down)
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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(package-selected-packages
   (quote
    (expand-region avy telephone-line smart-mode-line-powerline-theme smart-mode-line cider clojure-mode flow-js2-mode flow-minor-mode company-lsp company company-mode magit dumb-jump geiser paredit parredit counsel-projectile use-package diminish))))
(put 'downcase-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
