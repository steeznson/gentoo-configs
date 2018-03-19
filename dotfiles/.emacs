;; allow emacs to use gnupg

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setf epa-pinentry-mode 'loopback)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (misterioso)))
 '(custom-safe-themes
   (quote
    ("868f73b5cf78e72ca2402e1d48675e49cc9a9619c5544af7bf216515d22b58e7" "5acb6002127f5d212e2d31ba2ab5503df9cd1baa1200fbb5f57cc49f6da3056d" default)))
 '(package-selected-packages
   (quote
    (helm elisp-sandbox mpv wolfram switch-window pde latex-extra jedi ids-edit function-args egg ecb bongo better-defaults bash-completion ac-math status cedit sudoku sunshine ranger jdee fancy-battery esk dark-souls ample-theme ac-php ac-python ac-html ac-c-headers irony-eldoc dionysos pdf-tools latex-preview-pane haskell-mode elpy irony rtags ccc auto-complete chess tiny-menu focus highlight treemacs dired-sidebar dired-sidebard js2-mode wpuzzle company tiny rainbow-mode dired-du highlight-escape-sequences ivy gited org-edna ##)))
 '(send-mail-function (quote smtpmail-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; set default browser
(setq browse-url-generic-program   
             (executable-find (getenv "BROWSER"))   
	      browse-url-browser-function 'browse-url-generic)
;; package manager repos
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
