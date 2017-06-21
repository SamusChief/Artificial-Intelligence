;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; HW5 blocks world + painting - Tristan Adams (tristana@umbc.edu)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain hw5)

  (:requirements :strips)

  (:constants red green blue yellow)

  (:predicates (on ?x ?y)            ; object ?x is on object ?y
               (on-table ?x)         ; object ?x is on the table
               (clear ?x)            ; nothing is on object ?x
               (arm-empty)           ; the robot arm is holding nothing
               (holding ?x)          ; the robot arm is holding object ?x
               (color ?x ?color)     ; object ?x has color ?color
               (block ?x)            ; object ?x is a block
               (sprayer ?x ?color)   ; object ?x is a sprayer with color ?color
               (paint-can ?x ?color) ; object ?x is a paint can with color ?color
               (brush ?x)            ; object ?x is a brush
               (water-bucket ?x)     ; object ?x is a water bucket
               (clean ?b)            ; brush ?b is clean
               (loaded ?b ?color)    ; brush ?b is loaded with paint of color ?color
     )

  (:action pick-up
     :parameters (?obj1)
     :precondition (and (clear ?obj1) (on-table ?obj1) (arm-empty))
     :effect
      (and (not (on-table ?obj1))
           (not (clear ?obj1))
           (not (arm-empty))
           (holding ?obj1)))

  (:action put-down
     :parameters (?ob)
     :precondition (holding ?ob)
     :effect
      (and (not (holding ?ob))
           (clear ?ob)
           (arm-empty)
           (on-table ?ob)))

  (:action stack
     :parameters (?obj1 ?obj2)
     :precondition (and (holding ?obj1) (clear ?obj2))
     :effect
      (and (not (holding ?obj1))
           (not (clear ?obj2))
           (clear ?obj1)
           (arm-empty)
           (on ?obj1 ?obj2)))

  (:action unstack
     :parameters (?obj1 ?obj2)
     :precondition (and (on ?obj1 ?obj2) (clear ?obj1) (arm-empty))
     :effect
      (and (holding ?obj1)
           (clear ?obj2)
           (not (clear ?obj1))
           (not (arm-empty))
           (not (on ?obj1 ?obj2))))

  (:action spray-paint
     :parameters (?obj ?sprayer ?color)
     :precondition (and (holding ?sprayer)
     		   	(clear ?obj)
			(on-table ?obj)
			(sprayer ?sprayer ?color))
     :effect (color ?obj ?color))

  (:action brush-paint
     :parameters (?obj ?brush ?color)
     :precondition (and (holding ?brush)
     		   	(clear ?obj)
			(on-table ?obj)
			(brush ?brush)
			(loaded ?brush ?color))
     :effect (color ?obj ?color))

  (:action wash-brush
     :parameters (?brush ?waterbucket ?color)
     :precondition (and (water-bucket ?waterbucket)
     		   	(loaded ?brush ?color)
     		   	(clear ?waterbucket)
			(on-table ?waterbucket)
			(holding ?brush)
			(brush ?brush))
     :effect (and (not (loaded ?brush ?color))
                  (clean ?brush)))

  (:action load-brush
     :parameters (?brush ?can ?color)
     :precondition (and (brush ?brush)
     		   	(paint-can ?can ?color)
			(clear ?can)
			(on-table ?can)
			(holding ?brush)
			(clean ?brush)
		   )
     :effect (and (loaded ?brush ?color)
                  (not (clean ?brush))))

)
