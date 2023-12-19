# OCamlMadeEasy
Trying to add additional features to the language of OCaml such as array Indexing, etc

## How to clone this repository?
#### Windows:
1. Make sure you have git installed and running before continuing with the following steps
2. Open your terminal or Command prompt
3. Type in:<br>
```Shell
git clone https://github.com/adwii-iii/OCamlMadeEasy.git
```

#### MacOS:
1. Since git is usually pre installed with Mac, you can skip step one
2. Open terminal
3. Type in:<br>
```Shell
git clone https://github.com/adwii-iii/OCamlMadeEasy.git
```

## What is included in the repository?
### Algorithms
Here, I try to add algorithms that are implemented in conventional OOP programming languages

Here are some of the algorithms you can find in the algorithms folder:
1. Insertion Sort
2. Bubble Sort
3. Merge Sort

### ArrayModules
This folder contains the below files:
1. ArrayIndexing.ml
2. ArrayTuples.ml

- **Array Indexing**<br>
This file contains some basic array Indexing<br><br>
Below are the functions in this file:
1. <b>GetPlace</b><br>
Remember that this function indexes spaces before the elements and not elements themselves<br><br>
This function takes two arguments, a list and an index where you want to access the list at and splits it into a tuple of two lists, ie a list before the given index and a list after the given index<br><br>
For example:
`getPlace [1;2;3;4] 2`<br>
would give
`([1;2], [3;4])` as the output<br><br>
2. <b>Collapse</b><br>
This function takes an argument of the previously defined custom type o 'a place and then turns it back into the original list<br><br>
For example:
`getPlace [1;2;3;4] 2`<br>
would give
`([1;2], [3;4])` as the output, then passing it to collapse in such a manner: `getPlace [1;2;3;4] 2 |> collapse`<br>
would give back `[1;2;3;4;]`<br><br>
3. <b>IsStart and IsEnd</b><br>
This function takes an argument of the previously defined custom type o 'a place and then checks if the index that the user has inputted is either the starting index or if it's the ending index<br><br>
For example:
`getPlace [1;2;3;4] 0 |> isStart`<br>
would give
`True` as the output<br><br>
`getPlace [1;2;3;4] 0 |> isEnd`<br>
would give
`False` as the output<br><br>
4. <b>Next and Lookup</b><br>
Next is a function that is used to show you the list when the index is at the given user index + 1, while lookup gives the element at index + 1<br><br>
For example:
`getPlace [1;2;3;4] 2 |> next`<br>
would give
`([1;2;3], [4])` as the output<br><br>
`getPlace [1;2;3;4] 2 |> lookup`<br>
would give
`3` as the output<br><br>

