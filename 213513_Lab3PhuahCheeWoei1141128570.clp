(defrule read-input
	(initial-fact)
	=>
	(printout t "What is your category? 
(bookstore/individual)" crlf)
	(assert(category(read)))
)

(defrule get-size
	(category ?)
	=>
	(printout t "Is your order size >=50? 
(yes/no)" crlf)
	(assert(order-large(read)))
)

(defrule bookstore-large
	(category bookstore)
	(order-large yes)
	=>
	(printout t "You are given 25% 
discount!" crlf)
)

(defrule bookstore-small
	(category bookstore)
	(order-large no)
	=>
	(printout t "You are given 10% 
discount!" crlf)
)

(defrule inividual-large
	(category individual)
	(order-large yes)
	=>
	(printout t "You are given 15% 
discount!" crlf)
	)

(defrule individual-small
	(category individual)
	(order-large no)
	=>
	(printout t "You are given 5% discount!" 
crlf)
)
