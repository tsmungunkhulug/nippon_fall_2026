;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lesson) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(+ 3 4)
(- 10 6)
(* 5 8)
(/ 20 4)
(+ 100 50)
(- 30 12)
(* 7 6)
(/ 81 9)
(+ 1 2 3)
(+ 10 20 30)
(* 2 3 4)
(- 20 5 3 )
(/ 200 2 5 )
(+ (* 2 3 ) 4)
(* 2 3 )
(+ 2 3)
(define name "mungunkhulug")
(define job "suragch")
(define age 19)
name
job
age
(define width 5)
(define  height 4)
(+ width height)
(* width height)
(define price 100)
(define quantity 3)
(* price quantity)
(define salary 1500)
(define bonus 300)
(+ (* 300 20) 1500) 
(+ 1500 300)
;; x iig funktsiin parameter gene input gesen ug
;; function process gedeg ni 
(define (square x)
  (* x x))
(square 5)
;; double gedeg nertei 1 parametr awaad tuuniig doubldaad tuunii utgiig 2 ooor urjuuldeg punkts bic
;; tuuniig 4 8 -35 gedeg argumentaar testel
(define (double q)
  (* 2 q))
(double 4)
(double 8)
(double -35)
;;triple gedeg parametr
(define (triple w)
  (* 3 w))
(triple 4)
(triple 8)
;; ex 6
(define (add e)
  (+ 10 e))
(add 3)
(add 7)
;; multiple parametr
;;two parametered function

(define (calculate_area_rectangle width height)
  (* width height))
(calculate_area_rectangle 5 6 )
;;
(define (calculate-peremeter width height)
  (* (+ width height) 2 ))
  (calculate-peremeter 5 6)
(define (circle-square radius)
  (* 3.14 radius radius))
(circle-square 1)
