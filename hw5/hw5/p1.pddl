;; There is only one block, A, which is on the table.  A can with red
;; paint is on the table.  There is a clean brush on the table.  Our
;; goal is to have A be red, and the arm empty.

(define (problem 1)
  (:domain hw5)
  (:objects A C B)
  (:init (arm-empty)
    ;; ... block A on the table with nothing on it ...
    (block A)
    (on-table A)
    (clear A)
    ;; ... a red paint can on the table with nothing on it ...
    (paint-can C red)
    (on-table C)
    (clear C)
    ;; ... a clean brush is on the table with nothing on it ...
    (brush B)
    (clean B)
    (on-table B)
    (clear B)
	 )
  (:goal (and (arm-empty)
  	      (color A red))
  ))



