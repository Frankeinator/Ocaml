let rec inclist = fun list -> match list with
    [] -> []
  | x::xs -> (x+1)::(inclist xs)
;;

let rec map = fun f -> fun list ->
  match list with
    []->[]
  | x :: xs -> (f x)::(map f xs)
;;

let inc = fun x -> x + 1;;
let dec = fun x -> x - 1;;
let double = fun x -> x + x;;

let inclist = fun list -> (map inc list);;
let declist = fun list -> (map dec list);;
let doublelist = fun list -> (map double list);;
