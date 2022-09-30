#lang racket
(require json)

(define-syntax-rule (jsonic-mod-begin PARSE-TREE)
  (#%module-begin (display PARSE-TREE)))
(provide (rename-out [jsonic-mod-begin #%module-begin]))

#|
(define-syntax-rule (jsonic-sexp SEXP)
  (with-syntax ([something (read (open-input-string SEXP))])
    `,(syntax->datum #'something)))|#

(define-syntax-rule (jsonic-sexp SEXP ...)
  (jsexpr->string (SEXP ...)))

(provide jsonic-sexp)

(provide unquote)

(define-syntax-rule (jsonic-char CHAR)
  CHAR)

(provide jsonic-char)

(define-syntax-rule (jsonic-program PROGRAM ...)
  ;(foldr string-append "" (list PROGRAM ...)))
  (string-append PROGRAM ...))

(provide jsonic-program)
;(provide * = quote + list hash even?)
(provide (except-out (all-from-out racket) #%module-begin))

(provide #%app)
(provide #%top)
(provide #%datum)