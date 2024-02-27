exception Underflow;;

type int_list =
    Empty
  | Cons of (int * int_list)
;;

let inserthead xs v = Cons (v, xs);;

let head xs = match xs with
    Empty -> raise Underflow
  | Cons (x, _) -> x
;;

let rec insertTail xs v = match xs with
    Empty -> Cons (v, Empty)
  | Cons (y, ys) -> Cons (y, insertTail (ys v))
;;

let rec tail xs = match xs with
    Empty -> raise Underflow
  | Cons (x, Empty) -> x
  | Cons (_, ys) -> tail ys
;;

let rec join xs ys = match xs with
    Empty -> ys
  | Cons(z, zs) -> Cons (z, join (zs, ys))
;;

let rec to_list xs = match xs with
    Empty -> []
  | Cons(y, ys) -> y::(to_list ys)
;;

