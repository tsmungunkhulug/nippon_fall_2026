;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2 dahi udur recursive|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
;; 100 element prices?
;; recursive function


;; fun-for-lon : List-of-numbers -> ???
(define (fun-for-lon l)
  (cond
    [(empty? l) ...]
    [else (... (first l)
               ... (fun-for-lon (rest l)) ...)]))

;; sum ; list0of-numbers -> number
(define (sum l)
  (cond
    [(empty? l) 0]
    [else (+ (first l)
             (sum  (rest l)))])) 
(check-expect (sum (cons 1 (cons 2 (cons 3 (cons 5 empty))))) 11)
;; multiply
(define (multiply l)
  (cond
    [(empty? l) 1]  
    [else (* (first l) 
             (multiply  (rest l)))])) 

(check-expect (multiply (cons 1 (cons 2 (cons 3 (cons 5 empty))))) 30)



;; ex 01

(define (count-words x)
  (cond
    [(empty? x) 0]
    [else (+ 1
             (count-words (rest x)))]))


(check-expect (count-words empty) 0)
(check-expect (count-words (cons "hello" empty)) 1)
(check-expect (count-words (cons "hello" (cons "world" empty))) 2)
(check-expect (count-words (cons "I" (cons "love" (cons "Racket" empty)))) 3)

;; ex 02
(define ( contains-word? x y)
  (cond
    [(empty? y) #f]
    [(string=? x (first y)) #t]
    [else (contains-word? x (rest y) )]))


(check-expect (contains-word? "cat" empty) #false)
(check-expect
 (contains-word? "cat" (cons "cat" empty))
 #true)
(check-expect
 (contains-word? "dog" (cons "cat" (cons "dog" empty)))
 #true)
(check-expect
 (contains-word? "bird" (cons "cat" (cons "dog" empty)))
 #false)

;; ex 03
(define  (count-long-words x)
  (cond
    [(empty? x) 0]
    [(>= (string-length (first x)) 5) (+ 1 (count-long-words (rest x)))] 
    [else
     (count-long-words (rest x))]))

(check-expect (count-long-words empty) 0)
(check-expect (count-long-words (cons "cat" empty)) 0)
(check-expect (count-long-words (cons "apple" empty)) 1)
(check-expect
 (count-long-words
  (cons "apple" (cons "hi" (cons "banana" empty))))
 2)
(check-expect
 (count-long-words
  (cons "hello" (cons "world" (cons "Racket" empty))))
 3)


;;ex 04
(define (count-completed x)
  (cond 
   [(empty? x) 0]
   [(first x)  (+ 1 (count-completed (rest x)))] 
   [else
    (count-completed (rest x))]))


(check-expect (count-completed empty) 0)
(check-expect (count-completed (cons #true empty)) 1)
(check-expect (count-completed (cons #false empty)) 0)
(check-expect
 (count-completed (cons #true (cons #false empty)))
 1)
(check-expect
 (count-completed
  (cons #true (cons #true (cons #false (cons #true empty)))))
 3)
(check-expect
 (count-completed
  (cons #false (cons #false (cons #false empty))))
 0)

;; ex 05
(define (join-words x)
  (cond
    [(empty? x) ""]
    [(empty? (rest x)) (first x)]
    [else (string-append (first x) " "
                         (join-words (rest x)))]))





(check-expect (join-words empty) "")
(check-expect (join-words (cons "Hello" empty)) "Hello")
(check-expect
 (join-words (cons "Hello" (cons "world" empty)))
 "Hello world")
(check-expect
 (join-words (cons "I" (cons "love" (cons "Racket" empty))))
 "I love Racket")


;; count-items : List-of-numbers -> Number
(define (count-items x)
  (cond
    [(empty? x) 0]
    [else (+ 1
             (count-items (rest x)))]))
;; элементийн тоо
(check-expect (count-items empty) 0)
(check-expect (count-items (cons 7 (cons 8 (cons 9 empty)))) 3)


;; product : List-of-numbers -> Number
(define (product l)
  (cond
    [(empty? l) 1]  
    [else (* (first l) 
             (product  (rest l)))])) 
;; бүх тооны үржвэр. Хоосон list-ийн үржвэр 1 (0 биш!) — яагаад?
(check-expect (product empty) 1)
(check-expect (product (cons 2 (cons 3 (cons 4 empty)))) 24)

;; contains-zero? : List-of-numbers -> Boolean
(define (contains-zero? x)
  (cond
    [(empty? x) #f]
    [(= (first x) 0) #t]
    [else
          (contains-zero? (rest x))]))
;; list дотор 0 байвал #t. or ашигла.
(check-expect (contains-zero? empty) #f)
(check-expect (contains-zero? (cons 1 (cons 0 empty))) #t)
(check-expect (contains-zero? (cons 1 (cons 2 empty))) #f)


;; count-even : List-of-numbers -> Number
(define (count-even x)
  (cond
    [(empty? x) 0]
    [(even? (first x)) (+ 1 (count-even (rest x)))]
    [else
     (count-even (rest x))]))
;; тэгш тоонуудын тоо
(check-expect (count-even empty) 0)
(check-expect (count-even (cons 2 (cons 3 (cons 4 (cons 5 (cons 6 empty)))))) 3)
(check-expect (count-even (cons 1 (cons 3 empty))) 0)


;; count-negative : List-of-numbers -> Number
(define (count-negative x)
  (cond
    [(empty? x) 0]
    [(negative? (first x)) (+ 1 (count-negative (rest x)))]
    [else
     (count-negative (rest x))]))
;; сөрөг тоонуудын тоо (0 сөрөг биш)
(check-expect (count-negative (cons -1 (cons 0 (cons -3 empty)))) 2)



;; draw-all : List-of-images -> Image
(define (draw-all x)
  (cond
    [(empty? x ) empty-image]
    [else (beside (first x)
                  (draw-all (rest x)))]))
   
;; бүх зургийг зүүнээс баруун тийш тавина
(check-expect (draw-all empty) empty-image)
(check-expect (draw-all (cons (circle 20 "solid" "red")
                              (cons (rectangle 40 40 "solid" "blue") empty)))
              (beside (circle 20 "solid" "red") (rectangle 40 40 "solid" "blue")))
