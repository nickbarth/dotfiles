(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq slime-contribs '(slime-fancy))

(require 'evil)
; (evil-mode t)

(global-font-lock-mode t)
(set-default 'truncate-lines t)
(set-default 'show-trailing-whitespace t)
(setq-default indent-tabs-mode nil)
(show-paren-mode 1)
(menu-bar-mode -1)

(setq tab-width 2)
(setq ad-redefinition-action 'accept)
(setq backup-inhibited t)
(setq auto-save-default nil)

(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

(global-set-key (kbd "C-x C-c") 'kill-emacs)
