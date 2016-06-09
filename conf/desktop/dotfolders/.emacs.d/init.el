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

; Stop emacs backup files go into system temp directory
  (setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
  (setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))

; Setup relative line numbers
  (relative-line-numbers-mode)
