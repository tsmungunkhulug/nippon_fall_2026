;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |thuersday tusul|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)



(define (days-to-hours x)
  (* x 24 ))
;; days-to-hours : Number -> Number
(check-expect (days-to-hours 2) 48)

;; days-to-seconds : Number -> Number
(define  (days-to-seconds x)
  (* x 86400))
;; days-to-hours, hours-to-seconds-г дуудна
(check-expect (days-to-seconds 1) 86400)




;; outside-range? : Number -> Boolean
(define (outside-range? x)
  (not (and (>= x 1) (<= x 10) #t)))
;; n нь 1–10-ийн гадна бол #t
(check-expect (outside-range? 0) #t)
(check-expect (outside-range? 1) #f)
(check-expect (outside-range? 10) #f)
(check-expect (outside-range? 11) #t)


;; grade-change : Number Number -> String
(define (grade-change x y )
  (cond
    [(> y x) "up"]
    [(= x y) "same"]
    [else "down"]))
;; хуучин оноо, шинэ оноо → "up", "same", "down"
(check-expect (grade-change 70 80) "up")
(check-expect (grade-change 80 80) "same")
(check-expect (grade-change 90 80) "down")


;; sum3 : Number Number Number -> Number
(define (sum3 x y z)
  (+ x y z))
(check-expect (sum3 80 90 70) 240)

;; average3 : Number Number Number -> Number
(define (average3 x y z)
  (/ (sum3 x y z) 3))
;; гурван тооны дундаж. sum3-г дуудна.
(check-expect (average3 80 90 70) 80)
(check-expect (average3 60 60 60) 60)

;; assignment-percent : Number Number -> Number
(define (assignment-percent x y)
  (* x y))
;; хийсэн ба нийт даалгавар → гүйцэтгэлийн хувь (total > 0)
(check-expect (assignment-percent 8 10) 80)
(check-expect (assignment-percent 7 10) 70)
(check-expect (assignment-percent 0 10) 0)

;; passing-average? : Number Number Number -> Boolean
(define (passing-average? x y z)
  (if (>= (/ (sum3 x y z) 3) 60)
      #t
      #f))
;; average3 60 ба түүнээс дээш бол #t
(check-expect (passing-average? 60 60 60) #t)
(check-expect (passing-average? 59 59 59) #f)
(check-expect (passing-average? 100 80 0) #t)   ; дундаж яг 60


;; good-attendance? : Number -> Boolean
(define (good-attendance? x)
  (if (>= x 80)
      #t
      #f))
;; ирц 80 ба түүнээс дээш бол #t
(check-expect (good-attendance? 80) #t)
(check-expect (good-attendance? 79) #f)


;; assignments-complete? : Number Number -> Boolean
(define (assignments-complete? x y)
  (if (>= (assignment-percent x y) 70)
      #t
      #f))
;; assignment-percent 70 ба түүнээс дээш бол #t. assignment-percent-г дуудна.
(check-expect (assignments-complete? 7 10) #t)
(check-expect (assignments-complete? 6 10) #f)
(check-expect (assignments-complete? 0 10) #f)




;; eligible? : Number Number Number Number Number Number -> Boolean
(define (eligible? q w e r t y)
  (and (passing-average? q w e)  (good-attendance? r)  (assignments-complete? t y) ))
;; s1 s2 s3 attendance completed total → гурван шалгуур бүгд үнэн бол #t
(check-expect (eligible? 80 90 70 85 8 10) #t)
(check-expect (eligible? 80 90 70 79 8 10) #f)   ; ирц
(check-expect (eligible? 59 59 59 100 10 10) #f) ; оноо
(check-expect (eligible? 80 90 70 85 6 10) #f)   ; даалгавар



;; final-status : Number Number Number Number Number Number -> String
(define (final-status q w e r t y)
  (if (eligible? q w e r t y ) 
      "Eligible"
      "Not eligible"))
;; тэнцсэн бол "Eligible", үгүй бол "Not eligible"
(check-expect (final-status 80 90 70 85 8 10) "Eligible")
(check-expect (final-status 80 90 70 79 8 10) "Not eligible")







;; letter-grade : Number -> String
(define (letter-grade x)
  (cond
    [(>= x 90) "A"]
    [(>= x 80) "B"]
    [(>= x 70) "C"]
    [(>= x 60) "D"]
    [else "F"]))
;; дундаж оноо → "A" "B" "C" "D" "F" (Мягмарын grade-тэй ижил дүрэм)
(check-expect (letter-grade 90) "A")
(check-expect (letter-grade 89) "B")
(check-expect (letter-grade 80) "B")
(check-expect (letter-grade 79) "C")
(check-expect (letter-grade 60) "D")
(check-expect (letter-grade 59) "F")





;; student-grade : Number Number Number -> String
(define (student-grade x y z)
  (letter-grade (average3 x y z)))
;; гурван оноо → үсгэн дүн. average3 ба letter-grade-г дуудна.
(check-expect (student-grade 80 90 70) "B")
(check-expect (student-grade 100 90 80) "A")




;; grade-color : Number -> String
(define (grade-color x)
  (cond
    [(>= x 90) "green"]
    [(>= x 80)  "blue"]
    [(>= x 70)  "gold"] 
    [(>= x 60) "orange"]
    [else "red"]))


;; дундаж оноо → өнгө: 90+ "green", 80–89 "blue", 70–79 "gold", 60–69 "orange", бусад "red"
(check-expect (grade-color 90) "green")
(check-expect (grade-color 89) "blue")
(check-expect (grade-color 60) "orange")
(check-expect (grade-color 59) "red")


;; grade-badge : Number -> Image
(define (grade-badge x)
  (cond
    [(>= x 90) (overlay (text (letter-grade x) 24 "white") (circle 30 "solid" (grade-color x)))]
    [(>= 89 x) (overlay (text (letter-grade x) 24 "white") (circle 30 "solid" (grade-color x)))]))
;; дундаж оноо → өнгөт тойрог дээр цагаан үсгэн дүн.
;; grade-color, letter-grade-г дуудна.
(check-expect (grade-badge 95) (overlay (text "A" 24 "white") (circle 30 "solid" "green")))
(check-expect (grade-badge 59) (overlay (text "F" 24 "white") (circle 30 "solid" "red")))



;; student-card : Number Number Number Number Number Number -> Image
(define ( student-card q w e r t y )
   (beside (grade-badge (average3 q w e)) (text (final-status q w e r t y ) 20 "black")))
 
;; s1 s2 s3 attendance completed total → тэмдэг, хажууд нь final-status-ийн текст.
;; average3, grade-badge, final-status-г дуудна.
(check-expect (student-card 80 90 70 85 8 10)
              (beside (grade-badge 80) (text "Eligible" 20 "black" )))


(check-expect (passing-average? 60 60 60) #t)
(check-expect (passing-average? 59 59 59) #f)
(check-expect (passing-average? 100 100 100) #t)
(check-expect (passing-average? 80 80 80) #t)
(check-expect (passing-average? 0 0 0) #f)


(check-expect (letter-grade 90)  "A" )
(check-expect (letter-grade 89)  "B" )
(check-expect (letter-grade 80)  "B" )
(check-expect (letter-grade 79)  "C" )
(check-expect (letter-grade 0)  "F" )
(check-expect (letter-grade 99)  "A" )
(check-expect (letter-grade 100)  "A" )



(check-expect (good-attendance? 80) #t)
(check-expect (good-attendance? 79) #f)
(check-expect (good-attendance? 88) #t)
(check-expect (good-attendance? 100) #t)
(check-expect (good-attendance? 0) #f)


(check-expect (assignments-complete? 7 10) #t)
(check-expect (assignments-complete? 6 10) #f)
(check-expect (assignments-complete? 9 10) #t)
(check-expect (assignments-complete? 10 10) #t)
(check-expect (assignments-complete? 2 10) #f)


(check-expect (assignment-percent 0 10) 0)
(check-expect (assignment-percent 4 10) 40)
(check-expect (assignment-percent 6 10) 60)
(check-expect (assignment-percent 7 10) 70)


(check-expect (eligible? 80 90 70 85 8 10) #t)
(check-expect (eligible? 100 100 100 100 10 10) #t)
(check-expect (eligible? 0 0 0 0 0 0 ) #f)
(check-expect (eligible? 80 80 80 80 2 10) #f)


(check-expect (final-status 80 90 70 79 8 10) "Not eligible")
(check-expect (final-status 80 90 70 70 8 10) "Not eligible")
(check-expect (final-status 80 90 70 80 8 10) "Eligible")
(check-expect (final-status 80 90 70 90 8 10) "Eligible")

;; honor-roll? : Number Number Number Number -> Boolean
(define (honor-roll? x y z s)
  (and (>= x 90) (>= y 90) (>= z 90) (>= s 95)))
;; s1 s2 s3 attendance: дундаж 90 ба түүнээс дээш, ирц 95 ба түүнээс дээш бол #t
(check-expect (honor-roll? 90 90 90 95) #t)
(check-expect (honor-roll? 90 90 90 94) #f)
(check-expect (honor-roll? 89 89 89 100) #f)


;; ineligibility-reason : Number Number Number Number Number Number -> String
(define (ineligibility-reason q w e r t y )
  (cond
    [(<= (average3 q w e) 60 ) "Low score"]
    [(>= 80 r) "Low attendance"]
    [(>= 70 (assignment-percent t y)) "Missing assignments"]
    [else "Eligible"]))
;; Хэд хэдэн шалгуур унавал эхнийхийг нь буцаана: оноо → ирц → даалгавар.
;; Бүгд үнэн бол "Eligible".
(check-expect (ineligibility-reason 59 59 59 50 0 10) "Low score")
(check-expect (ineligibility-reason 80 90 70 79 0 10) "Low attendance")
(check-expect (ineligibility-reason 80 90 70 85 6 10) "Missing assignments")
(check-expect (ineligibility-reason 80 90 70 85 8 10) "Eligible")


;; average5 : Number Number Number Number Number -> Number
(define ( average5 q w e r t)
  (/ (+ q w e r t) 5))
;; таван онооны дундаж
(check-expect (average5 60 70 80 90 100) 80)
