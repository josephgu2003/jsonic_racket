#lang racket
(require "parser.rkt")

(require "tokenizer.rkt")
(define (read-syntax-my path port)
  (define src-lines (jsonic-parse (λ () (tokenize port))))
  (define module-datum `(module jsonic-module jsonic/expander ,@src-lines))
  (datum->syntax #f module-datum)) 

(provide (rename-out [read-syntax-my read-syntax]))