(*
   Alex Franke
   2/21/24
*)
exception IgnoreCase;;
exception NotImplemented;;
let rec elementof n lst =
  match lst with
  | [] -> false
  | x::xs when x = n -> true
  | _::xs -> elementof n xs
;;
