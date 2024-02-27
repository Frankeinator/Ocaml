(*
   Alex Franke
   a03q04
*)

exception IgnoreCase;;
exception NotImplemented;;

let rec is_divisible_from = fun n -> fun d ->
  if d * d > n then
    false
  else if n mod d = 0 then
    true
  else
    is_divisible_from n (d+1)
;;

let isprime = fun n ->
  if n <= 1 then
    false
  else if n <= 3 then
    true
  else if n mod 2 = 0 || n mod 3 = 0 then
    false
  else
    not (is_divisible_from n 2)
;;
