(let ((default-directory (file-name-directory load-file-name)))
  (add-to-list 'load-path (file-truename "vendor"))
  (add-to-list 'load-path (file-truename "vendor/slime-2.18"))
  (load-file (file-truename "files/key-bindings.el"))
  (setq common-lisp-hyperspec-root (file-truename "../lisp/HyperSpec/")
        common-lisp-hyperspec-symbol-table (file-truename "../lisp/HyperSpec/Data/Map_Sym.txt")))

;; general emacs

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(show-paren-mode 1)
(setq redisplay-dont-pause t)
(setq blink-matching-paren-distance nil)
(setq next-screen-context-lines 30)
(setq confirm-kill-emacs 'y-or-n-p)
(setq undo-limit 100000)
(setq read-file-name-completion-ignore-case 't)
(setq read-buffer-completion-ignore-case 't)
(defalias 'yes-or-no-p 'y-or-n-p)

(setq frame-title-format "%b")

;; shell

(setq explicit-shell-file-name "C:/cygwin64/bin/bash.exe")
(setq shell-file-name explicit-shell-file-name)
(add-to-list 'exec-path "C:/cygwin64/bin")

;; dired

(add-hook 'dired-mode-hook 'dired-hide-details-mode)
(add-hook 'dired-mode-hook
	  (function (lambda () (dired-omit-mode 1))))
(add-hook 'dired-load-hook
	  (function (lambda () (load "dired-x"))))
(setq dired-isearch-filenames 1)

;; ido

(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

;; ido-vertical-mode

(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)

(setq ido-use-faces t)

;; js2-mode

(require 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(setq js2-basic-offset 2)
(setq-default indent-tabs-mode nil)
(setq json-reformat:indent-width 2)
(setq js-indent-level 2)

;; projectile

(require 'projectile)

(projectile-global-mode)
(setq projectile-indexing-method 'alien)
(setq projectile-enable-caching t)

;; i-search

(setq isearch-allow-scroll t)

;; auto-complete

(require 'popup)
(require 'auto-complete)
(require 'auto-complete-config)

(ac-config-default)

;; smex
(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                  ; when Smex is auto-initialized on its first run.

;; dash

(require 'dash)

;; with-editor

(require 'with-editor)

;; ag

(require 'ag)

(setq ag-highlight-search t)

;; string inflection

(require 'string-inflection)

;; browse-kill-ring

(require 'browse-kill-ring)

;; tide

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

;; format options
(setq tide-format-options '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t :placeOpenBraceOnNewLineForFunctions nil))

;;
;; ace jump mode major function
;; 
(add-to-list 'load-path "/full/path/where/ace-jump-mode.el/in/")
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)

(setq ace-jump-mode-case-fold t)

;; 
;; enable a more powerful jump back function from ace jump mode
;;
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))

;; slime
(require 'slime)
(slime-setup '(slime-fancy)) 
(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
(setq inferior-lisp-program "clisp -K full")

(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))


;; melpa

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line


;; theme

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (deeper-blue))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
