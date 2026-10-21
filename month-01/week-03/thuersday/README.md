(count-passing ( list 70 82 95 63 88))
=(+ 1 (count-passing (list 82 95 63 88)))         ; 70 >= 60 -> toologdonno
=(+ 1 1 (count-passing (list 95 63 88)))         ; 82 >= 60 -> toologdonno
=(+ 1 1 1(count-passing (list 63 88)))         ; 95 >= 60 -> toologdonno
=(+ 1 1 1 1(count-passing (list 88)))         ; 63 >= 60 -> toologdonno
=(+ 1 1 1 1 1(count-passing (list empty)))         ; 88 >= 60 -> toologdonno
(+ 1 1 1 1 1)
5
