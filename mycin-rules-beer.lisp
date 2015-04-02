(requires "mycin")

(defvar string_list 
  '(("name: " 
     "Please enter your name: " 
     "We need to know your name to best provide a seemingly personal experience: ")
    ("age: " 
     "How old are you? " 
     "How old are you? (Keep in mind that the legal drinking age in the United States is 21 years old) ")
    ("hoppy:(0-5) " 
     "How much hoppiness do you prefer?(0-5) " 
     "Hoppiness, is the fruity, spicy, bitter, and aromatic aspect of beer. How much do you like these flavors?(0-5) ")
    ("malt:(0-5) " 
     "How much maltiness do you prefer?(0-5) " 
     "Malted barley gives beer is color, and sweet, chocolate, coffee or caramel flavors. Darker roasted malts contribute to darker beers. How much do you like these flavors?(0-5) ")
    ("alc:(0-5) " 
     "How much alcohol do you prefer?(0-5) " 
     "Alcohol is the primary intoxicant in most libations. How much would you prefer in your beverage?(0-5) ")
    ("wheat:(0-5) " 
     "Do you like wheat beers?(0-5) " 
     "Wheat and other grains are sometimes added in the brewing process to add hearty, earthy and bready flavors to beer. How much do you like these flavors?(0-5) ")
    ("flav:(blueberry apple pumpkin none) " 
     "what flavor do you like in your beers? (blueberry apple pumpkin none) " 
     "Flavor is the sensation gained through the tastebuds on your toungue. If you prefer a fruity flavor in your beer please specify it here. (blueberry, pumpkin, apple none) ")
    ("dark:(0-5) " 
     "Do you like dark beers? (0-5) " 
     "Dark beers, which get there color from longer roasted malt barley, tend to have stronger chocolate, coffee and caramel flavors. How much do you like them? (0-5) ")))


;; Test harness examples
(princ "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
(terpri)
(princ "Demonstration of beer picker:")
(terpri)
(princ "welcome to the beer picker thing!") 
(terpri)
(princ "would you like terse, normal, or verbose instructions? normal")
(terpri)
(princ ";; Loaded file /home/zarnold/cpsci375/Proj16/mycin-rules-beer.lisp")
(terpri)
(princ "------ DRINKER-1 ------ Please enter your name: zach")
(terpri)
(princ "How old are you? 21")
(terpri)
(princ "------ BEER-1 ------")
(terpri)
(princ "Enter the beer you want: unknown")
(terpri)
(princ "what flavor do you like in your beers? (blueberry apple pumpkin none) none")
(terpri)
(princ "Do you like wheat beers?(0-5) 0")
(terpri)
(princ "How much hoppiness do you prefer?(0-5) 4")
(terpri)
(princ "How much maltiness do you prefer?(0-5) 3")
(terpri)
(princ "How much alcohol do you prefer?(0-5) 4")
(terpri)
(princ "Findings for BEER-1: IDENTITY: IPA (0.750) PALE-ALE (0.750)")
(terpri)
(princ "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
(terpri)

(princ "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
(terpri)
(princ "Demonstration two of beer picker:")
(terpri)
(princ "welcome to the beer picker thing! ")(terpri) 
(princ "would you like terse, normal, or verbose instructions? terse")(terpri)
(princ ";;  Loaded file /home/zarnold/cpsci375/Proj16/mycin-rules-beer.lisp")(terpri)
(princ "------ DRINKER-1 ------")(terpri)
(princ "name:  zach")(terpri)
(princ "age:  15")(terpri)
(princ "------ BEER-1 ------")(terpri)
(princ "Enter the beer you want:  unknown")(terpri)
(princ "flav:(blueberry apple pumpkin none)  none")(terpri)
(princ "wheat:(0-5)  5")(terpri)
(princ "hoppy:(0-5)  5")(terpri)
(princ "alc:(0-5)  5")(terpri)
(princ "Findings for BEER-1:")(terpri)
(princ " IDENTITY: SHIRLEY-TEMPLE (0.999)")(terpri)  
(princ "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")(terpri)

(princ "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")(terpri)
(princ "Demonstration of imbedded case and mutually exclusive IPA rules:")(terpri)
(princ "welcome to the beer picker thing!")(terpri)
(princ "would you like terse, normal, or verbose instructions? normal")(terpri)
(princ ";;  Loaded file /home/zarnold/cpsci375/Proj16/mycin-rules-beer.lisp")(terpri)
(princ "------ DRINKER-1 ------")(terpri)
(princ "Please enter your name:  zach")(terpri)
(princ "How old are you?  21")(terpri)
(princ "------ BEER-1 ------")(terpri)
(princ "'Enter the beer you want:  unknown")(terpri)
(princ "what flavor do you like in your beers? (blueberry apple pumpkin none)  none")(terpri)
(princ "Do you like wheat beers?(0-5)  0")(terpri)
(princ "How much alcohol do you prefer?(0-5) ")(format t "~c[31m5~c[0m~%" #\ESC #\ESC)(terpri)
(princ "How much hoppiness do you prefer?(0-5) ")(format t "~c[31m5~c[0m~%" #\ESC #\ESC)(terpri)
(princ "How much maltiness do you prefer?(0-5)  3")(terpri)
(princ "Findings for BEER-1:")(terpri)
 (princ "IDENTITY: ")(format t "~c[31mIPA (0.990)~c[0m~%" #\ESC #\ESC)(princ " PALE-ALE (0.750)")(terpri)  
(princ "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")(terpri)

;; ---------------------


(defun determine-wordiness (input)
  (cond 
   ((equal input "verbose") 2)
   ((equal input "normal") 1)
   ((equal input "terse") 0)
   (t 1)))

(princ "welcome to the beer picker thing! ")
(terpri)
(princ "would you like terse, normal, or verbose instructions? ")
(defvar wordiness (determine-wordiness (read-line)))

(defparm name drinker t (nth wordiness (nth 0 string_list)) t read-line)
(defparm age drinker number (nth wordiness (nth 1 string_list)) t)



(defparm identity beer 
  (member IPA pale-ale stout ESB american-lager wheat-ale blueberry-ale tripel pumpkin-ale hard-cider shirley-temple) 
  "Enter the beer you want: " t)

(defparm hoppy beer (member 0 1 2 3 4 5) (nth wordiness (nth 2 string_list)) t)
(defparm malt beer (member 0 1 2 3 4 5) (nth wordiness (nth 3 string_list)) t)
(defparm alc beer (member 0 1 2 3 4 5) (nth wordiness (nth 4 string_list)) t)
(defparm wheat beer (member 0 1 2 3 4 5) (nth wordiness (nth 5 string_list)) t)
(defparm flavored beer (member blueberry pumpkin apple none) (nth wordiness (nth 6 string_list)) t)
(defparm dark beer (member 0 1 2 3 4 5) (nth wordiness (nth 7 string_list)) t)

(clear-rules)

(defrule 1
  if (age drinker < 21)
  then .999
     (identity beer is shirley-temple))

(defrule 2
  if 
     (hoppy beer > 3)
     (alc beer > 2)
     (alc beer < 5)
     (age drinker > 20)
  then .75
     (identity beer is IPA))

(defrule 30
  if 
     (hoppy beer is 5)
     ;; wnat alcohol to be 5 as well
     (alc beer is (hoppy beer)) ;; Demonstration of embedded case
     (age drinker > 20)
  then .99
     (identity beer is IPA))


(defrule 29
  if (hoppy beer > 2)
     (age drinker > 20)
     (alc beer > 1)
  then .75
     (identity beer is pale-ale))

(defrule 3
  if
     (age drinker > 20)
     (malt beer > 3)
     (alc beer > 1)
     (dark beer is 4)
  then .75
     (identity beer is stout))

(defrule 30
  if
     (age drinker > 20)
     (malt beer >  3)
     (alc beer > 1)
     (dark beer is 5)
  then .99
     (identity beer is stout))

(defrule 49
  if 
     (age drinker > 20)
     (malt beer is 5)
     (alc beer < 4)
     (dark beer < 4)
  then .80
     (identity beer is ESB))

(defrule 7
  if (hoppy beer > 3)
     (age drinker > 20)
     (malt beer > 3)
     (alc beer is 5)
  then .8
     (identity beer is tripel))

(defrule 5
  if (wheat beer > 3)
  (age drinker > 20)
  then .8
     (identity beer is wheat-ale))

(defrule 500
  if (wheat beer < 3)
  (age drinker > 20)
  (alc beer < 3)
  (hoppy beer < 3)
  (malt beer < 3)
  (dark beer < 3)
  (flavored beer is none)
  then .8
  (identity beer is american-lager))

(defrule 6 
  
  if (flavored beer is blueberry)
       (age drinker > 20)
  then .8 
     (identity beer is blueberry-ale))

(defrule 10
  
  if (flavored beer is pumpkin)
       (age drinker > 20)
  then .8 
     (identity beer is pumpkin-ale))

(defrule 11 
  
  if (flavored beer is apple)
       (age drinker > 20)
  then .8 
     (identity beer is hard-cider))
