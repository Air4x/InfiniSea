#lang racket/base
(require rnrs/base-6)


(struct Player (x y state))


;;; tile:
;;    type:     'normal
;;    status:   'empy
;;              'occupied
(struct tile (type status))


(define row (make-vector 5 (tile 'normal 'empty)))


(define (tile-status->char x)
  (cond
    [(equal? (tile-status x) 'empty) #\E]
    [(equal? (tile-status x) 'occupied #\O)]))

(define (display-row r)
  (vector-for-each (lambda (x) (display (tile-status->char x))) r))

(define (display-platform x)
  (vector-for-each display-row x))

;; A 5x5 raft, defined as a 5x5 matrix of Tiles
(define platform (make-vector 5  row))

(display-platform platform)
