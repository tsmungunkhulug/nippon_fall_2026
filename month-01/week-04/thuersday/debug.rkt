;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname debug) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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

(define (passing? s)
  (>= (final-score s) 60))


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



;; passing-students : List-of-students -> List-of-students
(define (passing-students l)
  (cond
    [(empty? l) empty]
    [else (if (passed? (first l)) (cons (first l) (passing-students (rest l))) (passing-students (rest l)))]))
;; зөвхөн тэнцсэн сурагчид
(check-expect (passing-students empty) empty)
(check-expect (passing-students (list ren aki)) (list aki))

;; names : List-of-students -> List-of-strings
(define (names l)
  (cond
    [(empty? l) empty]
    [else (cons (student-name (first l)) (names (rest l)))]))
(check-expect (names empty) empty)

;; 1
(define (count-passing l)
  (cond [(empty? l) 0]
        [else (if (passing? (first l))
                  (+ 1 (count-passing (rest l)))
                  (count-passing (rest l)))]))
(check-expect (count-passing students) 3)

;; 2
(define (names1 l)
  (cond [(empty? l) empty]
        [else (cons (student-name (first l)) (names (rest l)))]))
(check-expect (names1 (list aki)) (list "Aki"))

;; 3
(define (passing-students1 l)
  (cond [(empty? l) empty]  
        [else (if (passing? (first l))
                  (cons (first l) (passing-students1 (rest l)))
                  (passing-students (rest l)))]))
(check-expect (passing-students1 (list ren aki)) (list aki))

;; 4
(define (best-student l)  
  (cond [(empty? (first l)) (first l)]
        [else (better-student (first l) (best-student (rest l)))]))
(check-expect (best-student students) mina)

;; 5
(define (grades l)
  (cond [(empty? l) empty]
        [else (cons (student-grade (first l)) (grades (rest l)))]))
(check-expect (grades (list aki sora)) (list "B" "D"))