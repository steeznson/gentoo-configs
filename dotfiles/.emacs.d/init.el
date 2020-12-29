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
 '(custom-safe-themes
   (quote
    ("6bc387a588201caf31151205e4e468f382ecc0b888bac98b2b525006f7cb3307" default)))
 '(display-time-mode t)
 '(ecb-options-version "2.50")
 '(fci-rule-color "#383838")
 '(load-home-init-file t t)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (slime dumb-jump rust-mode emms evil wiki-summary dockerfile-mode company-plsense flycheck-irony undo-tree irony company-jedi flycheck-pycheckers better-shell term+ djvu pdf-tools indent-tools xml+ company-c-headers yaml-mode nov sicp flycheck sudoku ivy ecb dired-ranger better-defaults)))
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata" :foundry "PfEd" :slant normal :weight normal :height 241 :width normal)))))

;; Packages repo
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; Buffer Management
(kill-buffer "*Messages*") ;;Removes *messages* from the buffer.
(setq-default message-log-max nil)
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
      use-dialog-box nil) ;;remove dialog box
;;      visible-bell t) ;;visual instead of bell audio

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
(dumb-jump-mode 1)
;;(global-undo-tree-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

;; Make CTRL-x CTRL-u the "undo" command; this is better than "CTRL-x u"
;; because you don't have to release the CTRL key.
(define-key global-map "\C-x\C-u" 'undo)

;; Eww Browser
(setq eww-download-directory "~/downloads/") ;; download dir
(setq url-proxy-services
      '(("http" . "127.0.0.1:8118")))
(setq browse-url-browser-function 'eww-browse-url) ;; use eww for links

;; Global Formatting Configuration
(setq-default indent-tabs-mode nil)  ;; Use only spaces and no tabs
(setq default-tab-width 4)           ;; "Tab" width is always 4 spaces
(show-paren-mode 1)                  ;; Always attempt to show matching parentheses
(when (fboundp 'electric-indent-mode) (electric-indent-mode -1)) ;; Disable auto-indent

;; C/C++ Development Config
(semantic-mode 1)            ;; CEDET holdover
(global-ede-mode 1)          ;; CEDET holdover
(setq c-default-style "bsd") ;; BSD brackets
(setq c-basic-offset 4)      ;; 4-space indent
(add-hook 'c-mode-common-hook 'company-mode)
(add-hook 'c-mode-common-hook 'irony-mode)
(add-hook 'c-mode-common-hook 'toggle-truncate-lines)
(add-hook 'c-mode-common-hook 'display-line-numbers-mode)
;; (Conditional) C/C++ Keybinds
(add-hook 'c-mode-common-hook 'flycheck-mode)
(add-hook 'c-mode-common-hook
	  (lambda () (local-set-key (kbd "<C-tab>") 'company-complete)))
(add-hook 'c-mode-common-hook
	  (lambda () (local-set-key (kbd "C-c j") 'find-tag)))

;; Python Development Configs
(setenv "PYTHONPATH" (shell-command-to-string "$SHELL --login -c 'echo -n $PYTHONPATH'"))
(setq py-python-command "python3")
(setq flycheck-python-pycompile-executable "python3")
(defcustom python-shell-interpreter "python3"
  "Default Python interpreter for shell."
  :type 'string
  :group 'python)
(add-hook 'python-mode-hook 'company-mode)
(add-hook 'python-mode-hook 'flycheck-mode)
(add-hook 'python-mode-hook 'toggle-truncate-lines)
(add-hook 'python-mode-hook 'display-line-numbers-mode)

;; elisp development configs
(add-hook 'emacs-lisp-mode-hook 'toggle-truncate-lines)
(add-hook 'emacs-lisp-mode-hook 'display-line-numbers-mode)

;; common lisp development configs
(setq inferior-lisp-program (executable-find "clisp"))
(add-hook 'lisp-mode-hook 'toggle-truncate-lines)
(add-hook 'lisp-mode-hook 'display-line-numbers-mode)

;; rust development configs
(add-hook 'rust-mode-hook 'toggle-truncate-lines)
(add-hook 'rust-mode-hook 'display-line-numbers-mode)

;; Perl development configs
(add-hook 'perl-mode-hook 'company-mode)
(add-hook 'perl-mode-hook 'toggle-truncate-lines)
(add-hook 'perl-mode-hook 'display-line-numbers-mode)

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
(add-to-list 'display-buffer-alist
	     `(,(rx bos "*shell*")
	       display-buffer-same-window
	       (reusable-frames . visible)))

;; emms
(add-to-list 'load-path "~/.emacs.d/emms/lisp/")
(require 'emms-setup)
(emms-all)
(emms-default-players)

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
(defun alist-keys (alist)
  (mapcar 'car alist))
(defun get-json (uri)
  "Fetch the contents of URI and parse."
  (with-current-buffer (url-retrieve-synchronously uri)
    (goto-char (point-min))
    (goto-char url-http-end-of-headers)
    (prog1 (json-read)
      (kill-buffer))))
(defun catreplies (replies)
  (mapconcat (lambda (x)
            (format "\n%s\n" (cdr (assoc-string "com" x)))) replies ""))
(defun random-gee ()
  (interactive)
  (setq catalog
    (get-json "https://a.4cdn.org/g/catalog.json"))
  (setq thread (aref (cdr (assoc-string "threads" (aref catalog 0))) (random 10)))
  (setq op
      (format "\n%s\t%s\t%s\n%s"
              (cdr (assoc-string "no" thread))
              (cdr (assoc-string "name" thread))
              (cdr (assoc-string "sub" thread))
              (cdr (assoc-string "com" thread))))
  (setq rawreplies (cdr (assoc-string "last_replies" thread)))
  (setq replies (catreplies rawreplies))
  (setq content (concat op replies))
  (with-current-buffer (get-buffer-create "*/g/*") (insert content))
  (switch-to-buffer "*/g/*"))

;; Shortcuts
(global-set-key (kbd "C-x /") 'display-line-numbers-mode) ;;toggle lines
(global-set-key (kbd "C-x w") 'toggle-truncate-lines) ;;toggle line wra
(global-set-key (kbd "C-x p") 'send-invisible) ;;put password in minibuffer
(global-set-key (kbd "C-x t") 'untabify) ;; untabify shortcut
(global-set-key (kbd "C-x a") 'comment-or-uncomment-region-or-line) ;;comment region
(global-set-key (kbd "C-x ,") 'dumb-jump-go) ;; jump to func definition
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
