class EMail {
   String id ;
   String domain ;
   String email;

   EMail(String _id, String _domain){
      this.id = _id ;
      this.domain = _domain ;
      this.email = _id + "@" + _domain;

   }

   @Override
   public int hashCode(){
      return toString().hashCode();
   }

   // Permet de vérifier si l'objet donné est un objet de type EMail
   @Override
   public boolean equals(Object obj){
       return obj instanceof EMail;
   }

   @Override
   public String toString(){
      return email;
   }

}
