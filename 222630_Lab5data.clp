(deftemplate personal-data
	(multislot name)
	(slot age)
	(slot hair))

(deffacts person
	(personal-data 
		(name andrew)
		(age 20)
		(hair brown))
	(personal-data 
		(name brenda)
		(age 23)
		(hair golden))
	(personal-data 
		(name Kitty)
		(hair red))
	(personal-data
		(hair green)
		(name hulk)
		(age 100))
	(personal-data
		(name ahmad abu)
		(age 30)))

(defrule larger
	(test (> 6 5))
	=>
	(printout t "6 is larger than 5" crlf))

(deffacts studentlist
	(student andrew)
	(reading andrew)
	(writing andrew)
	(student kitty)
	(reading kitty)
	(writing kitty))

(defrule exist-student	
	(exists (student ?name))
	=>
	(printout t "There is at least one student" crlf))

(defrule forall-student
	(forall (student ?name)(reading ?name)(writing ?name))
	=>
	(printout t "All students passed reading and writing" crlf))

