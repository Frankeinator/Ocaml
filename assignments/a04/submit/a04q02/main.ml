(*
   Alex Franke
   a04q02
*)

exception IgnoreCase;;
exception NotImplemented;;

let rec range = fun a -> fun b ->
  match a with
  | a when a < b -> a :: (range (a+1) b)
  | a when a => b -> []
  | _ -> raise IgnoreCase
;;
