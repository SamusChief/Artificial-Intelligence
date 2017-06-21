;; Three blocks (A B and C) are on the table along with three sprayers
;; (red, green, blue), three paint cans (red, green, blue), a water
;; bucket and a clean brush.  Paint A, B and C red, blue and green,
;; respectively. End with the arm empty and the brush clean.

(define (problem 3)
  (:domain hw5)
  (:objects A B C Sr Sb Sg Cr Cb Cg W Br)
  (:init (arm-empty)
  	 ;; decleare all objects
         (block A)
	 (block B)
	 (block C)

	 (sprayer Sr red)
	 (sprayer Sb blue)
	 (sprayer Sg green)

	 (paint-can Cr red)
	 (paint-can Cb blue)
	 (paint-can Cg green)

	 (water-bucket W)
	 (brush Br)
	 (clean Br)

	 ;; All objects are on the table
	 (on-table A)
         (on-table B)
         (on-table C)

         (on-table Sr)
         (on-table Sb)
         (on-table Sg)

         (on-table Cr)
         (on-table Cb)
         (on-table Cg)

	 (on-table W)
	 (on-table Br)

	 ;; All objects have nothing on them
	 (clear A)
	 (clear B)
         (clear C)

         (clear Sr)
         (clear Sb)
         (clear Sg)

         (clear Cr)
         (clear Cb)
         (clear Cg)

         (clear W)
         (clear Br)
	 )
  (:goal (and (arm-empty)
              (color A red)
	      (color B blue)
	      (color C green)
	      (clean Br)
	 )
  )
)
    




