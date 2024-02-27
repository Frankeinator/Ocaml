let isEven = fun x -> if x mod 2 = 0 then true else false;;

let x = 4;;

if isEven x then
  print_string "true"
else
  print_string "false"
;;
