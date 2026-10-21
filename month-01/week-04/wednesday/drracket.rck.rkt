;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname drracket.rck) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))


;; better-student : Student Student -> Student
(define (better-student a b)
  (if (>= (final-score a) (final-score b)) a b))
(check-expect (better-student sora (make-student "Tie" 60 60)) sora)

;; эцсийн оноо нь их сурагч; тэнцүү бол эхнийх
(check-expect (better-student aki mina) mina)
(check-expect (better-student mina aki) mina)
(check-expect (better-student sora (make-student "Tie" 60 60)) sora)
;; same-grade? : Student Student -> Boolean
(define (same-grade? a b)
  (string=? (student-grade a) (student-grade b)))
;; хоёулаа ижил үсгэн үнэлгээтэй бол #true. string=? ашигла.
(check-expect (same-grade? aki (make-student "Ben" 85 85)) #true)
(check-expect (same-grade? aki mina) #false)
;; points-to-pass : Student -> Number
(define (points-to-pass s)
  (max 0 (- 60 (final-score s))))
;; 60 хүрэхэд хэдэн оноо дутуу вэ; тэнцсэн бол 0
(check-expect (points-to-pass ren) 9)
(check-expect (points-to-pass sora) 0)
(check-expect (points-to-pass aki) 0)
;; 1
(define (better-student a b)
  (if (>= (final-score a) (final-score b)) a b))
(check-expect (better-student sora (make-student "Tie" 60 60)) sora)

;; 2
(define (points-to-pass s)
  (<= 60 (final-score s)))
(check-expect (points-to-pass aki) 0)
;; 3
(define (rename s new-name)
  (make-student new-name (student-project s) (student-quiz s)))
(check-expect (rename aki "Akira") (make-student "Akira" 80 90))

;; 4
(define (score-label s)
  (text (number->string (final-score s))) 24 "black"))
(check-expect (score-label sora) (text "60" 24 "black"))

;; 5
(define (perfect-project? s)
  (= (student-project s) 100))
(check-expect (perfect-project? aki) #false)