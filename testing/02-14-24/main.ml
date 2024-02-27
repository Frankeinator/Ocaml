type int_list =
    Empty
  | Cons of (int * int_list)
;;

let a = Empty;;
let b = Cons (3, a);;
let c = Cons (0, b);;


let to_string xs =
  let rec to_string2 xs =
    match xs with
      Empty -> ""
    | Cons (y, Empty) -> (string_of_int y)
    | Cons (y, ys) -> (string_of_int y) ^ ", " ^ (to_string2 ys)
  in
  "[" ^ (to_string2 xs) ^ "]"
;;

let print_int_list xs = print_string (to_string xs);;

let rec length_int_list = fun xs ->
  match xs with
    Empty -> 0
  | Cons (_, ys) -> 1 + (length_int_list ys)
;;

let insert_head xs x =
  match xs with
    Empty -> Cons (x, Empty)
  | Cons (_, _) -> Cons (x, xs)
;;

