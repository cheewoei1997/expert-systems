(defrule call-AA
   (starter-turning yes)
   (petrol yes)
   =>
   (printout t "Call the AA!" crlf))

(defrule buy-petrol
   (starter-turning yes)
   (petrol no)
   =>
   (printout t "Buy some petrol!" crlf))

(defrule replace-starter
   (starter-turning no)
   (lights-working yes)
   (solenoid-click yes)
   (terminals-clean yes)
   =>
   (printout t "Replace starter!" crlf))

(defrule clean-terminals
   (starter-turning no)
   (lights-working yes)
   (solenoid-click yes)
   (terminals-clean no)
   =>
   (printout t "Clean terminals!" crlf))

(defrule charge-battery
   (starter-turning no)
   (lights-working no)
   =>
   (printout t "Change battery!" crlf))

(defrule replace-solenoid
   (starter-turning no)
   (lights-working yes)
   (solenoid-click no)
   (solenoid-fuse-ok yes)
   =>
   (printout t "Replace solenoid!" crlf))

(defrule replace-fuse
   (starter-turning no)
   (lights-working yes)
   (solenoid-click no)
   (solenoid-fuse-ok no)
   =>
   (printout t "Replace fuse!" crlf))

