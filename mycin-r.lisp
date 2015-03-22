


;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-
;;;; Code from Paradigms of AI Programming
;;;; Copyright (c) 1991 Peter Norvig

;;;; File mycin-r.lisp: Sample parameter list and rulebase for mycin.

(requires "mycin")

;;; Parameters for patient:
(defparm name student t "Student's name: " t read-line)
(defparm class-year student (member freshman sophomore junior senior) "Class year of ~a:" t)

;;---
;; This now needs to be created here programmatically for each class...
;;---


(defparm class_name taken_course (member cs110 cs111) )
;;(defparm class_name taken_course 
;;(member cs110 cs111) 
;;"Please enter the name of a course you have taken: " t)
;;(defparm prev-taken student list-of-classes "What CS courses has ~a taken? format: (cs-xxx)" read-line)


;; ;;; Parameters for culture:
;; (defparm site culture (member blood)
;;   "From what site was the specimen for ~a taken?" t)
;; (defparm days-old culture number
;;   "How many days ago was this culture (~a) obtained?" t)1

;; ;;; Parameters for organism:
;; (defparm identity organism
;;   (member pseudomonas klebsiella enterobacteriaceae
;;           staphylococcus bacteroides streptococcus)
;;   "Enter the identity (genus) of ~a:" t)
;; (defparm gram organism (member acid-fast pos neg)
;;   "The gram stain of ~a:" t)
;; (defparm morphology organism (member rod coccus)
;;   "Is ~a a rod or coccus (etc.):")
;; (defparm aerobicity organism (member aerobic anaerobic))
;; (defparm growth-conformation organism 
;;   (member chains pairs clumps))

;; (clear-rules)

;; (defrule 52
;;   if (site culture is blood)
;;      (gram organism is neg)
;;      (morphology organism is rod)
;;      (burn patient is serious)
;;   then .4
;;      (identity organism is pseudomonas))

;; (defrule 71
;;   if (gram organism is pos)
;;      (morphology organism is coccus)
;;      (growth-conformation organism is clumps)
;;   then .7
;;      (identity organism is staphylococcus))

;; (defrule 73
;;   if (site culture is blood)
;;      (gram organism is neg)
;;      (morphology organism is rod)
;;      (aerobicity organism is anaerobic)
;;   then .9
;;      (identity organism is bacteroides))

;; (defrule 75
;;   if (gram organism is neg)
;;      (morphology organism is rod)
;;      (compromised-host patient is yes)
;;   then .6
;;      (identity organism is pseudomonas))

;; (defrule 107
;;   if (gram organism is neg)
;;      (morphology organism is rod)
;;      (aerobicity organism is aerobic)
;;   then .8
;;      (identity organism is enterobacteriaceae))

;; (defrule 165
;;   if (gram organism is pos)
;;      (morphology organism is coccus)
;;      (growth-conformation organism is chains)
;;   then .7
;;      (identity organism is streptococcus))

;; first step populate db

(clear-db)

;; value is (name-of-class pre-reqs)

(put-db 'cs-102 '((needful things) () (yes)))
(put-db 'cs-105 '((explorations in computer science) () (yes)))
(put-db 'cs-110 '((intro to computer science) () (yes)))
(put-db 'cs-111 '((data structures) (cs-110) (yes)))
(put-db 'cs-123 '((discreet mathematics) () (yes)))
(put-db 'cs-210 '((applied theory) (cs-123) (yes)))
(put-db 'cs-220 '((principles of programming languages) (cs-111) (yes)))
(put-db 'cs-240 '((computer organization and assembly language) (cs-111) (yes)))
(put-db 'cs-310 '((compilers) (cs-210 cs-220 cs-240) (yes)))
(put-db 'cs-320 '((computer architecture) (cs-240) (yes)))
(put-db 'cs-330 '((algorithms) (cs-111 cs-123) (yes)))
(put-db 'cs-340 '((operating system) (cs-240) (yes)))
(put-db 'cs-350 '((database theory and practice) (cs-111) (yes)))
(put-db 'cs-375 '((artificial intelligence) (cs-220) (yes)))
(put-db 'cs-410 '((senior seminar) (cs-210 cs-220 cs-240 senior) (yes)))1

;; (defun generate-possible-courses-taken (titles)
;;   (if (not titles) 
;;       '()
;;     (if 

;; example rule for us 





(defrule 10
 if (prev-taken student fulfills (prereqs course))
    (availabe course is yes)
    (courses-required student contains course)
 then 1
    (reccomended course is (name course)))