(** Type des couleurs. *)



type couleur = int * int * int  (** rouge, vert, bleu *)

(** Tous les entiers doivent être entre 0 et 255. *)



(** Fonctions utilitaires. *)


let norm n = min 255 (max 0 n)


let mult_teinte_float coeff (r,v,b) = (int_of_float((float_of_int(r) *. coeff)) mod 255, int_of_float((float_of_int(v) *. coeff)) mod 255, int_of_float((float_of_int(b) *. coeff)) mod 255)
