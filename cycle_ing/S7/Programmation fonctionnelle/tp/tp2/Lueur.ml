open Couleur 
open Image

(* Vous pouvez coder ici vos fonctions pour créer des lueurs *)

let distance (x1, y1) (x2, y2) = sqrt((x2 -. x1)*.(x2 -. x1) +. (y2 -. y1)*.(y2 -. y1))



(* peut etre que la couleur correspond à r,g ou b et l'intensité à la valeur  *)
let lueur couleur (x,y) =
  let distance = distance (x, y) (50, 50)
  let intensite = 1/.distance
  fun (x,y) ->  (int_of_float (x +. y) mod , , 0)
