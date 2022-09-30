#lang racket

(require 
  parser-tools/lex
  (prefix-in : parser-tools/lex-sre))
(require racket/contract rackunit)

(define-tokens op-tokens (SEXP CHAR))
(define-empty-tokens mt-tokens (EOF))

(provide op-tokens mt-tokens)

(define tokenize
  (lexer
   [(eof) 'EOF]
   [(:: "//" (complement (:: any-string "\n" any-string)) "\n") (tokenize input-port)]
   [(:: "@$" (complement (:: any-string "$@" any-string)) "$@") (token-SEXP
                               (read (open-input-string (string-trim (string-trim lexeme "@$") "$@"))))]
   [any-char (token-CHAR lexeme)]))

(provide (contract-out
          [tokenize (input-port? . -> . any/c)]))

