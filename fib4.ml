(*
   ocamlopt fib4.ml
   time ./a.out

   real	1m12.257s
   user	1m10.080s
   sys	0m0.016s

 *)

type intseq = Cons of int * (int -> intseq)

let rec nthseq n (Cons (x, f)) =
  if n = 1 then x
  else nthseq (n - 1) (f x)

let rec is_prime4 primes x =
  let xs = sqrt(float_of_int x) in
  let ixs = int_of_float xs in
  match primes with
    [] -> true
  | p :: rest when p >= x -> true
  | p :: rest ->
    if (p < ixs) && (x mod p = 0) then false
    else is_prime4 rest x

let rec prime_seq4 primes x =
  if is_prime4 primes (x+1) then Cons(x+1, prime_seq4 (primes @ [x+1]))
  else prime_seq4 primes (x+1);;

let _ =
  for i = 0 to 1000 - 1 do
    nthseq 3000 (prime_seq4 [] 1) |> ignore
  done
