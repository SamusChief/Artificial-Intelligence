;; There is only one block, A, which is on the table.  A sprayer with
;; red paint is on the table.  Our goal is to have A be red and the
;; arm empty.

(define (problem 0)
  (:domain hw5)
  (:objects A S)
  (:init (arm-empty)
         ;; ... there is a block A on the table with nothing on it...
	 (block A)
	 (on-table A)
	 (clear A)
         ;; ... there is a red sprayer on the table with nothing on it...
	 (sprayer S red)
	 (on-table S)
	 (clear S)
         )
  (:goal (and (arm-empty)
              ;; ...A is red...
	      (color A red))
          ))



