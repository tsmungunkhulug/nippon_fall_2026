;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |drracket dasgal ba debug|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (minutes-to-seconds x)
  (* x 60))
;; minutes-to-seconds : Number -> Number
(check-expect (minutes-to-seconds 2) 120)

;; hours-to-seconds : Number -> Number
(define (hours-to-seconds x)
  (* 3600 x))
;; minutes-to-seconds-г дуудна (1 цаг = 60 минут)
(check-expect (hours-to-seconds 1) 3600)
(check-expect (hours-to-seconds 2) 7200)


;; mib-to-bits : Number -> Number
(define (kib-to-bits kib)
  (* 1024 8 kib))
(define (mib-to-bits x)
  (* (kib-to-bits x) 1024))
;; 1 MiB = 1024 KiB. Даваагийн kib-to-bits-г дуудна.
(check-expect (mib-to-bits 1) 8388608)



;; fahrenheit-to-celsius : Number -> Number
(define (fahrenheit-to-celsius x)
  (* (- x 32) (/ 5 9)))
;; C = (F - 32) × 5/9
(check-expect (fahrenheit-to-celsius 212) 100)
(check-expect (fahrenheit-to-celsius 32) 0)

;; fahrenheit-to-kelvin : Number -> Number
(define (fahrenheit-to-kelvin x )
  (+ (fahrenheit-to-celsius x) 273.15))
;; K = C + 273.15. fahrenheit-to-celsius-г дуудна.
(check-expect (fahrenheit-to-kelvin 32) 273.15)



;; tax-amount : Number Number -> Number
(define (tax-amount x tax-rate)
  (* x (/ tax-rate 100)))

(check-expect (tax-amount 3000 10) 300)
;; нийт үнэ ба татварын хувь (10 = 10%) → татварын хэмжээ
(check-expect(tax-amount 3000 10) 300)


;; price-with-tax : Number Number Number -> Number
(define (price-with-tax x y z)
  (+ (* (/ (* x y) 100) z) (* x y)))
;; нэгж үнэ, тоо ширхэг, хувь → татвартай нийт үнэ.
;; Даваагийн item-total ба tax-amount-г дуудна.
(check-expect (price-with-tax 1000 3 10) 3300)
(check-expect (price-with-tax 1000 3 0) 3000)

;; valid-percent? : Number -> Boolean
(define (valid-percent? x)
  (if (and (>= x 0)(<= x 100))
      #t
      #f))
;; 0-ээс 100 хүртэл (хоёр талдаа орно) бол #t
(check-expect (valid-percent? 0) #t)
(check-expect (valid-percent? 100) #t)
(check-expect (valid-percent? -1) #f)
(check-expect (valid-percent? 101) #f)



;; weekday? : Number -> Boolean
(define (weekday? x)
  (if (and (<= 1 x) (>= 5 x))
           #t
           #f))
;; өдрийн дугаар (1 = Даваа ... 7 = Ням) 1–5 бол #t
(check-expect (weekday? 1) #t)
(check-expect (weekday? 5) #t)
(check-expect (weekday? 6) #f)



;; eligible-basic? : Number Number -> Boolean
(define (eligible-basic? x y )
  (if (and (>= x 60) (>= y 80))
      #t
      #f))
;; score 60 ба түүнээс дээш, attendance 80 ба түүнээс дээш бол #t
(check-expect (eligible-basic? 60 80) #t)
(check-expect (eligible-basic? 59 100) #f)
(check-expect (eligible-basic? 100 79) #f)




;; needs-help? : Number Number -> Boolean
;; needs-help? : Number Number -> Boolean
(define (needs-help? x y)
  (not (eligible-basic? x y)))

;; eligible-basic? биш бол #t. not ба eligible-basic?-г ашигла.
(check-expect (needs-help? 59 100) #t)
(check-expect (needs-help? 60 80) #f)


;; parking-fee : Number -> Number
(define (parking-fee x)
  (cond
    [{> x 2} 2000]
    [else 0]))
;; 2 цаг хүртэл (2 орно) үнэгүй, түүнээс их бол 2000
(check-expect (parking-fee 2) 0)
(check-expect (parking-fee 3) 2000)


;; smaller : Number Number -> Number
(define (smaller x y)
  (cond
    [(>= x y) y]
    [(>= y x) x]
    [else x]))
;; хоёр тооны бага нь
(check-expect (smaller 3 8) 3)
(check-expect (smaller 8 3) 3)
(check-expect (smaller 5 5) 5)



;; speed-label : Number -> String
(define (speed-label x)
  (cond
    [(>= x 100) "too fast"]
    [(>= x 60) "fast"]
    [(>= x 30) "normal"]
    [else "slow"]))
;; км/ц: 30-аас бага "slow", 30–59 "normal", 60–99 "fast", 100 ба түүнээс дээш "too fast"
(check-expect (speed-label 29) "slow")
(check-expect (speed-label 30) "normal")
(check-expect (speed-label 59) "normal")
(check-expect (speed-label 60) "fast")
(check-expect (speed-label 99) "fast")
(check-expect (speed-label 100) "too fast")


;; battery-label : Number -> String
(define (battery-label x)
  (cond
    [(= x 100) "full"]
    [(>= x 51) "ok"]
    [(>= x 11) "low"]
    [else "empty"]))
;; 0–100%: 10 хүртэл "empty", 11–50 "low", 51–99 "ok", 100 "full"
(check-expect (battery-label 10) "empty")
(check-expect (battery-label 11) "low")
(check-expect (battery-label 50) "low")
(check-expect (battery-label 51) "ok")
(check-expect (battery-label 99) "ok")
(check-expect (battery-label 100) "full")



;; report-status : Number Number -> String
(define (report-status x y )
  (cond
    [(eligible-basic? x y) "pass"]
    [(or (>= x 60) (<= y 80)) "attendance"]
    [else "retake"]))
;; score, attendance:
;;   eligible-basic? үнэн бол         "pass"
;;   score >= 60 боловч ирц хүрэхгүй   "attendance"
;;   бусад                            "retake"
(check-expect (report-status 60 80) "pass")
(check-expect (report-status 70 50) "attendance")
(check-expect (report-status 40 90) "retake")









;; DEBUG PART










;; 1. Хаалт дутуу
(define (shipping-fee-1 amount)
  (if (>= amount 50000) 0 3000))
(check-expect (shipping-fee-1 100) 3000)

;; 2. cond-ийн дараалал буруу
(define (speed-label-2 speed)
  (cond
    [(>= speed 60) "fast"]
    [(>= speed 30) "normal"]
    [else "slow"]))
(check-expect (speed-label-2 70) "fast")

;; 3. else байхгүй, нэг тохиолдол дутуу
(define (battery-label-3 percent)
  (cond
    [(= percent 100) "full"]
    [(>= percent 50) "low"]
    [(>= percent 10) "empty"]))
(check-expect (battery-label-3 100) "full")

;; 4. Хил 80 буруу branch-д орсон
(define (good-attendance-4? attendance)
  (>= attendance 80))
(check-expect (good-attendance-4? 80) #t)

;; 5. and, or сольсон
(define (eligible-basic-5? score attendance)
  (and (>= score 60) (>= attendance 80)))
(check-expect (eligible-basic-5? 40 90) #f)


