(deffacts member
	(member-of beatles 
		john_lennon 
		paul_mccartney 
		george_harrison 
		ringo_starr)
	(member-of who 
		roger_daltrey 
		pete_townsend 
		keith_moon)
	(member-of ebtg 
		tracey_thorn 
		ben_watt)
)

(defrule bands
	(member-of ?band $?)
	=>
	(printout t ?band " is a band" crlf)
)

(defrule band-members
	(member-of ?band $?members)
	=>
	(printout t "The members of " ?band " are " ?members crlf)
)

(defrule band-members2
	(member-of ?band $? ?member $?)
	=>
	(printout t ?member " is a member of " ?band crlf)
)

(defglobal 
	?*name* = "Kitty"
	?*total* = 0
)

(defrule printname
	(initial-fact)
	=>
	(printout t "Hi, " ?*name* ", your total is " ?*total* crlf)
)
