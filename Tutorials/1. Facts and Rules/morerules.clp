(defrule is-it-a-duck
    (animal-has webbed-feet)
    (animal-has feathers)
    =>
    (assert (animal-is duck)))