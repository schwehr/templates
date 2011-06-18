#!/usr/bin/emacs --script
; -*- lisp-interaction -*-  <- Tell emacs that we want to be able to work in the buffer
; Keys:

(+ 1 2.2) ; Ctrl-J in interaction mode to get the results.  -> 3.2
(+ 1 2)   ; C-x C-e to execute and see the results in the minibuffer -> 3
(= 5 10)  ; C-M x - results in the minibuffer, but works inside the expression -> nil

(= 1 1) ; Compare numbers -> t
(equal 1 '1) ; compare how - similar meaning?? -> t
(eq 1 '1) ; compare how - same object?? -> t

(if t "yup.  true" "no.  false") ; -> "yup.  true"

(if nil "yup.  true" "no.  false") ; -> "no.  false"

(if () "yup.  true" "no.  false") ; -> "no.  false"



(integerp 11) ; -> t ; Test if it is an integer
(integerp "11") ; -> nil
(number-to-string 1234) ; -> "1234"
(string-to-number "1234.5") ; -> 1234.5

'(1 2 3) ; -> (1 2 3) ; -> 
(quote (1 2 3)) ; -> (1 2 3) 

; back tick/quote - behaves differently - FIX: how???
`(1 2 3) ; -> (1 2 3)
(cons 1 '(2 3)) ; -> (1 2 3)
(car '(1 2 3)) ; -> 1
(cdr '(1 2 3)) ; -> (2 3)
(concat "ab" "cd" "12" "34") ; -> "abcd1234"


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Pulling data over http

(require 'url)
(let ((buffer (url-retrieve-synchronously "http://schwehr.org/"))))


(progn (switch-to-buffer
        (url-retrieve-synchronously "http://schwehr.org"))
       (point))


(let ((buffer (url-retrieve-synchronously
	       "http://tromey.com/elpa/package-install.el"))))

