;; packages
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(unless package--initialized
  (package-initialize))

;; package list
(setq package-selected-packages
      '(
        jbeans-theme
        evil
        evil-leader
        evil-collection
        ack
        undo-tree
        mood-line
        rainbow-delimiters
        ))

;; ensure installed
(dolist (package package-selected-packages)
  (unless (package-installed-p package)
    (unless package-archive-contents
      (package-refresh-contents))
    (package-install package)))

;; defaults
(setq
 confirm-kill-processes nil
 create-lockfiles nil
 make-backup-files nil)

(setq-default
 indent-tabs-mode nil
 tab-width 4)

;; whitespace
(add-hook
 'before-save-hook
 'whitespace-cleanup)

;; matching parens
(show-paren-mode)

;; gui
(setq inhibit-splash-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; plugins
(rainbow-delimiters-mode) ;; colored parens
(mood-line-mode)          ;; statusline
(global-undo-tree-mode)   ;; evil redo                                                                                                                                                                                       

(setq evil-undo-system 'undo-tree)

;; evil mode
(setq evil-want-integration t)
(setq evil-want-keybinding nil)

(require 'evil)
(when (require 'evil-collection nil t)
  (evil-collection-init))
(evil-mode 1)

;; evil Leader
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "SPC")

(evil-leader/set-key
  "f" 'fzf-git-files
  "e" (lambda () (interactive) (dired (file-name-directory buffer-file-name)))
  ";" 'ack
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (jbeans-theme fzf evil evil-leader evil-collection ack undo-tree mood-line rainbow-delimiters))))

(load-theme 'jbeans t)
