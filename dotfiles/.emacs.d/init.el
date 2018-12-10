(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (manoj-dark)))
 '(ecb-options-version "2.50")
 '(load-home-init-file t t)
 '(package-selected-packages
   (quote
    (emms elpy django-mode django-snippets flycheck-pycheckers flycheck-pyflakes jedi pylint python-mode pdf-tools irony ac-html clang-format doom eshell-did-you-mean eshell-git-prompt evil fuzzy indent-tools nasm-mode ssh web-beautify xml+ color-identifiers-mode company-c-headers magit flycheck-clangcheck yaml-mode projectile-codesearch nov git sicp flycheck auto-complete helm wiki-summary sudoku ivy ecb dired-ranger better-defaults)))
 '(scheme-program-name "guile")
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata" :foundry "PfEd" :slant normal :weight normal :height 120 :width normal)))))

;; enable ivy-mode
;;(ivy-mode 1)

;; allow emacs to use gnupg
(setf epa-pinentry-mode 'loopback)

;; package manager repo
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

;; comment/uncomment all region
(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))
(global-set-key (kbd "C-x a") 'comment-or-uncomment-region-or-line)

;; untabify shortcut
(global-set-key (kbd "C-x t") 'untabify)

;; Makes *scratch* empty.
(setq initial-scratch-message "")

;; Removes *scratch* from buffer after the mode has been set.
(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))
(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

;; Removes *messages* from the buffer.
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; Removes *Completions* from buffer after you've opened a file.
(add-hook 'minibuffer-exit-hook
      '(lambda ()
         (let ((buffer "*Completions*"))
           (and (get-buffer buffer)
                (kill-buffer buffer)))))

;; Don't show *Buffer list* when opening multiple files at the same time.
(setq inhibit-startup-buffer-menu t)

;; Show only one active window when opening multiple files at the same time.
(add-hook 'window-setup-hook 'delete-other-windows)

;; No more typing the whole yes or no. Just y or n will do.
(fset 'yes-or-no-p 'y-or-n-p) 

;; disable auto-indent
(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))

;; put password in minibuffer
(global-set-key (kbd "C-x p") 'send-invisible)

;; move News and Mail dirs
(setq message-directory "~/.emacs.d/mail/")
(setq gnus-directory "~/.emacs.d/news/")
(setq nnfolder-directory "~/.emacs.d/mail/archive")
(setq nnfolder-active-file "~/.emacs.d/mail/archive/active")

;; eww download directory
(setq eww-download-directory "~/downloads/")

;; Global Formatting Configuration
(setq-default indent-tabs-mode nil)  ;; Use only spaces and no tabs
(setq default-tab-width 4)           ;; "Tab" width is always 4 spaces
(show-paren-mode 1)                  ;; Always attempt to show matching parentheses

;; C/C++ Config
(semantic-mode 1)            ;; CEDET holdover
(global-ede-mode 1)          ;; CEDET holdover
(setq c-default-style "bsd") ;; BSD/Allman brackets
(setq c-basic-offset 4)      ;; 4-space indent
(add-hook 'c-mode-common-hook 'company-mode)
(add-hook 'c-mode-common-hook 'flycheck-mode)
(add-hook 'c-mode-common-hook 'linum-mode)

;; (Conditional) C/C++ Keybinds
(add-hook 'c-mode-common-hook
          (lambda () (local-set-key (kbd "<C-tab>") 'company-complete)))
(add-hook 'c-mode-common-hook
          (lambda () (local-set-key (kbd "C-c j") 'find-tag)))

;; toggle line wrap
(global-set-key (kbd "C-x w") 'toggle-truncate-lines)

;; Python settings
(setenv "PYTHONPATH" (shell-command-to-string "$SHELL --login -c 'echo -n $PYTHONPATH'"))
(setq py-python-command "python3")
(defcustom python-shell-interpreter "python3"
  "Default Python interpreter for shell."
  :type 'string
  :group 'python)

;; emms media player
(require 'emms-setup)
(emms-all)
(emms-default-players)
(setq emms-source-file-default-directory "~/music/")





