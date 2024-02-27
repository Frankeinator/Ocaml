(*int binary tree*)

type int_btree = Empty
                        (*key, left, right*)
              | Node of (int * int_btree * int_btree)
;;
let n2 = Node (2, Empty, Empty);;
let n3 = Node (3, Empty, Empty);;
let n4 = Node (4, Empty, Empty);;
let n1 = Node (1, n3, n4);;
let n2 = Node (0, n2, n1);;


let rec leftmost = fun t ->
  match t with
    Node (left, right) -> leftmost left
  | Leaf x -> x
;;

let rec inorder = fun b ->
  match b with
    Node (left, right) -> (inorder left) @ (inorder right)
  | Leaf x -> [x]
;;

let rec find = fun t -> fun v ->
  match t with
    Empty -> Empty
  | Node (x, left, right) ->
    if x = v then t
    else
      let a = find left v
          in
          match a with
          Empty -> find right v
        | _ -> a
;;

let rec same_tree n0 n1 =
  match (n0, n1) with
    (Empty, Empty) -> true
  | (Node (k0, l0, r0), Node (k1, l1, r1)) ->
    (k0 = k1) && (same_tree l0 l1) && (same_tree r0  r1)
;;


type numeric = Int of int
             | Float of float
;;


let (+) x y = match x, y with
    Int x, Int y -> Int (x + y)
  | Float x, Int y -> Float (x +. (float_of_int y))
  | Float x, Float y -> Float (x +. y)
  | Int x, Float y -> Float ((float_of_int x) +. y)
;;

type
  e = A of int | B of f
and
  f = C of float | D of e
;;

let x = B (C 3.1415);;
let y = B (D (A 3));;
let x = B (D (B (C 2.718)));;

type
  state = Alive | Dead
and
  person = Warrior of (string * state * weapon)
         | Magician of (string * state * power)
and
  weapon = None | Axe | Knife | Sword | Spear
and
  power = CanHypnotize of person list
        | CanCombust of person list
        | CanPowderize of weapon list
;;

let john = Warrior ("John", Alive, None);;
let gandalf = Magician ("Gandalf", Alive, CanCombust [john]);;
          
