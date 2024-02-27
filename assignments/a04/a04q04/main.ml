(*
   Alex Franke
   a04q04
*)

exception IgnoreCase;;
exception NotImplemented;;

let slice list a b c =
  let rec take n lst acc =
    match lst with
      [] -> List.rev acc
    | _ when n < a -> take (n + 1) (List.tl lst) acc
    | _ when n >= b -> List.rev acc
    | _ ->
      let rest = if c > 0 then
          let rec drop i l =
            if i = 0 then l
              else drop (i - 1) (List.tl l)
          in drop (c - 1) (List.tl lst)
        else List.tl lst
      in
      take (n + c) rest ((List.hd lst) :: acc)
  in
  take 0 list []
;;

slice [6;7;8;9] 0 2 1;;
slice [6;7;8;9] 0 3 2;;
slice [6;7;8;9] 1 3 2;;
slice [6;7;8;9] 3 1 1;;

slice [6;7;8;9] 1 100 100;;
