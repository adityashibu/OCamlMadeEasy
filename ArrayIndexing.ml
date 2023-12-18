type 'a place = 
  | Place of 'a list * 'a list
  | List of 'a list;;

exception IndexOutofBounds

let getPlace (List (xs)) n =
  let rec splitAtIndex n acc lst = 
    match n, lst with 
    | 0, _ -> (List.rev acc, lst)
    | _, [] -> raise IndexOutofBounds
    | n, h :: t -> splitAtIndex (n - 1) (h :: acc) t 
  in 
    if n < 0 || n > List.length xs then 
      raise IndexOutofBounds
    else 
      let left, right = splitAtIndex n [] xs in 
      Place (left, right);;

let collapse (Place (before, after)) = 
  List (List.append before after)

let isStart (Place (before, _) : 'a place) = 
  List.length before == 0;;

let isEnd (Place (_, after) : 'a place) = 
  List.length after == 0;;

let next (Place (before, after) : 'a place) = 
  match List.rev before with 
  | [] -> raise IndexOutofBounds 
  | h :: t -> Place (List.rev t, h :: after);;

let lookup (Place (_, after) : 'a place) = 
  match after with 
  | [] -> raise IndexOutofBounds
  | h :: t -> h;;

let delete (Place (before, after) : 'a place) = 
  match after with 
  | [] -> raise IndexOutofBounds 
  | _ :: t -> (before, t);;

let insert x (Place (before, after) : 'a place) = 
  (List.append before [x], after);;

