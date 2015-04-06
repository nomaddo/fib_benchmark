all:
	ocamlopt -o fib2 fib2.ml
	ocamlopt -o fib3 fib3.ml
	ocamlopt -o fib4 fib4.ml

test: all
	time ./fib2
	time ./fib3
	time ./fib4
