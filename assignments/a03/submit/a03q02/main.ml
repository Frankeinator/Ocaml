(*
   Alex Franke
   a03q02
*)

exception IgnoreCase;;
exception NotImplemented;;

let rec power2 = fun x -> fun n ->
  if n < 0 then
    raise IgnoreCase
  else if n = 0 then
    1
  else if n mod 2 = 0 then
    power2 x (n / 2) * power2 x (n / 2)
  else 
    x * power2 x ((n - 1) / 2) * power2 x ((n - 1) / 2)
;;
