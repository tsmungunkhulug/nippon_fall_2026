;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;Exercise1
(+ 8 6 )

;;Exercise2
(- 17 9 )

;;Exercise3
(* 6 7)

;;Exercise4
(+ 12 9 )

;;Exercise5
(+ 4 5)

;;Exercise6
(- 24 7)

;;Exercise7
(* 9 4 )

;;Exercise8
(/ 36 6)

;;Exercise9
(* 15 3)

;;Exercise10
(* (- 20 5 ) 2 )

;;Exercise11
(+ (* 3 4) 7)

;;Exercise12
(- (* 5 6) 8)

;;Exercise13
(* (+ 4 3 ) 5)

;;Exercise14
(+ 10 (* 2 6))

;;Exercise15
(* (+ 2 5) (- 10 4))

;;Exercise16
(define age 20)
age

;;Exercise17
(define price 5000)
(define quantity 3)
(* price quantity)

;;Exercise18
(define width 8)
(define height 4)
(* width height)

;;Exercise19
(define x 12)
(define y 5)
(- x y)

;;Exercise20
(define (double x)
  (* 2 x))
(double 10)

;;Exercise21
(define (triple x)
  (* 3 x))
(triple 6)

;;Exercise22
(define (add-five x)
  (+ 5 x))
(add-five 12)  


;;Exercise23
(define (square x)
  (* x x))
(square 7)

;;Exercise24
(define (minutes-to-seconds x)
  (* 60 x))
(minutes-to-seconds 5)

;;Exercise25
(define ( add-two x y)
  (+ x y))
(add-two 8 7 )

;;Exercise26
(define (rectangle-area width height)
  (* width height))
(rectangle-area 6 4)

;;Exercise27
(define (rectangle-perimeter x y)
  (* (+ x y ) 2))
(rectangle-perimeter 5 3)

;;Exercise28
(define (total-price price quantity)
  (* price quantity))
(total-price 1200 4)

;;Exercise29
(define (double2 x)
  (* x 2))
(double2 5)

;;Exercise30
(define (difference x y )
  (- x y ))
(difference 15 6 )