;; Block A is on the table, B is on A and C on B.  On the table are a
;; water bucket, a red sprayer, cans of blue and green paint and a
;; clean brush.  The goal is to make A red, B green and C blue and to
;; have A on B, B on C and C on the table and the brush clean and arm
;; empty.

(define (problem 4)
  (:domain hw5)
  (:objects A B C W Sr Cb Cg Br)
  (:init (arm-empty)
  	 (brush Br)
	 (clean Br)
	 (on-table Br)
	 (clear Br)
	 
	 (block A)
	 (block B)
	 (block C)
	 (on-table A)
	 (on B A)
	 (on C B)
	 (clear C)

	 (water-bucket W)
	 (on-table W)
	 (clear W)

	 (sprayer Sr red)
	 (on-table Sr)
	 (clear Sr)

	 (paint-can Cb blue)
	 (on-table Cb)
	 (clear Cb)

	 (paint-can Cg green)
	 (on-table Cg)
	 (clear Cg)

  	 )
  (:goal (and (arm-empty) 
  	      (color A red)
	      (color B green)
	      (color C blue)
	      (on A B)
	      (on B C)
	      (on-table C)
	      (clean Br)
	      )))


