;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Untitled) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (bites-to-bits byte)
  (* byte 8))
(check-expect (bites-to-bits 1) 8)
(define (kib-to-bytes kib)
  (* kib 1024))
(check-expect (kib-to-bytes 1) 1024)

(define (kib-to-bits kib)
  (bites-to-bits (kib-to-bytes kib)))
(check-expect (kib-to-bits 1) 8192)

;; item-total : Number Number -> Number
(define (item-total price count)
  (* price count))
;; нэгж үнэ ба тоо ширхэгээс нийт үнэ
(check-expect (item-total 5000 3) 15000)
(check-expect (item-total 1200 0) 0)

;; discount-amount : Number Number -> Number
  (define (discount-amount total discount)
    (* (/ total 100) discount))
;; нийт үнэ ба хувиас хөнгөлөлтийн хэмжээ.
;; Хувийг бүхэл тоогоор өгнө: 10 гэвэл 10% (0.1 биш).
(check-expect (discount-amount 15000 10) 1500)
(check-expect (discount-amount 15000 0) 0)

;; final-price : Number Number Number -> Number
(define (final-price price count discount)
  (- (item-total price count)
     (discount-amount (item-total price count) discount)))
;; нэгж үнэ, тоо ширхэг, хувь → хөнгөлөлт хассан үнэ.
;; item-total, discount-amount-г дуудна.
(check-expect (final-price 5000 3 10) 13500)
(check-expect (final-price 5000 3 0) 15000)



;; sum3 : Number Number Number -> Number
(define (sum3 x y z)
  (+ x y z))
;; гурван тооны нийлбэр
(check-expect (sum3 10 20 30) 60)

;; average3 : Number Number Number -> Number
(define (average3 x y z)
  (/ (sum3 x y z) 3))
;; гурван тооны дундаж. sum3-г дуудна.
(check-expect (average3 60 80 100) 80)
(check-expect (average3 0 0 90) 30)


;; boolean values
(check-expect(> 10 5) #t)        ; #t
(check-expect(= (+ 2 3) 5) #t)  ; #t
(check-expect(>= 18 20) #f)     ; #f
(check-expect(even? 14) #t)    ; #t
(check-expect(positive? -3) #f) ; #f
(check-expect (odd? 17) #t)
(check-expect(zero? 0) #t)

;; predicate gedeg ni asuuj baigaa functuinuud
(define (adult? age)
  (>= age 18))
(check-expect (adult? 19) #t)
(check-expect (adult? 15) #f)

(define (passing-average? a b c)
  (>= (average3 a b c) 60))
(check-expect (passing-average? 40 50 60) #f)
(check-expect (passing-average? 70 70 70) #t)


;;exercise

;; passing-score? : Number -> Boolean
(define (passing-score? grade)
  (>= grade 60))
;; score 60 ба түүнээс дээш бол #t
(check-expect (passing-score? 60) #t)
(check-expect (passing-score? 59) #f)

;; fits-in-byte? : Number -> Boolean
(define (fits-in-byte? fits)
  (<= fits 255))
;; сөрөг биш бүхэл n нэг byte (8 bit, 0–255)-д багтах уу
(check-expect (fits-in-byte? 255) #t)
(check-expect (fits-in-byte? 256) #f)

;; large-file-mib? : Number -> Boolean
(define (large-file-mib? size)
  (<= 100 size))
;; файлын хэмжээ (MiB) 100 ба түүнээс их бол #t
(check-expect (large-file-mib? 100) #t)
(check-expect (large-file-mib? 99) #f)

;; same-total? : Number Number Number Number -> Boolean
(define (same-total? x y z s )
  (= (* x y ) (* z s)))
;; хоёр барааны item-total тэнцүү эсэх (үнэ1 тоо1 үнэ2 тоо2)
(check-expect (same-total? 5000 3 3000 5) #t)
(check-expect (same-total? 5000 3 5000 2) #f)

;; passing-average? : Number Number Number -> Boolean
(define (passing-average1? x y s)
  (<= 60 (/ (+ x y s) 3 )))
;; average3 60 ба түүнээс дээш бол #t
(check-expect (passing-average1? 60 60 60) #t)
(check-expect (passing-average1? 59 60 60) #f)

;; discount-eligible? : Number Number Number -> Boolean
(define (discount-eligible? x y s)
  (>= (- (* x y ) (* (/ (* x y) 100) s) ) 50000)) 
;; final-price 50000 ба түүнээс их бол #t (нэгж үнэ, тоо, хувь)
(check-expect (discount-eligible? 5000 10 0) #t)    ; 50000
(check-expect (discount-eligible? 5000 10 10) #f)   ; 45000
