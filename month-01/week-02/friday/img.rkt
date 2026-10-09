;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Untitled) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)


;; pass-fail-badge : Number -> Image
(define (pass-fail-badge x)
  (if (>= x 60)
      (circle 20 "solid" "green")
      (circle 20 "solid" "red")))
;; оноо 60 ба түүнээс дээш бол ногоон тойрог, үгүй бол улаан (радиус 20)
(check-expect (pass-fail-badge 60) (circle 20 "solid" "green"))
(check-expect (pass-fail-badge 59) (circle 20 "solid" "red"))



;; score-bar : Number -> Image
(define (score-bar x )
  (rectangle x 20 "solid" "blue"))
;; оноо → өргөн нь оноотой тэнцүү, өндөр 20 цэнхэр тэгш өнцөгт
(check-expect (score-bar 80) (rectangle 80 20 "solid" "blue"))
(check-expect (score-bar 0) (rectangle 0 20 "solid" "blue"))

 

;; three-bars : Number Number Number -> Image
(define (three-bars x y z)
  (above (score-bar x) (score-bar y) ( score-bar z)))
;; гурван оноог дээрээс доош баганан диаграм болгоно. score-bar-г дуудна.
(check-expect (three-bars 80 60 90)
              (above (score-bar 80) (score-bar 60) (score-bar 90)))




