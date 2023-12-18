type 'a tree = 
  | Lf
  | Br of 'a * 'a tree * 'a tree;;

(* Function to calculate the total number of elements in the BST *)
let rec size t = 
  match t with 
  | Lf -> 0 
  | Br (ele, br1, br2) -> 1 + size br1 + size br2;;

(* Function calculate the height of the given BST *)
let rec depth t = 
  match t with 
  | Lf -> 0 
  | Br (ele, br1, br2) -> 
    1 + max (depth br1) (depth br2);;

(* Function for Depth first traversal in a BST *)
let rec dft t = 
  match t with 
  | Lf -> []
  | Br (ele, br1, br2) -> ele :: List.append (dft br1) (dft br2);;

(* Flatten out the BST with the root element in between *)
let rec flatten t = 
  match t with 
  | Lf -> [] 
  | Br (ele, br1, br2) -> List.append (flatten br1) (ele :: flatten br2);;

(* Function to check if a given element is part of the given BST *)
let rec member x t = 
  match t with 
  | Lf -> false 
  | Br (ele, br1, br2) -> 
    if x == ele then true 
    else if x < ele then member x br1 else member x br2;;

(* Function to insert an element into a BST *)
let rec insert x t = 
  match t with 
  | Lf -> Br (x, Lf, Lf)
  | Br (ele, br1, br2) -> 
    if x <= ele then Br (ele, insert x br1, br2)
    else Br (ele, br1, insert x br2);;

(* Function to convert a given list to a BST *)
let rec toTree lst = 
  match lst with 
  | [] -> Lf 
  | x :: xs -> insert x (toTree xs);;