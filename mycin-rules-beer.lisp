(requires "mycin")

(defparm name drinker t "Drinker's Name: " t read-line)
(defparm age drinker number "Age: " t)



(defparm identity beer 
  (member IPA pale-ale stout porter 
	  ESB wheat-ale blueberry-ale tripel soda) 
  "Enter the beer you want: " t)

(defparm hoppy beer (member yes no dont-care) "Do you like hoppiness? " t)
(defparm malt beer (member yes no dont-care) "Do you like maltiness? " t)
(defparm alc beer (member yes no dont-care) "Do you like very alcoholic beers? " t)
(defparm wheat beer (member yes no dont-care) "Do you like wheat beer? " t)
(defparm flavored beer (member yes no dont-care) "Do you like flavored beer? " t)
(defparm dark beer (member yes no dont-care) "Do you like dark beer? " t)

(clear-rules)

(defrule 1
  if (age drinker is 15)
  then .999
     (identity beer is soda))