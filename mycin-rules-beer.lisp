(requires "mycin")

(defvar string_list '(
("name: " "Please enter your name: " "We need to know your name to best provide a seemingly personal experience: ")
("age: " "How old are you? " "How old are you? (Keep in mind that the legal drinking age in the United States is 21 years old) ")
("hoppy: " "How much hoppiness do you prefer? " "Hoppiness, is the fruity, spicy, bitter, and aromatic aspect of beer. How much do you like these flavors? ")
("malt: " "How much maltiness do you prefer? " "Malted barley gives beer is color, and sweet, chocolate, coffee or caramel flavors. Darker roasted malts contribute to darker beers. How much do you like these flavors? ")
("alc: " "How much alcohol do you prefer? " "Alcohol is the primary intoxicant in most libations. How much would you prefer in your beverage? ")
("wheat: " "Do you like wheat beers? " "Wheat and other grains are sometimes added in the brewing process to add hearty, earthy and bready flavors to beer. How much do you like these flavors? ")
("flav: " "what flavor do you like in your beers " "Flavor is the sensation gained through the tastebuds on your toungue. If you prefer a fruity flavor in your beer please specify it here. (blueberry, pumpkin, apple &c) ")
("dark: " "Do you like dark beers? " "Dark beers, which get there color from longer roasted malt barley, tend to have stronger chocolate, coffee and caramel flavors. ")
))

(defun determine-wordiness (input)
  (cond 
   ((equal input "verbose") 2)
   ((equal input "normal") 1)
   ((equal input "terse") 0)
   (t 1)))

(princ "welcome to the beer picker thing!")
(terpri)
(princ "would you like terse, normal, or verbose instructions?")
(defvar wordiness (determine-wordiness (read-line)))

(defparm name drinker t (nth wordiness (nth 0 string_list)) t read-line)
(defparm age drinker number (nth wordiness (nth 1 string_list)) t)



(defparm identity beer 
  (member IPA pale-ale stout ESB 
	  wheat-ale blueberry-ale tripel shirley-temple) 
  "Enter the beer you want: " t)

(defparm hoppy beer (member yes no dont-care) (nth wordiness (nth 2 string_list)) t)
(defparm malt beer (member yes no dont-care) (nth wordiness (nth 3 string_list)) t)
(defparm alc beer (member yes no dont-care) (nth wordiness (nth 4 string_list)) t)
(defparm wheat beer (member yes no dont-care) (nth wordiness (nth 5 string_list)) t)
(defparm flavored beer (member yes no dont-care) (nth wordiness (nth 6 string_list)) t)
(defparm dark beer (member yes no dont-care) (nth wordiness (nth 7 string_list)) t)

(clear-rules)

(defrule 1
  if (age drinker < 21)
  then .999
     (identity beer is shirley-temple))

(defrule 2
  if (hoppy beer is yes)
     (age drinker > 20)
     (malt beer is no)
     (alc beer is yes)
     (dark beer is no) 
  then .75
     (identity beer is IPA))

(defrule 2
  if (hoppy beer is yes)
     (age drinker > 20)
     (malt beer is no)
     (alc beer is no)
     (dark beer is no) 
  then .75
     (identity beer is pale-ale))

(defrule 3
  if (hoppy beer is no)
     (age drinker > 20)
     (malt beer is yes)
     (alc beer is yes)
     (wheat beer is no)
     (dark beer is yes)
  then .8
     (identity beer is stout))

(defrule 4
  if (hoppy beer is no)
     (age drinker > 20)
     (malt beer is yes)
     (alc beer is no)
     (wheat beer is no)
     (dark beer is no)
  then .75
     (identity beer is ESB))

(defrule 7
  if (hoppy beer is yes)
     (age drinker > 20)
     (malt beer is yes)
     (alc beer is yes)
  then .8
     (identity beer is tripel))

(defrule 5
  if (wheat beer is yes)
  (age drinker > 20)
  then .8
     (identity beer is wheat-ale))

(defrule 6 
  
  if (flavored beer is yes)
       (age drinker > 20)
  then .8 
     (identity beer is blueberry-ale))
