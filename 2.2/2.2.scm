; we can easily create sequence by using cons to create linked pairs
; (display (cons 1 (cons 2 (cons 3 (cons 4)))))

; Scheme provides (list) primitive for easier list construction
; (display (list 1 2 3 4))

; since the list is defined by series of nested conses, car and cdr can
; be used to get elements of the lists

; this will display only first element 1
; (display (car (list 1 2 3 4)))
; this will show (2 3 4)
; (display (cdr (list 1 2 3 4)))

; we can create new list by combining some more elements
; (display (cons 22 (list 1 2 3 4)))

; () represents the end of the list
; (display (cdr (cdr (cdr (cdr (list 1 2))))))


; Use of pairs is suitable for walking through the list with the
; technique called `cdr-ing down` the list.
; Like in this example in which we just return n-th element of the list

(define (list-ref items n)
  (if (= n 0)
    (car items)
    (list-ref (cdr items) (- n 1))))

(define squares (list 1 4 9 16 25))

; this should correctly return 16
; (display (list-ref squares 3))

; usual case is that it is drilled down the whole list, for example for
; reading the length of the list. Implemented in recursive fashion
(define (length items)
  (if (null? items)
    0
    (+ 1 (length (cdr items)))))

; (display (length (list 1 2 3 4)))

; length can be as well computed as linear iterative process

(define (length items)
  (define (iter-length items count)
    (if (null? items)
      count
      (iter-length (cdr items) (+ count 1))))
  (iter-length items 0))

; this correctly again gives 4
; (display (length (list 1 2 3 4)))

; Another useful technique is to `cons up` new, result list whil
; `cdr-ing` down the list. Like in the example of append procedure
(define (append list1 list2)
  (if (null? list1)
    list2
    (cons (car list1) (append (cdr list1) list2))))

; this corerctly shows (1 2 3 4 5 6 7 8)
; (display (append (list 1 2 3 4) (list 5 6 7 8)))