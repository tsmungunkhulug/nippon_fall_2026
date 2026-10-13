;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |bodlogo 1 dahih|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
;; sum-first-two : List-of-numbers -> Number
(define numbers (cons 4 (cons 7 (cons 9 empty))))
(define ( sum-first-two x)
  (+ (first x) (first (rest x))))
;; дор хаяж 2 элементтэй list-ийн эхний хоёр утгын нийлбэр
(check-expect (sum-first-two (cons 4 (cons 7 (cons 9 empty)))) 11)




;; starts-with-zero? : List-of-numbers -> Boolean
(define number ( cons 3 ( cons 8 empty)))
(define (starts-with-zero? x)
  (if (or (empty? x) (or (> (first x) 0) (< (first x) 0)))
           #f
           #t))
;; хоосон биш, эхний утга нь 0 бол #t. Хоосон list дээр алдаа гаргахгүй байх ёстой.
(check-expect (starts-with-zero? empty) #f)
(check-expect (starts-with-zero? (cons 0 empty)) #t)
(check-expect (starts-with-zero? (cons 5 (cons 0 empty))) #f)


;; one-item? : List-of-numbers -> Boolean
;; яг нэг элементтэй бол #t
(define (one-item? x)
  (cond
    [(empty? x) #f]
    [(empty? (rest x)) #t]
    [else #f]))

(check-expect (one-item? empty) #f)
(check-expect (one-item? (cons 1 empty)) #t)
(check-expect (one-item? (cons 1 (cons 2 empty))) #f)