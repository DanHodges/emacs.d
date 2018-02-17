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

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

(use-package which-key
  :init
  (which-key-mode))
(use-package beacon
  :init
  (beacon-mode 1))
(use-package rjsx-mode
  :mode "\\.js\\'")
(use-package material-theme
  :defer t)
(load-theme 'material t)

(use-package projectile
  :init
  (projectile-mode))
(setq projectile-completion-system 'ivy)

(use-package ivy
  :init
  (ivy-mode 1))
(use-package counsel)
(use-package counsel-projectile)
(use-package flycheck)
(use-package lsp-mode)
(use-package lsp-javascript-typescript
  :init
  (add-hook 'rjsx-mode-hook #'lsp-javascript-typescript-enable))

(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(setq js2-strict-trailing-comma-warning nil)
(setq intibit-startup-message t)
(setq scroll-conservatively 10)
(setq scheme-program-name "/usr/local/bin/scheme")
(setq mac-command-modifier 'super)
(setq ring-bell-function 'ignore)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))



(when window-system  (global-hl-line-mode 1))
(when window-system  (global-prettify-symbols-mode t))

(tool-bar-mode -1)
(menu-bar-mode 1)
(scroll-bar-mode -1)
(global-visual-line-mode 1)
;;(desktop-save-mode 1)


(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "C-c v") 'ivy-push-view)
(global-set-key (kbd "C-c V") 'ivy-pop-view)
(global-set-key (kbd "<f6>") 'ivy-resume)
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
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)


(global-set-key (kbd "<s-kp-subtract>") 'split-window-below)
(global-set-key (kbd "s-\\") 'split-window-right)
(global-set-key (kbd "s-w") 'delete-window)
(global-set-key (kbd "s-W") 'delete-frame)
(global-set-key (kbd "s-[") (lambda () (interactive) (other-window -1)))
(global-set-key (kbd "s-]") (lambda () (interactive) (other-window 1)))
(global-set-key (kbd "s-i") 'projectile-find-tag)
(global-set-key (kbd "s-g") 'counsel-git-grep)
(global-set-key (kbd "s-o") 'projectile-switch-project)
(global-set-key (kbd "s-p") 'projectile-find-file)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(lsp-project-whitelist
   (quote
    ("^/Users/dxhodge/code/MyWsb/$" "^/Users/dxhodge/code/hawaii-react-js/$")))
 '(package-selected-packages (quote (counsel-projectile use-package diminish))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#263238" :foreground "#ffffff" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 145 :width normal :foundry "nil" :family "Source Code Pro")))))
