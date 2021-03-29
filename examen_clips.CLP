(defglobal
	?*numero_magico* = 21
)

(deffacts datos
	(numeros 5 3 8 14 7)
)

(defrule multiplicar
	?f <- (numeros ?a ?b ?c ?d ?e)
	?f2 <- (* ?a ?b)
=>
	(assert (numeros ?f2 ?c ?d ?e))
	(retract ?f)
	(printout t "Variable ?f2: " ?f2 crlf)
)

(defrule dividir
	?r <- (numeros 15 ?c ?d ?e)
	?r2 <- (div ?d ?e)
	(test (= 0 (mod ?d ?e)))
=>
	(assert (numeros 15 ?c ?r2))
	(retract ?r)
)

(defrule resta
	?t <- (numeros 15 ?c 2)
	?t2 <- (- ?c 2)
	(test (> ?c 2))
=>
	(assert (numeros 15 ?t2))
	(retract ?t)
)