import java.util.Objects;

    // Classe Pair qui représente une paire ville - distance

public class Pair  {
    String ville;
    double distance;

    // Constructeur
    Pair(String ville, double distance) {
        this.ville = ville;
        this.distance = distance;
    }
    // Méthode pour afficher les attributs
    @Override
    public String toString(){
        return "Ville: " + ville + ", Distance: " + distance;
    }

    // Méthode pour avoir la ville de la pair
    public String getVille() {
        return ville;
    }

    // Méthode pour avoir la distance de la pair
    public double getDistance() {
        return distance;
    }

    // Méthode de copie profonde (création d'une nouvelle instance avec les memes attributs)
    public Pair getCopy() {
        return new Pair(ville, distance);
    }

    // Méthode qui permet de comparer l'instance 'courante' et un objet
    @Override
    public boolean equals(Object obj) {
        // voir si c'est le même objet en mémoire ou pas
        if (this == obj) return true;
        // test nullité et du type
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        // On sait que cest le meme type donc on caste (converti) l'objet en Pair
        Pair other = (Pair) obj;

        // Test d'égalité sur une chaine de caractère (villes respectives) et la différence entre les distances respectives
        return Objects.equals(ville, other.ville) && Double.compare(distance, other.distance) == 0;
    }

}
