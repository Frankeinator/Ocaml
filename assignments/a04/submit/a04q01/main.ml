(*
   Alex Franke
   a04q01
*)

exception IgnoreCase;;
exception NotImplemented;;

let rec duplicate = fun x -> fun n ->
  match n with
    0 -> []
  | n when n > 0 -> x :: (duplicate x (n-1))
  | _ -> raise IgnoreCase
;;
    
let lst = duplicate 6 3;;
let rec print_list = function
  | [] -> ()
  | h::t -> Printf.printf "%d " h; print_list t
;;
print_list lst;; print_endline "";;
