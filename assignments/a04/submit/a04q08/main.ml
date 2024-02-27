(*
   Alex Franke
   a04q08
*)
exception NotImplemented;;
exception IgnoreCase;;

let rec subseteq list1 list2 =
  match list1 with
  | [] -> true
  | x :: xs ->
    if List.mem x list2 then
      subseteq xs list2
    else
      false
;;


