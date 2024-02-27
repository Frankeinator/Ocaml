(*
   Alex Franke
   Midterm takehome
*)

   (*player = X -- CPU = O -- Hole = H*)
type cell = X | O | H | Empty;;
type board = cell array array;;


let empty_board n =
  Array.make_matrix n n Empty
;;

let print_cell cell =
  match cell with
  | X -> print_string "X"
  | O -> print_string "O"
  | H -> print_string "@"
  | Empty -> print_string " "
;;

let print_row row =
  Array.iteri (fun i cell ->
      print_cell cell;
      if i < Array.length row - 1 then
        print_string "|";
    ) row;
  print_newline ()
;;

let print_divider size =
  for i = 1 to size do
    print_string (if i < size then "-+" else "-")
  done;
  print_newline ()
;;

let print_board size board =
  Array.iteri (fun i row ->
      print_row row;
      if i < Array.length board - 1 then print_divider size
    ) board

;;      

(*Check for tie*)
let is_full board =
  Array.for_all (fun row -> Array.for_all (fun cell -> cell <> Empty) row) board;;

(*
  Copy board for looking ahead for player_next_move_check
  So that program can place pieces without messing up
  the play board
*)
let copy_board board =
  Array.map Array.copy board
;;

(*Check all ways to win and return true/false*)
let has_won player board =
  let size = Array.length board in

  let check_row row =
    Array.for_all (fun cell -> cell = player) row
  in

  let check_column col =
    Array.for_all (fun row -> row.(col) = player) board
  in

  let check_diagonals () =
    let fDiag = Array.init size (fun i -> board.(i).(i)) in
    let bDiag = Array.init size (fun i -> board.(i).(size - 1 - i)) in
    check_row fDiag || check_row bDiag
  in
  let check_all_rows = Array.exists check_row board in
  let check_all_columns = Array.exists check_column (Array.init size (fun i -> i)) in
  let check_all_diags = check_diagonals () in
  check_all_columns || check_all_diags || check_all_rows
;;

(*Assign player char to x, y coordinate*)
let make_move player x y board =
  (board.(x).(y) <- player; board)
;;

(*Next 3 functions are for cpu looking ahead at human moves*)
let rec fake_move x y player board =
  if x >= 0 && x < Array.length board && y >= 0 && y < Array.length board && board.(x).(y) = Empty then
    make_move player x y board
  else
    board
;;

let fake_win player board =
  if has_won player board then
    true
  else
    false
;;

(*Function to look one step ahead and see if the player will win*)
let player_next_move_check player board =
  let boardCopy = copy_board board in
  let rec helper x y =
    if x = Array.length boardCopy then
      (false, -1, -1)
    else if y = Array.length boardCopy then
      helper (x + 1) 0
    else
      let new_board = fake_move x y X boardCopy in
      if fake_win X new_board then
        (true, x, y)
      else
        helper x (y+1)
  in
  helper 0 0
;;


let rec human_turn board =
  print_string "row: ";
  let x = read_int () in
  print_string "col: ";
  let y = read_int () in
  if (x >= 0 && x < (Array.length board) && y >= 0 && y < (Array.length board)) && board.(x).(y) = Empty then
    make_move X x y board
  else
    (
      print_endline "Invalid input. Try again.";
      human_turn board;
    )
;;

let rec cpu_best_move board size =
  (* Manual CPU control for testing
     
  print_endline "~~CPU~~";
  print_string "row: ";
  let x = read_int () in
  print_string "col: ";
  let y = read_int () in
  if (x >= 0 && x < (Array.length board) && y >= 0 && y < (Array.length board)) && board.(x).(y) = Empty then
    make_move O x y board
  else
    (
      print_endline "Invalid input. Try again.";
      cpu_best_move board;
    )
    *)

  (*
     I think this works.
     It appears to be working in my testing.
   *)
  let rx = Random.int size in
  let ry = Random.int size in
  let (found, x, y) = player_next_move_check X board in
  if found && board.(x).(y) = Empty then
    make_move O x y board
  else if (rx >= 0 && rx < (Array.length board) && ry >= 0 && ry < (Array.length board)) && board.(rx).(ry) = Empty then
    make_move O rx ry board
  else
    cpu_best_move board size
;;

let winCheck size board =
  if has_won X board then(
    print_endline "You win!";
    print_board size board;
    exit 0;
  )
  else if has_won O board then(
    print_endline "CPU wins!";
    print_board size board;
    exit 0;
  )
  else if is_full board then(
    print_endline "It's a draw!";
    print_board size board;
    exit 0;
)
;;
    

let rec game_loop board size =
  print_board size board;
  winCheck size board;
  let hBoard = human_turn board in
  winCheck size board;
  let cpuBoard = cpu_best_move hBoard size in
  game_loop cpuBoard size
;;

let rec getSize () =
  let n = read_int () in
  if n < 3 then begin
    print_endline "Size has to be 3 or more. Input again: ";
    getSize ()
  end else
    n
;;

let rec makeHoles board =
  let x = read_int () in
  if x = -1 then
    board
  else
    let y = read_int () in
    if y = -1 then
      board
    else
      begin
        if (x >= 0 && x < (Array.length board) && y >= 0 && y < (Array.length board)) then
          let newBoard = make_move H x y board in
          makeHoles newBoard;
        else
          begin
            print_endline "Invalid input. Try again.";
            makeHoles board;
          end
      end
;;      
    
    
(*Gets size, makes the board, then inserts holes, if any are inputted*)
let main () =
  let n = getSize () in
  let initial_board = empty_board n in
  let hole_board = makeHoles initial_board in
  game_loop hole_board n
;;

main ();;
