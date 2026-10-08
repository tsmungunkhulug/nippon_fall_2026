;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |#week-020tuesday-drracker|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (kb-to-bytes kb)
  (* 1000 kb))

;; kb-to-bytes : Number -> Number
(check-expect (kb-to-bytes 2) 2000)

;; kb-to-bits : Number -> Number
(define (kb-to-bits kb)
  (* kb 8000))
;; kb-to-bytes, Даваагийн bytes-to-bits-г дуудна
(check-expect (kb-to-bits 2) 16000)   ; (kib-to-bits 2) бол 16384


;; can-store? : Number Number -> Boolean
(define (can-store? x y )
  (>= y x ))
;; файлын хэмжээ, дискний сул зай (KiB) → багтвал #t
(check-expect (can-store? 500 512) #t)
(check-expect (can-store? 512 512) #t)   ; хил
(check-expect (can-store? 513 512) #f)

;; cheap-order? : Number Number -> Boolean
(define (item-total q w)
  (* q w))
(define (cheap-order? x y)
  (< (item-total x y) 10000))
  
;; нэгж үнэ, тоо ширхэг → item-total 10000-аас бага бол #t
(check-expect (cheap-order? 2000 4) #t)   ; 8000
(check-expect (cheap-order? 2000 5) #f)   ; 10000, хил

(check-expect (and #t #t) #t)
(check-expect (and #t #f) #f)
(check-expect (or #f #f) #f)
(check-expect (or #t #f) #t)
(check-expect (not #t) #f)
(check-expect (not #f) #t)
(check-expect (and (> 8 3) (even? 10))  #t)
(check-expect (or (< 1 0) (= 6 (+ 3 3))) #t)
(check-expect (not (positive? -2)) #t)
(check-expect (and (>= 60 60) (>= 79 80)) #f)

;; teen? : Number -> Boolean
(define (teen? x)
  (and (>= x 13) (<= x 19)))
;; age 13-аас 19 хүртэл (хоёр талдаа орно) бол #t
(check-expect (teen? 13) #t)
(check-expect (teen? 19) #t)
(check-expect (teen? 12) #f)
(check-expect (teen? 20) #f)


;; weekend? : Number -> Boolean
(define (weekend? x )
  (and (>= x 6) (<= x 7)))
;; долоо хоногийн өдрийн дугаар (1 = Даваа ... 7 = Ням) 6 эсвэл 7 бол #t
(check-expect (weekend? 6) #t)
(check-expect (weekend? 7) #t)
(check-expect (weekend? 5) #f)

;; scholarship? : Number Number -> Boolean
(define (scholarship? x y )
  (and (>= x 90) (>= y 80)))
;; score 90 ба түүнээс дээш, attendance 80 ба түүнээс дээш бол #t
(check-expect (scholarship? 90 80) #t)
(check-expect (scholarship? 89 100) #f)
(check-expect (scholarship? 100 79) #f)

;; not-passing? : Number -> Boolean
(define (not-passing? x)
  (not (>= x 60)))
;; Даваагийн passing-score?-г not-оор урвуулна
(check-expect (not-passing? 59) #t)
(check-expect (not-passing? 60) #f)



;; even-or-odd : Number -> String
(define (even-or-odd x)
  (if (even? x)
      "even"
      "odd"))
;; тэгш бол "even", сондгой бол "odd"
(check-expect (even-or-odd 4) "even")
(check-expect (even-or-odd 7) "odd")
(check-expect (even-or-odd 0) "even")


;; pass-or-fail : Number -> String
(define (pass-or-fail x)
  (if (>= x 60)
      "pass"
      "fail"))
;; score 60 ба түүнээс дээш бол "pass", үгүй бол "fail"
(check-expect (pass-or-fail 60) "pass")
(check-expect (pass-or-fail 59) "fail")



;; shipping-fee : Number -> Number
(define (shipping-fee x)
  (if (>= x 50000)
      0
      3000)) 
;; захиалгын дүн 50000 ба түүнээс их бол хүргэлт 0, үгүй бол 3000
(check-expect (shipping-fee 50000) 0)
(check-expect (shipping-fee 49999) 3000)


;; free-shipping? : Number -> Boolean
;; free-shipping? : Number -> Boolean
;; дүн 50000 ба түүнээс их бол #t. if ашиглахгүйгээр бич.
(define (free-shipping? x)
  (>= x 50000))

  
;; дүн 50000 ба түүнээс их бол #t. if ашиглахгүйгээр бич.
(check-expect (free-shipping? 50000) #t)
(check-expect (free-shipping? 49999) #f)


;; larger : Number Number -> Number
(define (larger x y)
  (if (>= x y)
      x
      y))
;; хоёр тооны их нь
(check-expect (larger 3 8) 8)
(check-expect (larger 8 3) 8)
(check-expect (larger 5 5) 5)


;; absolute-value : Number -> Number
(define (absolute-value x)
  (if (positive? x)
      x
      (* x -1)))
;; сөрөг бол эсрэг тэмдэгтэй болгоно, үгүй бол хэвээр
(check-expect (absolute-value -4) 4)
(check-expect (absolute-value 4) 4)
(check-expect (absolute-value 0) 0)



;; scholarship-label : Number Number -> String
(define (scholarship-label x y )  
  (if (and (>= x 90) (>= y 80))
      "scholarship"
      "regular"))
;; score, attendance → тэтгэлэгт тэнцвэл "scholarship", үгүй бол "regular"
(check-expect (scholarship-label 95 85) "scholarship")
(check-expect (scholarship-label 90 80) "scholarship")
(check-expect (scholarship-label 89 80) "regular")
(check-expect (scholarship-label 90 79) "regular")


;; temperature-label : Number -> String
(define (temperature-label x)
  (cond
     [(>= x 25)"hot"]
     [(> x 14)"warm"]
     [(>= x 0) "cold"]
     [(> 0 x) "freezing"]))
;; 0-ээс бага "freezing", 0–14 "cold", 15–24 "warm", 25 ба түүнээс дээш "hot"
(check-expect (temperature-label -1) "freezing")
(check-expect (temperature-label 0) "cold")
(check-expect (temperature-label 14) "cold")
(check-expect (temperature-label 15) "warm")
(check-expect (temperature-label 24) "warm")
(check-expect (temperature-label 25) "hot")


;; ticket-price : Number -> Number
(define (ticket-price x)
  (cond
    [(<= 60 x) 6000]
    [(<= 13 x) 10000]
    [else 5000]))
;; age 13-аас бага 5000, 13–59 10000, 60 ба түүнээс дээш 6000
(check-expect (ticket-price 12) 5000)
(check-expect (ticket-price 13) 10000)
(check-expect (ticket-price 59) 10000)
(check-expect (ticket-price 60) 6000)


;; number-sign : Number -> String
(define (number-sign x)
  (cond
    [(> x 0) "positive"]
    [(= 0 x) "zero"]
    [else "negative"]))
;; "positive", "zero", "negative"
(check-expect (number-sign 5) "positive")
(check-expect (number-sign 0) "zero")
(check-expect (number-sign -5) "negative")


;; file-size-label : Number -> String
(define (file-size-label x)
  (cond
    [(>= x 100) "large"]
    [(<= 10 x) "medium"]
    [else "small"]))
;; MiB хэмжээ: 10-аас бага "small", 10–99 "medium", 100 ба түүнээс их "large"
(check-expect (file-size-label 9) "small")
(check-expect (file-size-label 10) "medium")
(check-expect (file-size-label 99) "medium")
(check-expect (file-size-label 100) "large")