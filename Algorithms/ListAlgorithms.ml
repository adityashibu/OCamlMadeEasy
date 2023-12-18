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