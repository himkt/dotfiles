; emacs config

; path
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/packages")

; lang
; (set-locale-environment nil)
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

(setq inhibit-startup-message t)
(setq make-backup-files nil)
(setq delete-auto-save-files t)
(setq default-buffer-file-coding-system 'utf-8)

; use space instead of tab
(setq-default tab-width 4 indent-tabs-mode nil)

; visualize break lines
(setq eol-mnemonic-dos "(CRLF)")
(setq eol-mnemonic-mac "(CR)")
(setq eol-mnemonic-unix "(LF)")

; remove the whole line with c-k
(setq kill-whole-line t)

(if (fboundp 'global-font-lock-mode)
   (global-font-lock-mode 1)        ; GNU Emacs
 (setq font-lock-auto-fontify t))   ; XEmacs
