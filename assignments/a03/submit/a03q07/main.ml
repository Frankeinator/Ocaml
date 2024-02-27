(*
   Alex Franke
   a03q07
*)

exception IgnoreCase;;
exception NotImplemented;;

let second = fun list ->
  match list with
    _ :: y :: _ -> y
  | _ -> raise IgnoreCase
;;

second [1;2;3;4];;
