import java.util.ArrayList;

public class Systeme {
    ArrayList<Utilisateur> ListUtilisateurs;
    private static int id; // Variable de classe avec static

    Systeme() {
        this.ListUtilisateurs = new ArrayList<Utilisateur>();
        id = 0;
    }

    public Utilisateur newUtilisateur(String nom, CarteBancaire num_cb){
        Utilisateur newUser = new Utilisateur(id, nom,num_cb);
        id++; // incrémentation automatique de l'id pour avoir un id par utilisateur
        return newUser;
    }


}
