(requires "mycin")

(defparm name drinker t "Drinker's Name: " t read-line)
(defparm age drinker number "Age: " t)



(defparm identity beer 
  (member IPA pale-ale stout ESB 
	  wheat-ale blueberry-ale tripel soda) 
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

(defrule 2
  if (hoppy beer is yes)
     (malt beer is no)
     (alc beer is yes)
     (dark beer is no) 
  then .75
     (identity beer is IPA))

(defrule 2
  if (hoppy beer is yes)
     (malt beer is no)
     (alc beer is no)
     (dark beer is no) 
  then .75
     (identity beer is pale-ale))

(defrule 3
  if (hoppy beer is no)
     (malt beer is yes)
     (alc beer is yes)
     (wheat beer is no)
     (dark beer is yes)
  then .8
     (identity beer is stout))

(defrule 4
  if (hoppy beer is no)
     (malt beer is yes)
     (alc beer is no)
     (wheat beer is no)
     (dark beer is no)
  then .75
     (identity beer is ESB))

(defrule 7
  if (hoppy beer is yes)
     (malt beer is yes)
     (alc beer is yes)
  then .8
     (identity beer is tripel))

(defrule 5
  if (wheat beer is yes)
  then .8
     (identity beer is wheat-ale))

(defrule 6 
  if (flavored beer is yes)
  then .8 
     (identity beer is blueberry-ale))