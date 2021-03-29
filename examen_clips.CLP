(defglobal
	?*numero_magico* = 21
)

(deffacts datos
	(numeros 5 3 8 14 7)
)

(defrule multiplicar
	(numeros $?n ?a ?b ?c ?d ?e)
	?f <- (* ?a ?b)
=>
	(assert (numeros $?n ?f ?c ?d ?e))
)

(defrule dividir
	?r <- (numeros $?n ?f ?c ?d ?e)
	?r2 <- (div ?d ?e)
	(test (= 0 (mod ?d ?e)))
=>
	(assert (numeros $?n ?f ?c ?r2))
	(retract ?r)
)

(defrule resta
	?t <- (numeros $?n ?f ?c ?r2)
	?t2 <- (- ?c ?r2)
	(test (> ?c ?r2))
=>
	(assert (numeros ?f ?t2))
	(retract ?t)
)