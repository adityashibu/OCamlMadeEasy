open OUnit2
open AllFunctions

(* Custom printer for a tuple of lists *)
let print_tuple_of_lists (before, after) =
  "([ " ^ String.concat "; " (List.map string_of_int before) ^ " ], [ " ^
  String.concat "; " (List.map string_of_int after) ^ " ])"

  let print_list lst =
    "[ " ^ String.concat "; " (List.map string_of_int lst) ^ " ]"

let tests = "test suite for arrayIndex" >::: [
  "getPlace1" >:: (fun _ ->
    assert_equal ~printer:print_tuple_of_lists ([1;2], [3;4]) (getPlace [1;2;3;4] 2)
  );
  "getPlace2" >:: (fun _ ->
    assert_equal ~printer:print_tuple_of_lists ([1;2;3], [4]) (getPlace [1;2;3;4] 3)
  );
  "getPlace-Insert-Collapse" >:: (fun _ ->
    assert_equal ~printer:print_list ([1;2]) (getPlace [] 0 |> insert 1 |> insert 2 |> collapse)
  );
]

let _ = run_test_tt_main tests