import jdk.jshell.execution.Util;

import java.util.* ;

class Systeme {
   Hashtable<EMail,Utilisateur> lesUtilisateurs;

   Systeme(){
      lesUtilisateurs = new Hashtable<EMail,Utilisateur>();
   }

   void payerTous(int montant){
      for (EMail email : lesUtilisateurs.keySet()){
         Utilisateur utilisateur = lesUtilisateurs.get(email);
         utilisateur.payer(montant);
      }
   }

   // récupération de l'utilisateur avec la Hashtable 
   Utilisateur get(EMail a) {
      return lesUtilisateurs.get(a);
   }

   // Ajout d'un utilisateur à Hashtable
   void AddUser(Utilisateur u){
      lesUtilisateurs.put(u.id, u);
   }
}
