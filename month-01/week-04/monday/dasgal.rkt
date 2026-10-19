;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname dasgal) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
;; sum-passing : List-of-numbers -> Number
(define (count-passing l)
  (cond
    [(empty? l) 0]
    [(>= (first l) 60) (+ 1 (count-passing (rest l)))]
    [else (count-passing (rest l))]))
(define (sum-passing l)
  (cond
    [(empty? l) 0]
    [else (if (>= (first l) 60)
                  (+ (first l) (sum-passing (rest l)))
                  (sum-passing (rest l)))]))
    
;; 60 ба түүнээс дээш оноонуудын нийлбэр
(check-expect (sum-passing empty) 0)
(check-expect (sum-passing (list 59 60 100)) 160)
(check-expect (sum-passing (list 10 20)) 0)

;; all-passing? : List-of-numbers -> Boolean
(define (all-passing? l)
  (cond
    [(empty? l) #true]
    [(>= (first l)  60 )  (all-passing? (rest l))]
    [else #false]))
              
;; бүх оноо 60 ба түүнээс дээш бол #true. Хоосон list-д #true.
(check-expect (all-passing? empty) #true)
(check-expect (all-passing? (list 60 75)) #true)
(check-expect (all-passing? (list 60 59)) #false)




;; score-dots : List-of-numbers -> Image
(define (score-dots l)
  (cond
    [(empty? l) empty-image]
    [else (if (>=  (first l) 60)
              (beside (circle 10 "solid" "green") (score-dots (rest l))) 
              (beside (circle 10 "solid" "red")(score-dots ( rest l))))])) 
                      
                      
;; оноо бүрийг радиус 10 тойрог болгож зэрэгцүүлнэ: 60+ ногоон, бусад улаан
(check-expect (score-dots empty) empty-image)
(check-expect (score-dots (list 70 40))
              (beside (circle 10 "solid" "green") (circle 10 "solid" "red")))
(check-expect (score-dots (list 60)) (circle 10 "solid" "green"))

(define-struct book (title author pages ))

(define b1 (make-book "Harry Potter" "Rowling" 320)) 
(define b2 (make-book "Бяцхан ханхүү" "Exupéry" 96))
(define b3 (make-book "Нууц товчоо" "Тодорхойгүй" 300))
(book-title b2)
(book-pages b3)
(book-author b1)

(define (long-book? x)
  (if (> (book-pages x)  300)
      #true
      #false))
  


(check-expect (long-book? b1) #true)
(check-expect (long-book? b2) #false)
(check-expect (long-book? b3) #false)   ; яг 300
(check-expect (long-book? (make-book "A" "B" 301)) #true)

(define (reading-days  x)
  (/ (book-pages x ) 20 ))

(check-expect (reading-days b1) 16)
(check-expect (reading-days b2) 4.8)
(check-expect (reading-days b3) 15)


(define-struct pet ( name kind age))
(define bobo (make-pet "Бобо" "нохой" 3))
(define mimi (make-pet "Мими" "муур" 1))
(define tom  (make-pet "Том"  "муур" 12))

(define ( cat? x)
  (string=? (pet-kind x) "муур"))


(define (senior? x)
  (if (>= (pet-age x) 10)
      #true
      #false))

(check-expect (senior? tom) #true)
(check-expect (senior? bobo) #false)
(check-expect (senior? (make-pet "Хар" "нохой" 10)) #true)
(check-expect (senior? (make-pet "Цагаан" "муур" 9)) #false) 


