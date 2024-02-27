(*
   Name: Alex Franke
   File: main.ml Assignment 2 Q 8
*)

exception NotImplented;;
exception IgnoreCase;;

let d = fun f -> fun (h: float) -> fun (x: float) ->
  ((f (x +. h)) -. (f x)) /. h
;;

let res    = d (fun x -> x +. 3.0) 2.0 5.0;;
print_float res;;
print_endline "";;

let result = d (fun x -> x *. x) 0.001 1.0;;
print_float result;;
print_endline "";;
