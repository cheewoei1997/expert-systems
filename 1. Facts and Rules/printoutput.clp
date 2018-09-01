(defrule duck
    (animal-is duck)
    =>
    (assert (sound-is quack))
    (printout t "it’s a duck" crlf))