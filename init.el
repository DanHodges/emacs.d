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
  zenburn-theme)
(set-face-attribute 'fringe nil 
		    :background nil)

(use-package 
  projectile 
  :init (projectile-mode))

(setq projectile-completion-system 'ivy)

(use-package 
  ivy 
  :init (ivy-mode 1))

(use-package 
  counsel)

(use-package 
  neotree)

(use-package 
  counsel-projectile)

(use-package 
  flycheck)

(use-package 
  lsp-mode)

(use-package 
  lsp-javascript-typescript 
  :init (add-hook 'rjsx-mode-hook #'lsp-javascript-typescript-enable))

(use-package 
  wgrep)

(use-package 
  elisp-format)

(use-package 
  evil 
  :init (evil-mode 1))

(use-package 
  paredit)

(use-package 
  geiser)

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
  powerline 
  :config (powerline-default-theme))

(use-package 
  company)
(add-hook 'after-init-hook 'global-company-mode)
(use-package 
  company-lsp)
(push 'company-lsp company-backends)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq js-indent-level 2)
(setq js2-indent-level 2)
(setq rjsx-indent-level 2)
(setq-default js2-basic-offset 2 js2-bounce-indent-p nil)

(setq-default js2-strict-trailing-comma-warning nil)
(setq-default line-spacing .25)
(set-default-font "Monaco-14")

(when window-system  (global-hl-line-mode 1))
(when window-system  (global-prettify-symbols-mode t))

(tool-bar-mode -1)
(menu-bar-mode 1)
(scroll-bar-mode -1)
(global-visual-line-mode 1)
(desktop-save-mode 1)
(global-linum-mode)
(global-auto-revert-mode t)

(require 'server)
(or (server-running-p) 
    (server-start))

(global-set-key (kbd "s-1") 'neotree-toggle)

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

(global-set-key (kbd "s-[") 
		(lambda () 
		  (interactive) 
		  (other-window -1)))

(global-set-key (kbd "s-]") 
		(lambda () 
		  (interactive) 
		  (other-window 1)))
(global-set-key (kbd "s-<left>")  'windmove-left)
(global-set-key (kbd "s-<right>") 'windmove-right)
(global-set-key (kbd "s-<up>")    'windmove-up)
(global-set-key (kbd "s-<down>")  'windmove-down)

(global-set-key (kbd "s-e") 'evil-mode)
;; use Emacs keybindings when in insert mode }:)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(global-set-key (kbd "s-(") 'paredit-mode)
(global-set-key (kbd "s-p") 'projectile-find-file)
(global-set-key (kbd "s-P") 'projectile-switch-project)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "s-=") 'text-scale-increase)
(global-set-key (kbd "s--") 'text-scale-decrease)
(global-set-key (kbd "s-/") 'comment-or-uncomment-region)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector [default default default italic underline success warning error]) 
 '(lsp-project-whitelist (quote ("^/Users/dxhodge/code/MyWsb/$" "^/Users/dxhodge/code/TitleBits/$"
				 "^/Users/dxhodge/code/hawaii-react-js/$"))) 
 '(package-selected-packages (quote (company-lsp company company-mode neotree powerline magit
						 dumb-jump geiser paredit parredit
						 counsel-projectile use-package diminish))))
(put 'downcase-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
