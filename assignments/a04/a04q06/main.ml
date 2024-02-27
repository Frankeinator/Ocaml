(*
   Alex Franke
   2/21/24
*)
exception IgnoreCase;;
exception NotImplemented;;
let rec at lst n = 
  if n < 0 then raise IgnoreCase
  else
    match lst with
    | [] -> raise IgnoreCase
    | x :: xs when n = 0 -> x
    | _ :: xs -> at xs (n - 1)
;;
