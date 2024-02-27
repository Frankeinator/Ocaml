(*
   Name: Alex Franke
   File: main.ml (Assignment 2 Q 1)
*)

exception IgnoreCase;;
exception NotImplemented;;

let max  = fun (x: int) -> fun (y: int) -> fun (z: int) ->
  if x > y then
    if x > z then
      x
    else
      -1
  else if y > z then
    y
  else
    z
;;


let res = max 5 2 1;;
print_int res;;
print_endline "";;
