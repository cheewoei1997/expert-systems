(defglobal 
        ?*name* = ""
        ?*total* = 0
)

(deffacts initial (continue yes))

(defrule ask-name
	(initial-fact)
	=>
	(printout t "What is your name?" crlf)
	(bind ?*name* (readline))
	(printout t "Do you want to start now?(yes/no)" crlf)
	(assert (start (read)))
)

(defrule ask-amount
	(start yes)
	?cont <- (continue yes)
	=>
	(printout t "How much have you spent?" crlf)
	(bind ?*total* (+ ?*total* (read)))
	(printout t "You have spent " ?*total* crlf)
	(printout t "Do you want to continue?(yes/no)" crlf)
	(retract ?cont)
	(assert (continue(read)))
)

(defrule end-program
	(or (start no)(continue no))
	=>
	(printout t "Thank you, " ?*name* ". The total amount that you 
have spent is " ?*total* crlf)
)
