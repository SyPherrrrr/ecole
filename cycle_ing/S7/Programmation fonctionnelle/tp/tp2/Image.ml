open Couleur ;;


(** Type des images *)

type position = float * float
type image = position -> couleur



(** Exemples d'image *)

let im_black =
  fun p -> (0, 0, 0)

let rayures = 
   fun (x,y) ->  (int_of_float (x +. y) mod 200, 200, 0)



(** Type des rectangles *)

type rectangle = { minx : float ; maxx : float ; miny : float ; maxy : float}
