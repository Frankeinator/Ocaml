(*
   Name: Alex Franke
   File: main.ml Assignment 2 Q 5
*)

exception NotImplented;;
exception IgnoreCase;;

let f = fun x -> x +. 1.0;;
let g = fun x -> x -. 1.0;;
let h = fun x -> x *. x;;

let div_func = fun x -> fun y -> fun (z: float) ->
  if z <> 0. then
    (x z) /. (y z)
  else
    -1.
;;

let res = (div_func f g 0.0);;
print_float res;;
print_endline "";;
let res = (div_func g f 2.0);;
print_float res;;
print_endline "";;
let res = (div_func g f 3.0);;
print_float res;;
print_endline "";;
let res = (div_func f h 1.0);;
print_float res;;
print_endline "";;
let res = (div_func h f 2.0);;
print_float res;;
print_endline "";;
