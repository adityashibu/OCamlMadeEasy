module ArrayIndexingModule = struct
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
    | h :: t -> h

  let delete ((before, after) : 'a place) =
    match after with
    | [] -> raise IndexOutofBounds
    | _ :: t -> (before, t)

  let insert x ((before, after) : 'a place) =
    (List.append before [x], after)
end
