(*
   Alex Franke
   Reduce Examples
*)

let sumlist = fun list -> (fun x -> fun y -> x + y) 0 list;;
let prodlist = fun list -> (fun x -> fun y -> x * y) 1 list;;let

fun rec reduce = fun f -> fun b -> fun list ->
match list with
| [] -> b
| x::xs -> f x (reduce f b xs)
;;
