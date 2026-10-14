;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |drracket dasgal|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; count-zeros : List-of-numbers -> Number
(define (count-zeros x)
  (cond
    [(empty? x) 0]
    [(zero? (first x))
     (+ 1 (count-zeros (rest x)))]
    [else
     (count-zeros (rest x))]))
;; 0-ийн тоо
(check-expect (count-zeros empty) 0)
(check-expect (count-zeros (cons 0 (cons 5 (cons 0 empty)))) 2)

;; all-positive? : List-of-numbers -> Boolean
(define (all-positive? x)
  (cond
    [(empty? x) #t]
    [(positive? (first x))  (all-positive? (rest x))]
    [else #f]))
;; бүх тоо эерэг бол #t. Хоосон list-д эерэг биш тоо байхгүй тул #t.
(check-expect (all-positive? empty) #t)
(check-expect (all-positive? (cons 1 (cons 2 empty))) #t)
(check-expect (all-positive? (cons 1 (cons 0 empty))) #f)


;; contains? : Number List-of-numbers -> Boolean
(define (contains? x y)
  (cond
    [(empty? y) #f]
    [(= x (first y)) #t]
    [else (contains? x (rest y))]))
;; target list дотор байвал #t
(check-expect (contains? 5 empty) #f)
(check-expect (contains? 5 (cons 3 (cons 5 (cons 7 empty)))) #t)
(check-expect (contains? 4 (cons 3 (cons 5 empty))) #f)



;; count-greater-than : List-of-numbers Number -> Number

(define (count-greater-than l limit)
  (cond
    [(empty? l) 0]
    [(> (first l) limit)
     (+ 1 (count-greater-than (rest l) limit))]
    [else
     (count-greater-than (rest l) limit)]))
     
;; limit-ээс ИХ (тэнцүү биш) тоонуудын тоо
(check-expect (count-greater-than empty 5) 0)
(check-expect (count-greater-than (cons 2 (cons 8 (cons 10 empty))) 5) 2)
(check-expect (count-greater-than (cons 5 (cons 6 empty)) 5) 1)   ; 5 тоологдохгүй


;; find-max : NEList-of-numbers -> Number
(define (find-max l)
  (cond
    [(empty? (rest l)) (first l)]
    [else
     (max (first l) (find-max (rest l)))]))
;; хамгийн их утга. max ашиглаж болно: (max 3 8) → 8
(check-expect (find-max (cons 70 empty)) 70)
(check-expect (find-max (cons 70 (cons 95 (cons 63 empty)))) 95)
(check-expect (find-max (cons -5 (cons -2 empty))) -2)


;; average : NEList-of-numbers -> Number
(define (sum l)
  (cond
    [(empty? l) 0]
    [else (+ (first l) (sum (rest l)))]))
(define (count l)
  (cond
    [(empty? l) 0]
    [else (+ 1 (count (rest l)))]))
(define (average l)
  (/ (sum l) (count l)))
  
;; дундаж = sum / count-items. Хоосон биш тул 0-д хуваахгүй.
(check-expect (average (cons 80 empty)) 80)
(check-expect (average (cons 70 (cons 82 (cons 95 (cons 63 (cons 88 empty)))))) 79.6)