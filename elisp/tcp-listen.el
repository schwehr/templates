#!/usr/bin/emacs --script

(if (= 2 (length command-line-args-left))
    (message "args okay") ; okay!  don't exit
    (progn
      (message "ERROR: wrong number of args!")
      (message "Must specify host and port")
      (kill-emacs 1)
      )
)

(defvar listen-host (nth 0 command-line-args-left)
    "host to connect to")

(defvar listen-port (nth 1 command-line-args-left)
    "port of the service that we want to listen to")

(message (format "Connecting to host:port... %s:%s" listen-host listen-port))

(defun listen-start nil
    "starts an emacs echo server"
    (make-network-process :name "listen" :buffer "*listen*" :family 'ipv4 :host listen-host 
                 :service listen-port :sentinel 'listen-sentinel :filter 'listen-filter ) 
    )

(defun listen-stop nil
  "stop an emacs echo server"
  (delete-process "listen")
  )

(defun listen-filter (proc string)   
  ;(message proc)
  (message string)
  )

(defun listen-sentinel (proc msg)
  (when (string= msg "connection broken by remote peer\n")
    (message (format "client %s has quit" proc))))

(listen-start)
(sleep-for 300)
(listen-stop)