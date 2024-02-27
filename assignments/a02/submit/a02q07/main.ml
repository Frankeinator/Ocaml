(*
   Name: Alex Franke
   File: main.ml Assignment 2 Q 7
*)

exception NotImplented;;
exception IgnoreCase;;

let f = fun x -> x +. 1.0;;
let g = fun x -> x -. 1.0;;
let h = fun x -> x *. x;;

let max_func = fun x -> fun y -> fun (z: float) ->
  if (x z) >= (y z) then
    (x z)
  else
    (y z)
;;

let res = (max_func f g 0.0);;
print_float res;;
print_endline "";;
let res = (max_func f g 1.0);;
print_float res;;
print_endline "";;
let res = (max_func g f 2.0);;
print_float res;;
print_endline "";;
let res = (max_func g f 3.0);;
print_float res;;
print_endline "";;
let res = (max_func f h 0.0);;
print_float res;;
print_endline "";;
let res = (max_func f h 1.0);;
print_float res;;
print_endline "";;
let res = (max_func h f 2.0);;
print_float res;;
print_endline "";;
