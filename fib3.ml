(*
   ocamlopt fib3.ml
   time ./a.out

   real	1m39.321s
   user	1m35.746s
   sys	0m0.084s
 *)

type intseq = Cons of int * (int -> intseq)

let rec nthseq n (Cons (x, f)) =
  if n = 1 then x
  else nthseq (n - 1) (f x)

let rec is_prime3 primes x =
  match primes with
    [] -> true
  | p :: rest when p >= x -> true
  | p :: rest -> if (p < x) && (x mod p = 0) then false
  else is_prime3 rest x ;;

let rec prime_seq3 primes x =
  if is_prime3 primes (x+1) then Cons(x+1, prime_seq3 (primes @ [x+1]))
  else prime_seq3 primes (x+1);;


let _ =
  for i = 0 to 1000 - 1 do
    nthseq 3000 (prime_seq3 [] 1) |> ignore
  done
