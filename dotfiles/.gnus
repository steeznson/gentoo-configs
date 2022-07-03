(setq user-mail-address "james.stevenson09@hotmail.co.uk"
      user-full-name "James Stevenson")

(setq gnus-select-method
      '(nnimap "gmail"
	       (nnimap-address "imap-mail.outlook.com")
	       (nnimap-server-port 993)
	       (nnimap-stream ssl)))

(setq smtpmail-smtp-server "smtp-mail.outlook.com"
      smtpmail-smtp-service 587
      gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")
