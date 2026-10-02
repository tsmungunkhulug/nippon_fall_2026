;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname project02) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

"heden tsag ywah we"
; Функцийн нэр: travel-time
; Оролт: x y
; Гаралт: niit hugatsaa
; Томьёо: x / y
(define (travel-time x y)
  (/ x y))
(travel-time 300 60)

"her ih fuel shaardah we"
; Функцийн нэр: fuel-needed
; Оролт: x y
; Гаралт: heden litr fuel hereg bolohiig gargana
; Томьёо: x / y
(define (fuel-needed x y)
  (/ x y))
(fuel-needed 300 20)

"zardal"
; Функцийн нэр: fuel-cost
; Оролт: x 
; Гаралт: fuel nii niit zardliig gargana
; Томьёо: x * fuel-needed function
(define (fuel-cost x)
  (* (fuel-needed 300 20) x))
(fuel-cost 3040)

"dundaj hurd"
; Функцийн нэр: average speed
; Оролт: x y
; Гаралт: mashinii dundaj hurd
; Томьёо: x / y
(define (average-speed x y)
  (/ x y ))
(average-speed 300 5)

"tuulah zam"
; Функцийн нэр: total-distance
; Оролт: x y
; Гаралт: niit zam
; Томьёо: x * y
(define (total-distance x y)
  (* x y))
(total-distance 60 5 )






