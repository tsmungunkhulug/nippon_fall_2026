;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname drracket) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (count-failing-1 l)
  (cond [(empty? l) 0]
        [else (if (< (first l) 60)
                  (+ 1 (count-failing-1 (rest l)))
                  (count-failing-1 (rest l)))]))
(check-expect (count-failing-1 (list 60)) 0)

(define (passing-scores-3 l)
  (cond [(empty? l) empty]
        [else (if (>= (first l) 60)
                  (cons (first l) (passing-scores-3 (rest l)))
                  (passing-scores-3 (rest l)))]))
(check-expect (passing-scores-3 (list 40 60)) (list 60))


(define (score-bars-4 l)
  (cond [(empty? l) empty]
        [else (above (score-bar (first l)) (score-bars-4 (rest l)))]))
(check-expect (score-bars-4 (list 80)) (score-bar 80))

