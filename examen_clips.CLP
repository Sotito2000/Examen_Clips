(deffacts datos
	(numero_magico 21)
	(numeros 5 3 8 14 7)
)

(defrule multiplicar
	?f <- (numeros ?a ?b ?c ?d ?e)
	?f2 <- (?a*?b)
=>
	(assert (numeros ?f2 ?c ?d ?e))
	(retract ?f)
)

(defrule dividir
	?r <- (numeros ?f2 ?c ?d ?e)
	(test (= 0 mod(?d ?e)))
=>
	?r2 <- (div(?d ?e))
	(assert (numeros ?f2 ?c ?r2)
	(retract ?r)