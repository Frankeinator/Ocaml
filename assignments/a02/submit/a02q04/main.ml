(*
   Name: Alex Franke
   File: main.ml Assignment 2 Q 4
*)

exception NotImplented;;
exception IgnoreCase;;

let f = fun x -> x +. 1.0;;
let g = fun x -> x -. 1.0;;
let h = fun x -> x *. x;;

let mult_func = fun x -> fun y -> fun (z: float) ->
  (x z) *. (y z)
;;

let res = (mult_func f g) 0.0;;
print_float res;;
print_endline "";;
let res = (mult_func f g) 1.0;;
print_float res;;
print_endline "";;
let res = (mult_func g f) 2.0;;
print_float res;;
print_endline "";;
let res = (mult_func g f) 3.0;;
print_float res;;
print_endline "";;
let res = (mult_func f h) 0.0;;
print_float res;;
print_endline "";;
let res = (mult_func f h) 1.0;;
print_float res;;
print_endline "";;
let res = (mult_func h f) 2.0;;
print_float res;;
print_endline "";;
