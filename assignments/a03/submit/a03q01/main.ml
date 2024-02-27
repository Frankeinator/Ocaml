(*
   Alex Franke
   main.ml -- a03q01
*)

exception IgnoreCase;;
exception NotImplemented;;

let rec power = fun x -> fun n ->
  if n < 0 then
    raise IgnoreCase
  
  else if n <> 0 then
    x * power x (n - 1)
      
  else
    1
;;
