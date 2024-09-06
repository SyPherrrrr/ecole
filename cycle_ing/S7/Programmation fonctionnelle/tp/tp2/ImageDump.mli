open Image


val print_ppm  :                rectangle -> taille:(int * int) -> Image.image -> unit
val output_ppm : out_channel -> rectangle -> taille:(int * int) -> Image.image -> unit
val write_ppm  : string      -> rectangle -> taille:(int * int) -> Image.image -> unit

val repeat : int -> int -> (int->unit) -> unit
