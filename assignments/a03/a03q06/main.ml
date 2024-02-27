(*
   Alex Franke
   a03q06
*)

exception IgnoreCase;;
exception NotImplemented;;

let tail = fun list -> match list with
    _ :: xs -> xs
  | _ -> []
;;


