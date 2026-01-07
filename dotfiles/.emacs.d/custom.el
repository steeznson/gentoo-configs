(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-battery-mode t)
 '(display-time-mode t)
 '(elfeed-feeds
   '("www.theweek.co.uk/feeds/all" "old.reddit.com/r/hiphopheads.rss" "old.reddit.com/r/tennis.rss" "old.reddit.com/r/rugbyunion.rss" "old.reddit.com/r/games.rss"))
 '(package-selected-packages
   '(radio slime nov hackernews gnu-elpa-keyring-update magit ac-c-headers elfeed paredit markdown-mode))
 '(send-mail-function 'smtpmail-send-it)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Roboto Mono" :foundry "pyrs" :slant normal :weight regular :height 82 :width normal)))))

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

;; Eww Browser
(setq eww-download-directory "~/downloads/")
(setq browse-url-browser-function 'eww-browse-url)

;; ERC
(setq
 erc-nick "steeznson"
 erc-user-full-name "James Stevenson"
 erc-server "irc.libera.chat"
 erc-port "6667")

;; Mastodon
(setq mastodon-instance-url "https://glasgow.social"
      mastodon-active-user "steeznson@glasgow.social")

;; Global Formatting Configuration
(setq-default indent-tabs-mode nil)
(setq-default fill-column 80)
(setq show-paren-delay 0)
(show-paren-mode)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq c-basic-offset 4)
(setq js-indent-level 2)
(setq css-indent-offset 2)

;; Disable backup files
(setq make-backup-files nil)

;; Disable lockfiles.
(setq create-lockfiles nil)

;; dotnet
(use-package csharp-mode
  :if (executable-find "dotnet")
  :mode
  (("\\.cake\\'" . csharp-mode)
   ("\\.cs\\'"   . csharp-mode))
  :config
  (progn
    (c-toggle-auto-hungry-state 1)
    (c-toggle-auto-newline 1))
  (add-hook 'csharp-mode-hook 'toggle-truncate-lines)
  (add-hook 'csharp-mode-hook 'display-line-numbers-mode)
  )
(use-package fsharp-mode
  :if (executable-find "dotnet")
  :mode
  (("\\.fs\\'"  . fsharp-mode)
   ("\\.fsx\\'" . fsharp-mode)))

;; Change default location of Mail and News
(setq message-directory "~/.emacs.d/mail/")
(setq gnus-directory "~/.emacs.d/news/")
(setq nnfolder-directory "~/.emacs.d/mail/archive")
(setq nnfolder-active-file "~/.emacs.d/mail/archive/active")

;; Radio stations
(customize-set-variable
 'radio-command
 '("mpv" "--terminal=no" "--video=no" :url))

(customize-set-variable
 'radio-stations-alist
 '(("BBC World" . "http://a.files.bbci.co.uk/ms6/live/3441A116-B12E-4D2F-ACA8-C1984642FA4B/audio/simulcast/hls/nonuk/pc_hd_abr_v2/ak/bbc_world_service.m3u8")
   ("Times Radio" . "http://www.radiofeeds.net/playlists/timesb.pls?mp=stream-mobile")
   ))

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
  (shell-command "pactl set-sink-volume 1 +5%"))
(defun volume-down()
  (interactive)
  (shell-command "pactl set-sink-volume 1 -5%"))
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
            (format "\n%s\n"
                    (cdr (assoc-string "com" x))))
             replies ""))
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
  (setq content
        (replace-regexp-in-string "<wbr>" "\n"
           (replace-regexp-in-string "<br>" "\n"
                (concat op replies) t) t))
  (with-current-buffer (get-buffer-create "*/g/*") (insert content))
  (switch-to-buffer "*/g/*"))
(defun c-to-f-temp (x)
  (interactive "nEnter celcius: ")
  (princ (+ 32(* x 1.8))))
(defun f-to-c-temp (x)
  (interactive "nEnter farenheit: ")
  (princ(/ (- x 32) 1.8)))

;; Shortcuts
(global-set-key (kbd "C-x /") 'display-line-numbers-mode) ;;toggle lines
(global-set-key (kbd "C-x w") 'toggle-truncate-lines) ;;toggle line wra
(global-set-key (kbd "C-x p") 'send-invisible) ;;put password in minibuffer
(global-set-key (kbd "C-x t") 'untabify) ;; untabify shortcut
(global-set-key (kbd "C-x a") 'comment-or-uncomment-region-or-line) ;;comment region
(global-set-key (kbd "C-x ,") 'dumb-jump-go) ;;jump to def
(global-set-key
 (kbd "C-x n C-x t")
 (lambda()
   (interactive)
   (remove-all-specified-elements
    (read-string "Enter the element you wish to destroy: ")))) ;;destroy all undesired elements
