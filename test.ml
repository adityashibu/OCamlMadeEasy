open OUnit2
open ArrayIndexandAlgos

(* Custom printer for a tuple of lists *)
let print_tuple_of_lists (before, after) =
  "([ " ^ String.concat "; " (List.map string_of_int before) ^ " ], [ " ^
  String.concat "; " (List.map string_of_int after) ^ " ])"

  let print_list lst =
    "[ " ^ String.concat "; " (List.map string_of_int lst) ^ " ]"

let arrayindexing = "test suite for listAlgorithms" >::: [
  "getPlace1" >:: (fun _ ->
    assert_equal ~printer:print_tuple_of_lists ([1;2], [3;4]) (getPlace [1;2;3;4] 2)
  );
  "getPlace2" >:: (fun _ ->
    assert_equal ~printer:print_tuple_of_lists ([1;2;3], [4]) (getPlace [1;2;3;4] 3)
  );
  "getPlace-Insert-Collapse" >:: (fun _ ->
    assert_equal ~printer:print_list ([1;2]) (getPlace [] 0 |> insert 1 |> insert 2 |> collapse)
  );
  "isStart1" >:: (fun _ ->
    assert_equal ~printer:string_of_bool (true) (getPlace [1;2;3;4] 0 |> isStart)
  );
  "isStart2" >:: (fun _ ->
    assert_equal ~printer:string_of_bool (false) (getPlace [1;2;3;4] 4 |> isStart)
  );
  "isEnd1" >:: (fun _ ->
    assert_equal ~printer:string_of_bool (true) (getPlace [1;2;3;4] 4 |> isEnd)
  );
  "isEnd2" >:: (fun _ ->
    assert_equal ~printer:string_of_bool (false) (getPlace [1;2;3;4] 0 |> isEnd)
  );
  "lookup1" >:: (fun _ ->
    assert_equal ~printer:string_of_int (3) (getPlace [1;2;3;4] 2 |> lookup)
  );
  "lookup2" >:: (fun _ ->
    assert_equal ~printer:string_of_int (2) (getPlace [1;2;3;4] 1 |> lookup)
  );
  "delete1" >:: (fun _ ->
    assert_equal ~printer:print_tuple_of_lists ([1;2], [4]) (getPlace [1;2;3;4] 2 |> delete)
  );
  "lookup2" >:: (fun _ ->
    assert_equal ~printer:print_tuple_of_lists ([1], [3;4]) (getPlace [1;2;3;4] 1 |> delete)
  );
]

let listalgo = "test suite for list algorithms" >::: [
  "insertionSort1" >:: (fun _ ->
    assert_equal ~printer:print_list ([1;2;3;4;5]) (insertionSort [5;2;1;4;3])
  );
  "insertionSort2" >:: (fun _ ->
    assert_equal ~printer:print_list ([-2;-1;0;1;2]) (insertionSort [0;1;-1;-2;2])
  );
  "bubbleSort1" >:: (fun _ ->
    assert_equal ~printer:print_list ([1;2;3;4;5]) (bubbleSort [5;2;1;4;3])
  );
  "bubbleSort2" >:: (fun _ ->
    assert_equal ~printer:print_list ([-2;-1;0;1;2]) (bubbleSort [0;1;-1;-2;2])
  );
  "mergeSort1" >:: (fun _ ->
    assert_equal ~printer:print_list ([1;2;3;4;5]) (mergeSort [5;2;1;4;3])
  );
  "mergeSort2" >:: (fun _ ->
    assert_equal ~printer:print_list ([-2;-1;0;1;2]) (mergeSort [0;1;-1;-2;2])
  );
]

let _ = run_test_tt_main arrayindexing
let _ = run_test_tt_main listalgo
