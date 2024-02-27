(*
   Alex Franke
   a04q03
*)

exception IgnoreCase;;
exception NotImplemented;;

let rec range2 = fun x -> fun y -> fun z ->
  if z >= 0 then
    match x with
    | x when x < y -> x :: (range2 (x+z) y z)
    | x when x >= y -> []
    | _ -> raise IgnoreCase
  else
    match x with
    | x when x > y -> x :: (range2 (x+z) y z)
    | x when x <= y -> []
    | _ -> raise IgnoreCase
;;
