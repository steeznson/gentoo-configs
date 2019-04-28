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
 '(custom-enabled-themes (quote (wombat)))
 '(display-battery-mode t)
 '(display-time-mode t)
 '(ecb-options-version "2.50")
 '(load-home-init-file t t)
 '(package-selected-packages
   (quote
    (undo-tree dockerfile-mode irony emms-player-simple-mpv company-jedi flycheck-pycheckers poker better-shell term+ djvu emms pdf-tools indent-tools xml+ company-c-headers yaml-mode nov sicp flycheck wiki-summary sudoku ivy ecb dired-ranger better-defaults)))
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 98 :width normal)))))

;; Packages repo
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

;; Buffer Management
(setq-default message-log-max nil)
(kill-buffer "*Messages*") ;;Removes *messages* from the buffer.
(add-hook 'minibuffer-exit-hook ;;Removes *Completions* from buffer.
      '(lambda ()
         (let ((buffer "*Completions*"))
           (and (get-buffer buffer)
                (kill-buffer buffer)))))
(setq inhibit-startup-buffer-menu t) ;;Hide buffer list
(add-hook 'window-setup-hook 'delete-other-windows) ;;Only show one active window
(fset 'yes-or-no-p 'y-or-n-p) ;;replace yes/no with y/n prompt
(setq initial-scratch-message "") ;;make scratch empty
(setq echo-keystrokes 0.1
      use-dialog-box nil ;;remove dialog box
      visible-bell t) ;;visual instead of bell audio

;; Change default location of Mail and News
(setq message-directory "~/.emacs.d/mail/")
(setq gnus-directory "~/.emacs.d/news/")
(setq nnfolder-directory "~/.emacs.d/mail/archive")
(setq nnfolder-active-file "~/.emacs.d/mail/archive/active")

;; Enable GNUPG
(setf epa-pinentry-mode 'loopback)

;; Disable backup files
(setq make-backup-files nil)

;; Global Modes
(ivy-mode 1)
(global-undo-tree-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Eww Browser
(setq eww-download-directory "~/downloads/") ;; download dir

;; Global Formatting Configuration
(setq-default indent-tabs-mode nil)  ;; Use only spaces and no tabs
(setq default-tab-width 4)           ;; "Tab" width is always 4 spaces
(show-paren-mode 1)                  ;; Always attempt to show matching parentheses
(when (fboundp 'electric-indent-mode) (electric-indent-mode -1)) ;; Disable auto-indent

;; C/C++ Development Config
(semantic-mode 1)            ;; CEDET holdover
(global-ede-mode 1)          ;; CEDET holdover
(setq c-default-style "bsd") ;; BSD/Allman brackets
(setq c-basic-offset 4)      ;; 4-space indent
(add-hook 'c-mode-common-hook 'company-mode)
(add-hook 'c-mode-common-hook 'linum-mode)
(add-hook 'c-mode-common-hook 'irony-mode)
;; (Conditional) C/C++ Keybinds
(add-hook 'c-mode-common-hook
          (lambda () (local-set-key (kbd "<C-tab>") 'company-complete)))
(add-hook 'c-mode-common-hook
          (lambda () (local-set-key (kbd "C-c j") 'find-tag)))

;; Python Development Configs
(setenv "PYTHONPATH" (shell-command-to-string "$SHELL --login -c 'echo -n $PYTHONPATH'"))
(setq py-python-command "python3")
(defcustom python-shell-interpreter "python3"
  "Default Python interpreter for shell."
  :type 'string
  :group 'python)
(add-hook 'python-mode-hook 'linum-mode)
(add-hook 'python-mode-hook 'company-mode)
(add-hook 'python-mode-hook 'flycheck-mode)

;; Rust development configs
(add-hook 'rust-mode-hook 'linum-mode)

;; Media Player
(require 'emms-setup)
(emms-all)
(emms-default-players)
(setq emms-source-file-default-directory "~/music/")
(global-set-key (kbd "<XF86AudioPlay>") 'emms-pause)
(global-set-key (kbd "<XF86AudioStop>") 'emms-stop)
(global-set-key (kbd "<XF86AudioPrev>") 'emms-previous)
(global-set-key (kbd "<XF86AudioNext>") 'emms-next)

;; Mode Line Config
(setq display-time-default-load-average nil)
(display-time-mode t)
(display-battery-mode 1)
(setq-default mode-line-format
     '("Λ:%m"
       "  Π:%b"
       "  ω:%l"
       "  τ:"
       display-time-string
       "  Δ:"
       battery-mode-line-string))

;; eshell config
(setq eshell-visual-commands
      '("less" "tmux" "top" "bash" "man"))
(setq eshell-visual-subcommands
      '("git" "log" "diff"))

;; Custom Functions
(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))
(defun volume-up()
  (interactive)
  (shell-command "pactl set-sink-volume 0 +5%"))
(defun volume-down()
  (interactive)
  (shell-command "pactl set-sink-volume 0 -5%"))
(defun bright-up()
  (interactive)
  (shell-command "xbacklight -inc 10"))
(defun bright-down()
  (interactive)
  (shell-command "xbacklight -dec 10"))
(defun remove-all-specified-elements (element-tag)
  (save-excursion
     (let ((case-fold-search nil))
       (while (search-forward-regexp (concat "<" element-tag "[^\\>]*>"))
     (delete-region
      (match-beginning 0)
      (search-forward (concat "</" element-tag ">")))))))

;; Shortcuts
(global-set-key (kbd "C-x /") 'linum-mode) ;;toggle linum-mode
(global-set-key (kbd "C-x w") 'toggle-truncate-lines) ;;toggle line wra
(global-set-key (kbd "C-x p") 'send-invisible) ;;put password in minibuffer
(global-set-key (kbd "C-x t") 'untabify) ;; untabify shortcut
(global-set-key (kbd "C-x a") 'comment-or-uncomment-region-or-line) ;;comment region
;;(global-set-key (kbd "<XF86AudioRaiseVolume>") 'volume-up) ;;raise volume
;;(global-set-key (kbd "<XF86AudioLowerVolume>") 'volume-down) ;;lower volume
;;(global-set-key (kbd "<XF86MonBrightnessUp>") 'bright-up) ;;raise brightness
;;(global-set-key (kbd "<XF86MonBrightnessDown>") 'bright-down) ;;lower brightness
(global-set-key
 (kbd "C-x n C-x t")
 (lambda()
   (interactive)
   (remove-all-specified-elements
    (read-string "Enter the element you wish to destroy: ")))) ;;destroy all undesired elements
