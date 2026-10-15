;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname dasgal) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; add-ten-all : List-of-numbers -> List-of-numbers
(define (add-ten-all l)
  (cond
    [(empty? l) empty]
    [else (cons (+ 10 (first l)) (add-ten-all (rest l)))]))


(check-expect (add-ten-all empty) empty)
(check-expect (add-ten-all (list 1 2 3)) (list 11 12 13))


;; only-positive : List-of-numbers -> List-of-numbers
(define (only-positive l)
  (cond
    [(empty? l) empty]
    [(positive? (first l)) (cons (first l) (only-positive (rest l)))]
    [else (only-positive (rest l))]))

;; зөвхөн эерэг тоонуудыг үлдээнэ (0 эерэг биш)
(check-expect (only-positive empty) empty)
(check-expect (only-positive (list -2 0 5 9)) (list 5 9))


;; cap-at-100 : List-of-numbers -> List-of-numbers
(define (cap-at-100 l)
  (cond
    [(empty? l) empty]
    [else  (cons (min 100 (first l))  (cap-at-100 (rest l)))]))
;; 100-аас их оноог 100 болгоно. min ашиглаж болно.
(check-expect (cap-at-100 (list 50 100 150)) (list 50 100 100))



;; 1.
(define (double-all-1 l)
  (cond [(empty? l) empty]
        [else (cons (* 2 (first l)) (double-all-1 (rest l)))]))
(check-expect (double-all-1 (list 1 2)) (list 2 4))

;; 2.
(define (add-ten-all-2 l)
  (cond [(empty? l) empty]
        [else (cons (+ 10 (first l)) (add-ten-all-2 (rest l)))]))
(check-expect (add-ten-all-2 (list 1 2)) (list 11 12))

;; 3.
(define (only-positive-3 l)
  (cond [(empty? l) empty]
        [else (if (positive? (first l))
                  (cons (first l) (only-positive-3 (rest l)))
                  (only-positive-3 (rest l)))]))
(check-expect (only-positive-3 (list -1 5)) (list 5))

;; 4.
(define (only-positive-4 l)
  (cond [(empty? l) empty]
        [else (if (positive? (first l))
                  (cons (first l) (only-positive-4 (rest l)))
                  (only-positive-4 (rest l)))]))
(check-expect (only-positive-4 (list -1 5)) (list 5))

;; 5.
(define (cap-at-100-5 l)
  (cond [(empty? l) empty]
        [else (cons (min (first l) 100) (cap-at-100-5 (rest l)))]))
(check-expect (cap-at-100-5 (list 50 150)) (list 50 100))



(define mixed-scores (list 40 60 72 58 100))
(define scores (list 70 82 95 63 88))
;; total : List-of-numbers -> Number


(define (total l)
  (cond
    [(empty? l) 0]
    [else (+ (first l) (total (rest l)))]))
   
(check-expect (total empty) 0)
(check-expect (total scores) 398)


;; count-scores : List-of-numbers -> Number
(define (count-scores  l)
  (cond
    [(empty? l) 0]
    [else (+ 1 (count-scores (rest l)))]))
(check-expect (count-scores empty) 0)
(check-expect (count-scores scores) 5)


;; average : NEList-of-numbers -> Number
(define (average l)
  (/ (total l)  (count-scores l )))
;; total, count-scores-г дуудна. Хоосон list дээр дуудахгүй (NEList).
(check-expect (average scores) 79.6)
(check-expect (average mixed-scores) 66)

;; average : NEList-of-numbers -> Number
(define (average1 l)
  (cond
    [(empty? (rest l)) (first l)]
    [else (/ (total l) (count-scores l))]))
;; total, count-scores-г дуудна. Хоосон list дээр дуудахгүй (NEList).
(check-expect (average1 scores) 79.6)
(check-expect (average1 mixed-scores) 66)


;; highest : NEList-of-numbers -> Number
(define (highest l)
  (cond
    [(empty? (rest l)) (first l)]
    [else (if (> (first l) (highest (rest l)))
               (first l)
               (highest (rest l)))]))
(check-expect (highest (list 63)) 63)
(check-expect (highest scores) 95)
(check-expect (highest mixed-scores) 100)



;; count-passing : List-of-numbers -> Number
(define (count-passing l)
  (cond
    [(empty? l) 0]
    [(>= (first l) 60) (+ 1 (count-passing (rest l)))]
    [else (count-passing (rest l))]))
;; 60 ба түүнээс дээш онооны тоо
(check-expect (count-passing scores) 5)
(check-expect (count-passing mixed-scores) 3)
(check-expect (count-passing (list 60 59)) 1)    ; хил



;; count-failing : List-of-numbers -> Number
(define (count-failing l)
    (cond
    [(empty? l) 0]
    [(< (first l) 60) (+ 1 (count-failing (rest l)))]
    [else (count-failing (rest l))]))
;; 60-аас бага онооны тоо
(check-expect (count-failing scores) 0)
(check-expect (count-failing mixed-scores) 2)



;; passing-scores : List-of-numbers -> List-of-numbers
(define (passing-scores l)
  (cond
    [(empty? l) empty]
    [(>= (first l) 60) (cons (first l) (passing-scores (rest l)))]
    [else (passing-scores (rest l))]))
    
;; зөвхөн тэнцсэн оноонууд
(check-expect (passing-scores mixed-scores) (list 60 72 100))
(check-expect (passing-scores (list 10 20)) empty)





;; score-bars : List-of-numbers -> Image
(define (score-bars l)
  (cond
    [(empty? l) empty-image]
    [else (above (rectangle (first l) 20 "solid" "blue") (rectangle (first (rest l)) 20 "solid" "blue"))]))
    
;; оноо бүрийг 2-р долоо хоногийн score-bar-аар (rectangle оноо 20 "solid" "blue")
;; дээрээс доош тавина. Хоосон list → empty-image.
(check-expect (score-bars empty) empty-image)
(check-expect (score-bars (list 80 60))
              (above (rectangle 80 20 "solid" "blue") (rectangle 60 20 "solid" "blue")))






