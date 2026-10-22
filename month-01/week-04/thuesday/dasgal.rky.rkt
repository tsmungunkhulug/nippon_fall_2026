;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname dasgal.rky) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
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

;; letter-grade : Number -> String
(define (letter-grade n)
  (cond [(>= n 90) "A"]
        [(>= n 80) "B"]
        [(>= n 70) "C"]
        [(>= n 60) "D"]
        [else "F"]))
;; student-grade : Student -> String
(define (student-grade l)
  (letter-grade (final-score l)))
;; эцсийн онооны үсгэн үнэлгээ
(check-expect (student-grade aki) "B")
(check-expect (student-grade sora) "D")
(check-expect (student-grade mina) "A")
(check-expect (student-grade ren) "F")
(check-expect (student-grade (make-student "Nine" 90 90)) "A")


;; add-bonus : Student Number -> Student
(define (add-bonus s n)
  (make-student (student-name s ) (student-quiz s) (min 100 (+ (student-project s) n))))
;; project оноонд bonus нэмнэ, гэхдээ 100-аас хэтрэхгүй (min ашигла)
(check-expect (add-bonus aki 5) (make-student "Aki" 80 95))
(check-expect (add-bonus mina 20) (make-student "Mina" 95 100))
(check-expect (add-bonus ren 0) ren)


;; retake-quiz : Student Number -> Student
(define (retake-quiz s n)
  (make-student (student-name s) (max n (student-quiz s)) (student-project s)))
;; quiz-ийг дахин өгсөн: шинэ оноо их бол түүнийг, үгүй бол хуучныг үлдээнэ (max)
(check-expect (retake-quiz ren 70) (make-student "Ren" 70 55))
(check-expect (retake-quiz aki 50) aki)

;; card-color : Student -> String
(define (card-color s)
  (if (passed? s)
      "green"
      "red"))
;; тэнцсэн бол "green", үгүй бол "red"
(check-expect (card-color aki) "green")
(check-expect (card-color ren) "red")


;; student-card : Student -> Image
(define (student-card s)
  (overlay (above (text (student-name s) 18 "black") (text (student-grade s) 24 (card-color s))) (rectangle 120 70 "outline" (card-color s))))
;; нэр (18, хар), доор нь үсгэн үнэлгээ (24, card-color), card-color хүрээ (120 × 70)
(check-expect (student-card aki)
              (overlay (above (text "Aki" 18 "black") (text "B" 24 "green"))
                       (rectangle 120 70 "outline" "green")))
(check-expect (student-card ren)
              (overlay (above (text "Ren" 18 "black") (text "F" 24 "red"))
                       (rectangle 120 70 "outline" "red")))


;; 1
(define (final-score1 s)
  (+ (* 0.6 (student-project s))
     (* 0.4 (student-quiz s))))
(check-expect (final-score1 aki) 86)

;; 2
(define (passing? s)
  (>= (final-score s) 60))
(check-expect (passing? sora) #true)

;; 3
(define (add-bonus1 s b)
  (make-student (student-name s)
                (student-quiz s)
                (min 100 (+ (student-project s) b))))
(check-expect (add-bonus1 aki 5) (make-student "Aki" 80 95))

;; 4
(define (student-grade1 s)
  (student-grade s))
(check-expect (student-grade1 aki) "B")





