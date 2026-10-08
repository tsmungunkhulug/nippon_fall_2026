(eligible? 100 100 100 90 7 10)
; (passing-average? 100 100 100)    average3 = 100  #t
; (good-attendance? 90)          #t
; (assignments-complete? 7 10)   assignment-percent = 70  #t
; (and #t #t #t)
;  #t


(eligible? 50 69 60 100 10 10)
; (passing-average? 50 69 60)    average3 = 59.(6) #f
; #f