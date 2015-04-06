(*

ocamlopt fib2.ml
time ./a.out

real	0m22.368s
user	0m21.649s
sys	0m0.000s

 *)

type intseq = Cons of int * (int -> intseq)

let rec nthseq n (Cons (x, f)) =
  if n = 1 then x
  else nthseq (n - 1) (f x)


let is_prime2 x =
  let xs = sqrt(float_of_int x) in
  let rec is_divisible_from n =
    (n > 1) && ((x mod n = 0) || is_divisible_from (n - 1))
  in not (is_divisible_from (int_of_float xs));;
let rec prime_seq2 x =
  if is_prime2 (x+1) then Cons(x+1, prime_seq2) else prime_seq2 (x+1);;

let _ =
  for i = 0 to 1000 - 1 do
    nthseq 3000 (prime_seq2 1) |> ignore
  done
