;;smex

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; string inflection

(global-set-key (kbd "C-c i") 'string-inflection-cycle)
(global-set-key (kbd "C-c C") 'string-inflection-camelcase)        ;; Force to CamelCase
(global-set-key (kbd "C-c L") 'string-inflection-lower-camelcase)  ;; Force to lowerCamelCase
(global-set-key (kbd "C-c J") 'string-inflection-java-style-cycle) ;; Cycle through Java styles

;; ace-jump-mode

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

;; window management keybindings

(define-key global-map (kbd "<f1>") 'split-window-below)
(define-key global-map (kbd "<f2>") 'split-window-right)
(define-key global-map (kbd "<f3>") 'other-window)

;; frame management keybindings

(define-key global-map (kbd "<f4>") 'make-frame)

;; line movement
(define-key global-map (kbd "M-2") 'next-line)
(define-key global-map (kbd "M-1") 'previous-line)
(define-key global-map (kbd "M-`") 'beginning-of-buffer)
(define-key global-map (kbd "M-3") 'end-of-buffer)

;; magit

(global-set-key (kbd "C-x g") 'magit-status)

;; browse-kill-ring

(global-set-key (kbd "M-y") 'browse-kill-ring)

(require 'org)
(define-key org-mode-map (kbd "M-c t") 'org-insert-todo-heading)
(define-key org-mode-map (kbd "M-c h") 'org-insert-heading)
(define-key org-mode-map (kbd "C-\\") 'org-move-subtree-up)
(define-key org-mode-map (kbd "C-z") 'org-move-subtree-down)

;; ido

(defun bind-ido-keys ()
  (define-key ido-completion-map (kbd "M-2") 'ido-next-match) 
  (define-key ido-completion-map (kbd "M-1") 'ido-prev-match))

(add-hook 'ido-setup-hook #'bind-ido-keys)
