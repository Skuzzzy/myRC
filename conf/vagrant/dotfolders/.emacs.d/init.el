  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
  (package-initialize)

; Evil, vimlike keybindings for emacs
  (setq evil-want-C-u-scroll t) ; I want ctrl+U vimlike binding
  (require 'evil)
  (evil-mode 1)

; Set up evil escape mode
; Allows the use of jk rather than <esc> for getting out of insert mode 
  (setq-default evil-escape-key-sequence "jk") 
  (setq-default evil-escape-delay 0.2)
  (setq-default evil-escape-unordered-key-sequence t)
  (evil-escape-mode)

; Monokai theme
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
  (load-theme 'monokai t)

; Add manual installs folder
  (add-to-list 'load-path "~/.emacs.d/installs/")

; Stop emacs backup files go into system temp directory
  (setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
  (setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))

; Setup relative line numbers
  (relative-line-numbers-mode)

; Enable evil leader
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>")

; Setup Nerd Commenter
  (evilnc-default-hotkeys)
;; Vim key bindings
  (require 'evil-leader)
  (global-evil-leader-mode)
  (evil-leader/set-key
    "<SPC>" 'evilnc-comment-or-uncomment-lines
    ;; "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
    ;; "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
    ;; "cc" 'evilnc-copy-and-comment-lines
    ;; "cp" 'evilnc-comment-or-uncomment-paragraphs
    ;; "cr" 'comment-or-uncomment-region
    ;; "cv" 'evilnc-toggle-invert-comment-line-by-line
    ;; "\\" 'evilnc-comment-operator ; if you prefer backslash key
  )

; Other
  (evil-leader/set-key "e" 'find-file)

  (setq c-default-style "linux"
          c-basic-offset 4)

  (defun set-newline-and-indent ()
  (local-set-key (kbd "RET") 'newline-and-indent))
  (add-hook 'c-mode 'set-newline-and-indent)

; Enable Line Numbers
  (linum-mode)

; Set indent
  (global-set-key "\C-m" 'newline-and-indent)
