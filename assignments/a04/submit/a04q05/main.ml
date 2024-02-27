(*
   Alex Franke
   2/21/24
*)

exception IgnoreCase;;
exception NotImplemented;;

let index lst n = 
  let rec index_h lst n acc =
    match lst with
    | [] -> -1
    | x :: xs when x = n -> acc
    | _ :: xs -> index_h xs n (acc+1)
  in
  index_h lst n 0
;;
