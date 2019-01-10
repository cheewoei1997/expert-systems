;;****************
;;* DEFFUNCTIONS *
;;****************


(deffunction ask-question (?question $?allowed-values)
   (printout t ?question)
   (bind ?answer (read))
   (if (lexemep ?answer) 
       then (bind ?answer (lowcase ?answer)))
   (while (not (member ?answer ?allowed-values)) do
      (printout t "Invalid Input! Please try again." crlf crlf)
      (printout t ?question)
      (bind ?answer (read))
      (if (lexemep ?answer) 
          then (bind ?answer (lowcase ?answer))))
   ?answer)

(deffunction yes-or-no-p (?question)
   (bind ?response (ask-question ?question yes no y n))
   (if (or (eq ?response yes) (eq ?response y))
       then yes 
       else no))


;;;********************************
;;;* STARTUP AND CONCLUSION RULES *
;;;********************************


(defrule system-banner 
  (declare (salience 10))
  =>
  (clear-window)
  (printout t crlf crlf)
  (printout t "====================================================================" crlf)
  (printout t "  		          Expert System for First Aid Guidance 		       " crlf)
  (printout t "====================================================================" crlf)
  (printout t crlf crlf))


(defrule try-again 
  (done yes)
  => 
  (bind ?ans (yes-or-no-p "More casualties? (yes/no): "))
  (if (eq ?ans yes) then    
    (clear-window) 
    (reset)
  )
  (if (eq ?ans no) then 
  (printout t "Thank you for using this system." crlf)
  )
)


;;;***************
;;;* QUERY RULES *
;;;***************

(defrule is-safe
    =>
    (assert (safe (yes-or-no-p "Is the area of both you and the casualty are at safe? ")))
)

(defrule is-conscious
    (safe ?tmp)
    (not (conscious ?tmp))
    =>
    (assert (conscious (yes-or-no-p "Is the casualty conscious? ")))
)

(defrule need-help
    (conscious yes)
    =>
    (assert (help (yes-or-no-p "Does the casualty willing to accept your assistance? ")))
)

(defrule got-fracture
    (help yes)
    =>
    (assert (fracture (yes-or-no-p "Does the casualty experience bone fracture on any of his/her limbs? " )))
)

(defrule fractured-part
  (fracture yes)
  =>
  (assert (fractured-part (ask-question "Does the leg or the hand of the casualty fractured? (Hand / Leg) " hand leg )))
)

(defrule get-fracture-type
    (fracture yes)
    =>
    (assert (fracture-type (ask-question "Is it an open fracture or a closed fracture? (Open/Closed) " open closed )))
)

(defrule get-breathing
    (help yes)
    (conscious no)
    =>
    (assert (breathing (yes-or-no-p "Is the casualty breathing? ")))
)

(defrule get-airway-blocked
    (help yes)
    (breathing no)
    (not (airway-blocked no))
    =>
    (assert (airway-blocked (yes-or-no-p "Is the airway(throat) of the casualty blocked by a foreign object? ")))
)

(defrule get-foreign-object-removed
    (help yes)
    (airway-blocked yes)
    =>
    (assert (foreign-object-removed (yes-or-no-p "Are you able to remove the foreign object? ")))
)

(defrule get-pulse
    (help yes)
    (breathing ?tmp)
    =>
    (assert (pulse (yes-or-no-p "Does the casualty has pulse? ")))
)

(defrule get-bleeding
    (help yes)
    (safe yes)
    =>
    (assert (bleeding (yes-or-no-p "Does the casualty suffer bleeding from an injury? ")))
)

(defrule get-severe-bleeding
    (help yes)
    (safe yes)
    (bleeding yes)
    =>
    (assert (severe-bleeding (yes-or-no-p "Does the bleeding severe? ")))
)

(defrule get-foreign-body-on-wound
    (help yes)
    (safe yes)
    (bleeding yes)
    (severe-bleeding yes)
    =>
    (assert (foreign-body-on-wound (yes-or-no-p "Is there a foreign body on the wound? (Example: Splinter, Piece of shattered glass etc) ")))
)

(defrule get-burn
    (help yes)
    (safe yes)
    =>
    (assert (burn (yes-or-no-p "Does the casualty suffer burn? ")))
)

(defrule get-burn-type
    (help yes)
    (safe yes)
    (burn yes)
    =>
    (assert (burn-type (ask-question "Which is the cause of the burn? Fire or Chemical? " fire chemical)))
)


;;;********************
;;;* SUGGESTION RULES *
;;;********************

(defrule decide-help
    (conscious no)
    =>
    (assert (help yes))
)

(defrule instr-refuse-help
    (conscious yes)
    (help no)
    =>
    (assert (done yes))
    (printout t crlf "Instruction:" crlf)
    (printout t "Stay near the casualty and provide assistance only when casualty requested. Call ambulance if the casualty is badly injured." crlf crlf)
)

(defrule instr-move
    (help yes)
    (fracture no)
    (safe no)
    ;;;?cond1 <- (safe no)
    =>
    (printout t crlf "Instruction:" crlf)
    (printout t "Get help and move the casualty to a safe place." crlf crlf)
    ;;;(retract ?cond1)
    ;;;(assert (safe yes))
)

(defrule instr-fracture
    (help yes)
    (fracture yes)
    (safe ?tmp1)
    (fracture-type ?tmp2)   
    (fractured-part ?tmp3)
    =>
    (printout t crlf "Instruction:" crlf)
    (if (eq ?tmp1 yes) then
        (printout t "Minimize movement by securing the fractured " ?tmp3 ". " crlf)
    )
    (if (eq ?tmp1 no) then
        (printout t "Minimize movement by securing the fractured " ?tmp3 ". " crlf)
        (printout t "Get help and move the casualty to a safe place." crlf)
    )
    (if (eq ?tmp2 open) then
        (printout t "Dress the wound and apply pressure to control the bleeding." crlf)
        (printout t "If bone is protuding, use a crescent pad around the bone and bandage over the pad." crlf)
    )
    (if (eq ?tmp2 closed) then
        (printout t "Get an ice pack and apply it on the area where it's swelling and appears red." crlf)
    )
    (printout t "Elevate the fractured " ?tmp3 ". " crlf crlf)
)


(defrule instr-recovery-position
    (help yes)
    (breathing yes)
    (pulse yes)
    (fracture no)
    =>
    (printout t crlf "Instruction:" crlf)
    (printout t "Place the casualty in recovery position." crlf)
    (printout t "Check for sign of life from time to time." crlf crlf)
)

(defrule instr-choking
    (help yes)
    (conscious yes)
    (breathing no)
    (airway-blocked yes)
    =>
    (printout t crlf "Instruction:" crlf)
    (printout t "Perform abdominal thrust(Heimlich Maneuver)." crlf crlf)
)

(defrule instr-remove-foreign-object 
    (declare (salience 10))
    (help yes)
    (conscious no)
    (breathing no)
    (airway-blocked yes)
    =>
    (printout t crlf "Instruction:" crlf)
    (printout t "Perform head-tilt-chin-lift to open the airway and locate the foreign object." crlf)
    (printout t "If you're able to see the foreign object clearly, attempt to remove it." crlf crlf)
)

(defrule cond-remove-foreign-object 
    (declare (salience 10))
    (help yes)
    (conscious no)
    (breathing no)
    (airway-blocked yes)
    (foreign-object-removed ?tmp)
    ?cond1 <- (breathing no)
    ?cond2 <- (airway-blocked yes)
    ?cond3 <- (foreign-object-removed yes)
    =>
    (if (eq ?tmp yes) then
        (retract ?cond1)
        (retract ?cond2)
        (retract ?cond3)
        (assert (airway-blocked no))
        (assert (breathing (yes-or-no-p "Is the casualty breathing now? " )))
    )    
)

(defrule instr-breathing-but-no-pulse
    (help yes)
    (conscious no)
    (breathing yes)
    (pulse no)
    =>
    (printout t crlf "Instruction:" crlf)
    (printout t "Get someone to call ambulance." crlf)
    (printout t "Perform compression on the chest until casualty regained his/her pulse." crlf crlf)
    (assert (done yes))
)

(defrule instr-no-breathing-but-got-pulse
    (help yes)
    (conscious no)
    (breathing no)
    (pulse yes)
    =>
    (printout t crlf "Instruction:" crlf)
    (printout t "Get someone to call ambulance." crlf)
    (printout t "Give 1 rescue breathe every 10 seconds until casualty is a breathe" crlf crlf)
    (assert (done yes))
)

(defrule instr-CPR
    (help yes)
    (conscious no)
    (breathing no)
    (pulse no)
    =>
    (printout t crlf "Instruction:" crlf)
    (printout t "Get someone to call ambulance and bring an AED to you." crlf)
    (printout t "Perform CPR immediately." crlf crlf)
    (printout t "Stop CPR if: " crlf)
    (printout t "1. Casualty shows obvious sign of life, such as breathing. " crlf)
    (printout t "2. An AED is available and ready to use. " crlf)
    (printout t "3. Ambulance has arrived and EMS personnel is ready to take over. " crlf)
    (printout t "4. You are too exhausted to continue. " crlf)
    (printout t "5. The scene becomes unsafe." crlf crlf)
    (assert (done yes))
)

(defrule instr-severe-bleeding
    (help yes)
    (bleeding yes)
    (severe-bleeding yes)
    (foreign-body-on-wound ?tmp1)
    =>
    (printout t crlf "Instruction:" crlf)
    (printout t "Rinse the wound with clean running water, if possible until it's clean . " crlf)
    (if (eq ?tmp1 yes) then
        (printout t "Remove the foreign object if possible and dress the wound." crlf)
        
    )
    (printout t "Apply indirect pressure." crlf)
    (printout t "Send the casualty to the nearest hospital or call for ambulance." crlf crlf)
)

(defrule instr-slight-bleeding
    (help yes)
    (bleeding yes)
    (severe-bleeding no)
    =>
    (printout t crlf "Instruction:" crlf)
    (printout t "Rinse the wound with clean running water, if possible until it's clean . " crlf)
    (printout t "Dress the wound and apply direct pressure." crlf crlf)
)


(defrule instr-burn
    (help yes)
    (burn yes)
    (burn-type ?tmp)
     =>
    (printout t crlf "Instruction:" crlf)
    (if (eq ?tmp fire) then
        (printout t "Immerse injured part in cold running water until pain subsides." crlf)
        (printout t "Do not break blisters." crlf)
        (printout t "Send the casualty to the nearest hospital or call for ambulance." crlf crlf)
    )
    (if (eq ?tmp chemical) then
        (printout t "Flood injured part thoroughly and continuously with clean running water to wash away the chemical as quick as possible." crlf)
        (printout t "Remove any contaminated clothing as quickly as possible." crlf)
        (printout t "Call for ambulance." crlf crlf)
    )

)

(defrule instr-further-assistance
    (help yes)
     =>
    (printout t crlf "Instruction:" crlf)
    (printout t "Calm the casualty and contact his/her family members" crlf crlf)
    (assert (done yes))
)
