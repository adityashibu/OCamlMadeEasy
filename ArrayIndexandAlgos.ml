(*ArrayIndexing Module functions*)

type 'a place = 'a list * 'a list

exception IndexOutofBounds

let getPlace xs n : 'a place =
  let rec splitAtIndex n acc lst =
    match n, lst with
    | 0, _ -> (List.rev acc, lst)
    | _, [] -> raise IndexOutofBounds
    | n, h :: t -> splitAtIndex (n - 1) (h :: acc) t
  in
  if n < 0 || n > List.length xs then
    raise IndexOutofBounds
  else
    splitAtIndex n [] xs

let collapse ((before, after) : 'a place) =
  List.append before after

let isStart ((before, _) : 'a place) =
  List.length before == 0

let isEnd ((_, after) : 'a place) =
  List.length after == 0

let next ((before, after) : 'a place) =
  match List.rev before with
  | [] -> raise IndexOutofBounds
  | h :: t -> (List.rev t, h :: after)

let lookup ((_, after) : 'a place) =
  match after with
  | [] -> raise IndexOutofBounds
  | h :: _ -> h

let delete ((before, after) : 'a place) =
  match after with
  | [] -> raise IndexOutofBounds
  | _ :: t -> (before, t)

let insert x ((before, after) : 'a place) =
  (List.append before [x], after)



(* List Algorithms Module functions *)

let insertionSort lst =
  let rec insert x sorted =
    match sorted with
    | [] -> [x]
    | h :: t -> if x <= h then x :: h :: t else h :: insert x t in
  let rec insertSortAcc unsorted sorted =
    match unsorted with
    | [] -> sorted
    | h :: t -> insertSortAcc t (insert h sorted) in
  insertSortAcc lst []

let bubbleSort lst =
  let rec iter acc = function
    | x :: y :: rest ->
      if x > y then iter (y :: acc) (x :: rest)
      else iter (x :: acc) (y :: rest)
    | last -> (List.rev acc) @ last
  in
  let rec checkswap lst =
    let sortedPass = iter [] lst in
    if sortedPass = lst then lst
    else checkswap sortedPass
  in
  checkswap lst;;

let rec mergeSort lst =
  let rec split lst =
    match lst with
    | [] -> [], []
    | [x] -> [x], []
    | x :: y :: rest ->
      let left, right = split rest in
      x :: left, y :: right
  in
  let rec merge left right =
    match left, right with
    | [], right -> right
    | left, [] -> left
    | x :: xs, y :: ys ->
      if x < y then x :: merge xs (y :: ys)
      else y :: merge (x :: xs) ys
  in
  match lst with
  | [] -> []
  | [x] -> [x]
  | _ ->
    let left, right = split lst in
    let sortedLeft = mergeSort left in
    let sortedRight = mergeSort right in
    merge sortedLeft sortedRight;;

