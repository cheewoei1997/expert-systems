(deffacts startup
	(animal dog) 
	(animal cat) 
	(animal duck) 
	(animal turtle) 
	(warm-blooded dog) 
	(warm-blooded cat) 
	(warm-blooded duck) 
	(lays-eggs duck) 
	(lays-eggs turtle) 
	(child-of dog puppy) 
	(child-of cat kitten) 
	(child-of turtle hatchling)
)

(defrule animal
	(animal ?)
	=>
	(printout t "Animal found" crlf)
)

(defrule list-animals
	(animal ?name)
	=>
	(printout t ?name " found" crlf)
)

(defrule mammal
	(animal ?name)
	(warm-blooded ?name)
	(not(lays-eggs ?name))
	=>
	(assert(mammal ?name))
	(printout t ?name " is a mammal" crlf)
)

(defrule remove-mammals
	?fact <- (mammal ?name)
	=>
	(printout t "retracting " ?name crlf)
	(retract ?fact)
)

(defrule ask-child
	(animal ?name)
	(not(child-of ?name ?))
	=>
	(printout t "What do you call the 
child of " ?name "? ")
	(assert (child-of ?name (read)))
)

(defrule take-umbrella
	(or (weather raining)(weather snowing))
	=>
	(assert(umbrella required))
)
