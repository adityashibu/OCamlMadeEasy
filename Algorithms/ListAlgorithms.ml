let rec insertionSort lst = 
  let rec insert x lst = 
    match lst with 
    | [] -> [x]
    | h :: t -> if x <= h then x :: h :: t else h :: insert x t in 
  match lst with 
  | [] -> []
  | h :: t -> insert h (insertionSort t);;

let rec bubbleSort lst =
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
  