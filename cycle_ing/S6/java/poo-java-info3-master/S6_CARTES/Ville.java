import java.io.Serializable ;

// La classe implémente l'interface Serializable, ce qui permet aux instances de Ville d'être sérialisées.
// La sérialisation est le processus de conversion d'un objet en un flux de bytes pour qu'il puisse être stocké dans un fichier ou transmis sur un réseau.
class Ville implements Serializable {
   
   static int compteur = 1 ;

   // Index unique qui est automatiquement incrémenter pour chaque instance de classe
   int index ;
   String name ;
   
   Ville(String _name){
      name = _name ;
      index = compteur ;
      compteur ++ ;
   }
   
   @Override
   public String toString(){ return name + "(" + index + ")" ; }
   
}
