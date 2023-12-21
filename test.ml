open OUnit2
open ArrayModules.ArrayIndexingModule 

let tests = "test suite for arrayIndex" >::: [
  "getPlace1" >:: (fun _ -> assert_equal ([1;2], [3;4]) (getPlace [1;2;3;4] 2));
]

let _ = run_test_tt_main tests