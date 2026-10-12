;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname list-week-03) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
;; curved-average : Number Number Number -> Number
(define (average x y z)
  (/ (+ x y z) 3))

(define (curved-average x y z)
  (+ (average x y z) 5))
;; гурван онооны дундаж дээр 5 оноо нэмнэ. Даваагийн average3-г дууд.
(check-expect (curved-average 60 70 80) 75)
(check-expect (curved-average 0 0 0) 5)



;; honor-student? : Number Number -> Boolean
(define (honor-student? x y)
  (if (and (>= x 90) (>= y 90))
      #t
      #f))
;; дундаж 90 ба түүнээс дээш, ирц 90 ба түүнээс дээш бол #t
(check-expect (honor-student? 90 90) #t)
(check-expect (honor-student? 89 100) #f)
(check-expect (honor-student? 100 89) #f)

;; status-light : Number -> Image
(define (status-light x)
  (cond
    [(>= x 80) (circle 15 "solid" "green")]
    [(>= x 60) (circle 15 "solid" "yellow")]
    [else (circle 15 "solid" "red")]))
;; оноо 80+ ногоон, 60–79 шар, бусад улаан тойрог (радиус 15). (require 2htdp/image) мартаж болохгүй.
(check-expect (status-light 80) (circle 15 "solid" "green"))
(check-expect (status-light 79) (circle 15 "solid" "yellow"))
(check-expect (status-light 60) (circle 15 "solid" "yellow"))
(check-expect (status-light 59) (circle 15 "solid" "red"))



;; list


;; хоосон list
(define no-scores empty)
no-scores

;; 1 элементтэй list: 70, дараа нь хоосон
(define one-score (cons 70 empty))
one-score

;; 3 элементтэй list: 70, 82, 95
(define scores (cons 70 (cons 82 (cons 95 empty))))
scores
(first scores)
(rest scores)
(first (rest scores))
(empty? scores)
(cons? scores)


(define temperatures (cons 18 (cons 20 (cons 70 (cons 100 empty)))))

(check-expect (first temperatures) 18)
(check-expect (first (rest(rest temperatures))) 70)


(define numbers (cons 12 ( cons 24 (cons 36 ( cons 48 empty)))))
(check-expect (first numbers) 12)
(check-expect (first (rest numbers)) 24)
(check-expect (first (rest (rest numbers)))36 )
(check-expect (rest numbers ) (cons 24 (cons 36 (cons 48 empty))))
(check-expect (empty? numbers ) #f )
(check-expect (cons? numbers ) #t)







(define subject (cons "math" (cons "physics" (cons "programmming" (cons "english" empty)))))
(define (second-subject list)
  (first (rest list)))  
(check-expect (second-subject (cons "math" (cons "physics" empty))) "physics")
  