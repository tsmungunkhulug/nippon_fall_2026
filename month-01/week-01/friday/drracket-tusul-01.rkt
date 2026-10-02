;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname drracket-tusul-01) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Функцийн нэр: item-total
; Оролт: x y
; Гаралт: niit zardal
; Томьёо: x * y
(define (item-total x y)
  (* x y))
"total price"
(item-total 5000 5)
; Функцийн нэр: discount-amount
; Оролт: q w 
; Гаралт: discountiin uniin hemjee
; Томьёо: item-total functioniig / 10 t huwaana
(define (discount-amount q w)
  (/ (item-total q w) 10))

"discount"
(discount-amount 5000 5)
; Функцийн нэр: tax-amount
; Оролт: w
; Гаралт: tax nii une
; Томьёо: 25000 * w
"tax"
(define (tax-amount w)
  (* 25000 w))
(tax-amount 0.02)

; Функцийн нэр: final-price
; Оролт: x
; Гаралт: etssiijn une
; Томьёо: x - discount amount + tax-amount
"final price"
(define (final-price x)
  (+ (- x (discount-amount 5000 5)) (tax-amount 0.02)))
(final-price 25000)
  
; Функцийн нэр: total-for-2-product
; Оролт: w
; Гаралт: 2 baraanii une
; Томьёо: 5000 * x
"total for 2 product"
(define (total-for-2-product w)
  (* 5000 w))
(total-for-2-product 2)
 


