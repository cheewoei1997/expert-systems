(defrule read-input
	(initial-fact)
	=>
	(printout t "What is burning?" crlf)
	(printout t "paper / wood / cloth / oil / gas / grease /" crlf)
	(printout t "energized electrical equipment / magnesium / sodium / potassium" crlf)
	(assert (burning-material (read))))

(defrule fire-A
	(burning-material paper | wood | cloth)
	=>
	(assert (fire-class A)))

(defrule fire-B
	(burning-material oil | gas | grease)
	=>
	(assert (fire-class B)))

(defrule fire-C
	(burning-material energized electrical equipment)
	=>
	(assert (fire-class C)))

(defrule fire-D
	(burning-material magnesium | sodium | potassium)
	=>
	(assert (fire-class D)))

(defrule class-A
	(fire-class A)
	=>
	(printout t "Extinguish the fire with heat-absorbing or combustion-retarding extinguishers such as water or water-based liquids and dry chemicals." crlf))

(defrule class-B
	(fire-class B)
	=>
	(printout t "Extinguish by excluding air, inhibiting the release of combustible vapors, or interrupting the combustion chain reaction. Extinguishers include dry chemcals, carbon dioxide, foam, and bromotrifluoromethane." crlf))

(defrule class-C
	(fire-class C)
	=>
	(printout t "Extinguish with a nonconducting agent to prevent short circuits. If possible the power should be cut. Extinguishers include dry chemicals, carbon dioxide, and bromotrifluoromethane." crlf))

(defrule class-D
	(fire-class D)
	=>
	(printout t "Extinguish with smothering and heat-absorbing chemicals that do not react with the burning metals. Such chemicals include trimethoxyboroxine and screened graphitized coke." crlf))
