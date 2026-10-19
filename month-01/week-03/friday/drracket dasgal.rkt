;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |drracket dasgal|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
;; scale-all : List-of-numbers Number -> List-of-numbers
(define (scale-all l x)
  (cond
    [(empty? l) empty]
    [else (cons (* (first l) x) (scale-all (rest l) x))]))

                   
;; тоо бүрийг factor-оор үржүүлнэ
(check-expect (scale-all empty 10) empty)
(check-expect (scale-all (list 1 2) 10) (list 10 20))


;; best-grade : NEList-of-numbers -> String
;; Хамгийн их онооны үсгэн дүнг олно.
(define (highest l)
  (cond
    [(empty? (rest l)) (first l)]
    [else (if (> (first l) (highest (rest l)))
               (first l)
               (highest (rest l)))]))
(define (letter-grade x)
  (cond
    [(>= x 90) "A"]
    [(>= x 80) "B"]
    [(>= x 70) "C"]
    [(>= x 60) "D"]
    [else "F"]))

(define (best-grade l)
  (letter-grade (highest l)))

(check-expect (best-grade (list 70 95)) "A")
(check-expect (best-grade (list 59)) "F")


;; badge-row : List-of-numbers -> Image
(define (grade-color x)
  (cond
    [(>= x 90) "green"]
    [(>= x 80)  "green"]
    [(>= x 70)  "green"] 
    [(>= x 60) "green"]
    [else "red"]))
(define (grade-badge x)
  (cond
    [(>= x 90)  (circle 20 "solid" (grade-color x))]
    [(>= 89 x)  (circle 20 "solid" (grade-color x))]))
(define (badge-row l)
  (cond
    [(empty? l) empty-image]
    [else (beside (grade-badge (first l)) (badge-row (rest l)))]))
    
;; оноо бүрийг 2-р долоо хоногийн pass-fail-badge-аар (60+ ногоон, бусад улаан, радиус 20) зүүнээс баруун тийш
(check-expect (badge-row empty) empty-image)
(check-expect (badge-row (list 60 59))
              (beside (circle 20 "solid" "green") (circle 20 "solid" "red")))

;; grade-bar : Number -> Image
(define (grade-bar x)
  (rectangle x 20 "solid" (grade-color x)))
;; өргөн нь оноо, өндөр 20, өнгө нь grade-color
(check-expect (grade-bar 95) (rectangle 95 20 "solid" "green"))
(check-expect (grade-bar 59) (rectangle 59 20 "solid" "red"))


;; grade-bars : List-of-numbers -> Image
(define (grade-bars l)
  (cond
    [(empty? l) empty-image]
    [else (above (grade-bar (first l)) (grade-bars (rest l)))]))
;; оноо бүрийн grade-bar-ыг дээрээс доош
(check-expect (grade-bars empty) empty-image)
(check-expect (grade-bars (list 95 59)) (above (grade-bar 95) (grade-bar 59)))


;; row-of-circles : Natural -> Image
;;(define (row-of-circles n)
;;  (cond
;;    [(zero? n) empty-image]
;;    [else (beside (circle 10 "solid" "red") (row-of-circles (sub1 n)))]))
;; n ширхэг улаан тойрог (радиус 10) зүүнээс баруун тийш
;;(check-expect (row-of-circles 0) empty-image)
;;(check-expect (row-of-circles 2) (beside (circle 10 "solid" "red") (circle 10 "solid" "red")))





;; 1.
(define (count-failing-1 l)
  (cond [(empty? l) 0]
        [else (if (< (first l) 60)
                  (+ 1 (count-failing-1 (rest l)))
                  (count-failing-1 (rest l)))]))
(check-expect (count-failing-1 (list 60)) 0)

;; 2.
(define (count-scores  l)
  (cond
    [(empty? l) 0]
    [else (+ 1 (count-scores (rest l)))]))

(define (total l)
  (cond
    [(empty? l) 0]
    [else (+ (first l) (total (rest l)))]))

(define (average-2 l)
  (/ (total l) (count-scores l)))

(check-expect (average-2 (list 60 80)) 70)

;; 3.
(define (passing-scores-3 l)
  (cond [(empty? l) empty]
        [else (if (>= (first l) 60)
                  (cons (first l) (passing-scores-3 (rest l)))
                  (passing-scores-3 (rest l)))]))
(check-expect (passing-scores-3 (list 40 60)) (list 60))

;; 4.
(define (score-bars-4 l)
  (cond [(empty? l) empty]
        [else (above (score-bar (first l)) (score-bars-4 (rest l)))]))
(check-expect (score-bars-4 (list 80)) (score-bar 80))

- (a * b) + -z == -a + -b + -z == -(a * b * z)

p  true
(-p + q ) * (-q + r) true 
(0 + q=1 ) * (-q=0 + r ) true
( 1) + ( 1 ) true

y == i0* x1 + i1* x1
y == x2* -x1 + x1* -x2
- ( a + b) == -a * - b










