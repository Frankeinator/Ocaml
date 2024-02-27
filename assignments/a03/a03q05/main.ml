(*
   Alex Franke
   a03q05
*)

exception IgnoreCase;;
exception NotImplemented;;

let head = fun list -> match list with
    head :: _ -> head
  | [] -> raise IgnoreCase
;;

let z = head [6;2;3];;
print_int z;; print_endline "";;
