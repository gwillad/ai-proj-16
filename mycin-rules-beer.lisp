(requires "mycin")

(defvar string_list 
("name" "Please enter your name" "We need to know your name to best provide a seemingly personal experience")
("age" "How old are you?" "How old are you? (Keep in mind that the legal drinking age in the United States is 21 years old")
("hoppy" "How much hoppiness do you prefer?" "Adam")
("malt" "How much maltiness do you prefer?" "Adam")
("alc" "How much alcohol do you prefer?" "Alcohol is the primary intoxicant in most libations. How much would you prefer to have in your beverage?")
("wheat", "Do you like wheat beers?" "Adam")
("flav", "what flavor do you like in your beers" "Flavor is the sensation gained through the tastebuds on your toungue. If you prefer a fruity flavor in your beer please specify it here. (blueberry)")
("dark" "Do you like dark beers?" "Adam")
)

(princ "welcome to the beer picker thing!")
(terpri)
(princ "would you like terse, normal, or verbose instructions?")
(defvar wordiness (determine-wordiness (read-line)))

(defparm name drinker t (nth wordiness (nth 0 string_list)) t read-line)
(defparm age drinker number "Drinker's Age: " t)



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
