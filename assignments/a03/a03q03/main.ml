(*
   Alex Franke
   a03q03
*)

exception IgnoreCase;;
exception NotImplemented;;

let rec sum = fun n ->
  if n < 0 then
    0
  else
    n + sum (n - 1)
;;
