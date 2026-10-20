;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname dasgal2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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


(define-struct product (name price qty))
(define pen1      (make-product "Үзэг"   500   40))
(define notebook (make-product "Дэвтэр" 1500  0))
(define bag      (make-product "Цүнх"   45000 3))
(define (stock-value p)
  (* (product-price p ) (product-qty p)))


(check-expect (stock-value pen1) 20000)
(check-expect (stock-value bag) 135000)
(check-expect (stock-value notebook) 0)
(define (in-stock? p)
  (> (product-qty p) 0))

(check-expect (in-stock? pen1) #true)
(check-expect (in-stock? bag) #true)
(check-expect (in-stock? notebook) #false)
(define (price-with-tax p)
  (* (product-price p) 1.1))

(check-expect (price-with-tax pen1) 550)
(check-expect (price-with-tax notebook) 1650)
(check-expect (price-with-tax bag) 49500)


;; exercise-04
(define-struct ball (radius color ))
(define red-ball (make-ball 20 "red"))
(define big-blue (make-ball 50 "blue"))
(define tiny ( make-ball 5 "green"))
(define (draw-ball l)
  (circle (ball-radius l ) "solid" (ball-color l)))


(check-expect (draw-ball red-ball) (circle 20 "solid" "red"))
(check-expect (draw-ball big-blue) (circle 50 "solid" "blue"))


(define  ( bigger? l b)
  (if (> (ball-radius l) (ball-radius b))
      #true
      #false))

(check-expect (bigger? big-blue red-ball ) #true )
(check-expect (bigger? tiny red-ball ) #false )


(define (ball-in-box l)
  (overlay (draw-ball l) (square (+ (* (ball-radius l) 2) 10) "outline" "black")))
(check-expect (ball-in-box red-ball)
              (overlay (circle 20 "solid" "red") (square 50 "outline" "black")))

(define-struct game (home away h-score a-score))
(define g1 (make-game "mongolia" "chinese" 3 0))
(define g2 (make-game "mongolia" "korea" 2 2))
(check-expect (game? g1) #true)
(check-expect (game-home g1) "mongolia")
(check-expect (game-away g2) "korea")
(check-expect (game-a-score g2) 2)

(define (total-goals l)
  (+ (game-h-score l) (game-a-score l)))
(check-expect ( total-goals g1) 3)
(define (winner l)
  (cond
    [(> (game-h-score l) (game-a-score l)) (game-home l)]
    [(< (game-h-score l) (game-a-score l)) (game-away l)]
    [else "tentssen"]))
(check-expect ( winner g1) "mongolia")
(check-expect ( winner g2) "tentssen")

;; ex-06

(define-struct student (name quiz project))
(define aki (make-student "Aki" 80 90 ))
(define sora (make-student "Sora" 60 60 ))
(define mina (make-student "Mina" 95 91))
(define ren (make-student "Ren" 45 55 ))

(define (final-score l)
  (+ (* (student-quiz l) 0.4) (* (student-project l) 0.6)))
(check-expect (final-score aki) 86)
(check-expect (final-score sora) 60)
(check-expect (final-score mina) 92.6)
(check-expect (final-score ren) 51)
(check-expect (final-score (make-student "Zero" 0 0)) 0)

(define (passed? l)
  (>= (final-score l) 60))
(check-expect (passed? (make-student "Uka" 100 34 )) #true)
(check-expect (passed? (make-student "Bat" 100 33 )) #false)
