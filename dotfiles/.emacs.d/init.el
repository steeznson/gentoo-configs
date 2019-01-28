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
 '(ecb-options-version "2.50")
 '(load-home-init-file t t)
 '(package-selected-packages
   (quote
    (better-shell clojure-mode fancy-battery highlight jdee minesweeper olivetti origami prodigy pulseaudio-control rustic ssh-tunnels term+ treemacs djvu flycheck-clang-tidy exwm emms elpy django-mode django-snippets flycheck-pycheckers flycheck-pyflakes jedi pylint python-mode pdf-tools irony ac-html clang-format doom eshell-did-you-mean eshell-git-prompt evil fuzzy indent-tools nasm-mode ssh web-beautify xml+ company-c-headers magit flycheck-clangcheck yaml-mode projectile-codesearch nov git sicp flycheck auto-complete helm wiki-summary sudoku ivy ecb dired-ranger better-defaults)))
 '(scheme-program-name "guile")
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Liberation Mono" :foundry "1ASC" :slant normal :weight normal :height 98 :width normal)))))

;; enable ivy-mode
(ivy-mode 1)

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
(global-set-key (kbd "<XF86AudioPlay>") 'emms-pause)
(global-set-key (kbd "<XF86AudioStop>") 'emms-stop)
(global-set-key (kbd "<XF86AudioPrev>") 'emms-previous)
(global-set-key (kbd "<XF86AudioNext>") 'emms-next)

;; exwm
(require 'exwm)
(require 'exwm-config)
(exwm-config-default)
(setq exwm-workspace-number 4)

;; Turn on `display-time-mode' if you don't use an external bar.
(setq display-time-default-load-average nil)
(display-time-mode t)

;; Display battery
(display-battery-mode 1)

;; Set backlight brightness
(defun bright-up()
  (interactive)
  (shell-command "xbacklight -inc 10"))
(defun bright-down()
  (interactive)
  (shell-command "xbacklight -dec 10"))
(global-set-key 
 (kbd "<XF86MonBrightnessUp>") 'bright-up)
(global-set-key 
 (kbd "<XF86MonBrightnessDown>") 'bright-down)

;; Enable volume controls
(defun volume-up()
  (interactive)
  (shell-command "pactl set-sink-volume 0 +5%"))
(defun volume-down()
  (interactive)
  (shell-command "pactl set-sink-volume 0 -5%"))
(global-set-key 
 (kbd "<XF86AudioRaiseVolume>") 'volume-up)
(global-set-key 
 (kbd "<XF86AudioLowerVolume>") 'volume-down)

;; toggle linum-mode
(global-set-key (kbd "C-x /") linum-mode)
