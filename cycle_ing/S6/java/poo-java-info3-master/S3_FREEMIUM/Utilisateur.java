import java.util.ArrayList;

public class Utilisateur {
    int id;
    String nom;
    ArrayList<String> favoris;
    Abonnement offre;
    CarteBancaire num_cb;

    public Utilisateur(int id, String nom, CarteBancaire num_cb) {
        this.id = id;
        this.nom = nom;
        this.offre = new Freemium();
        this.num_cb = num_cb;
    }



    @Override
    public String toString() {
        return ("id : %d    nom : %s".formatted(this.id, this.nom));
    }
}
