(*
   Name: Alex Franke
   File: main.ml Assignment 2 Q 6
*)

exception NotImplented;;
exception IgnoreCase;;

let f = fun x -> x +. 1.0;;
let g = fun x -> x -. 1.0;;
let h = fun x -> x *. x;;

let comp_func = fun x -> fun y -> fun (z: float) ->
  (x (y z))
;;

let res = (comp_func f g) 0.0;;
print_float res;;
print_endline "";;
let res = (comp_func f g) 1.0;;
print_float res;;
print_endline "";;
let res = (comp_func g f) 2.0;;
print_float res;;
print_endline "";;
let res = (comp_func g f) 3.0;;
print_float res;;
print_endline "";;
let res = (comp_func f h) 0.0;;
print_float res;;
print_endline "";;
let res = (comp_func f h) 1.0;;
print_float res;;
print_endline "";;
let res = (comp_func h f) 2.0;;
print_float res;;
print_endline "";;
