(defglobal
	?*numero_magico* = 21
)

(deffacts datos
	(numeros 5 3 8 14 7)
)

(defrule multiplicar
	(numeros ?a ?b ?c ?d ?e $?n)
=>
	(assert (numeros (* ?a ?b) ?c ?d ?e $?n))
)

(defrule dividir
	(numeros ?a ?b ?c ?d $?n)
	(test (= 0 (mod ?c ?d)))
=>
	(assert (numeros ?a ?b (div ?c ?d) $?n))
)

(defrule resta
	(numeros ?a ?b ?c $?n)
	(test (> ?b ?c))
=>
	(assert (numeros ?a (- ?b ?c) $?n))
)

(defrule suma
	(numeros ?a ?b $?n)
	(test (= (+ ?a ?b) ?*numero_magico*))
=>
	(assert (numeros (+ ?a ?b) $?n))
)