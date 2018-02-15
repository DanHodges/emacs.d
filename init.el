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

(use-package which-key
  :ensure t
  :init
  (which-key-mode))

(use-package beacon
  :ensure t
  :init
  (beacon-mode 1))

(use-package rjsx-mode
  :ensure t
  :mode "\\.js\\'")

(use-package material-theme
  :ensure t
  :defer t)
(load-theme 'material t)

(use-package ivy
  :ensure t
  :init
  (ivy-mode 1))

(use-package counsel
  :ensure t)

(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(setq js2-strict-trailing-comma-warning nil)
(setq intibit-startup-message t)
(setq scroll-conservatively 10)
(setq scheme-program-name "/usr/local/bin/scheme")
(setq mac-command-modifier 'super)

(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
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

(tool-bar-mode -1)
(menu-bar-mode 1)
(scroll-bar-mode -1)
(global-visual-line-mode 1)
(desktop-save-mode 1)

(when window-system  (global-hl-line-mode 1))
(when window-system  (global-prettify-symbols-mode t))

(global-set-key (kbd "<s-kp-subtract>") 'split-window-below)
(global-set-key (kbd "s-\\") 'split-window-right)
(global-set-key (kbd "s-w") 'delete-window)
(global-set-key (kbd "s-W") 'delete-frame)
(global-set-key (kbd "s-[") (lambda () (interactive) (other-window -1)))
(global-set-key (kbd "s-]") (lambda () (interactive) (other-window 1)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(package-selected-packages (quote (rjsx-mode beacon which-key use-package diminish))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
