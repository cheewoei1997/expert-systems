(deffacts family            
	(parent-of John Simon)
	(parent-of John Mary)
	(parent-of Michelle Simon)
	(parent-of Michelle Mary)
	(parent-of Simon Jack)
	(parent-of Simon Rose)
	(male John)
	(male Simon)
	(male Jack)
	(female Mary)
	(female Michelle)
	(female Rose)
)

(defrule grandfather
	(parent-of ?father ?grandpa)
	(parent-of ?son ?father)
	(male ?grandpa)
	=>
	(printout t ?grandpa " is the grandfather of " ?son crlf)
)

(defrule sister
	(parent-of ?someone ?parent)
	(parent-of ?sis ?parent)
	(female ?sis)
	=>
	(printout t ?sis " is the sister of " ?someone crlf)
)
