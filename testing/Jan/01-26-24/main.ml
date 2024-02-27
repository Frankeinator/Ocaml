let rec factorial = fun n ->
  if n = 0 then
    1
  else
   n * factorial (n - 1)
;;

let rec fib = fun n ->
  if n = 0 then
    1
  else
    if n = 1 then
      1
    else if n > 1 then
      fib (n - 1) + fib (n - 2)
    else
      0
;;
  

