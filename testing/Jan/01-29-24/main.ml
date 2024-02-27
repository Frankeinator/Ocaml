(*Alex Franke*)

let rec guess = fun n ->
  let _ = print_string "Enter a number: " in
  let x = read_int () in
  if x = n then
    print_string "Correct!!\n"
  else
    let _ =
      if x < n then
        print_string "Try higher...\n"
      else
        print_string "Try lower...\n"
    in
    guess n
;;

guess 42;;
