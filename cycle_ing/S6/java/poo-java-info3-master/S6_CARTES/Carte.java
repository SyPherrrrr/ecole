import java.util.*;

    // Classe qui permet de représenter une carte sous forme de disctionnaire (hashMap)


 public class Carte {

    HashMap<String, List<Pair>> hashmap ;

    Carte(HashMap<String, List<Pair>> hashmap) {
        this.hashmap = hashmap;
    }
     // méthode qui permet de voir chaque ville et ses villes voisines
     @Override
     public String toString() {

         StringBuilder sb = new StringBuilder();

         for (Map.Entry<String, List<Pair>> entry : hashmap.entrySet()) {
             String city = entry.getKey();
             List<Pair> connections = entry.getValue();
             sb.append(city).append(" -> ");
             for (Pair pair : connections) {
                 sb.append(pair.getVille()).append(" (").append(pair.getDistance()).append(" km), ");
             }
             if (!connections.isEmpty()) {
                 sb.setLength(sb.length() - 2);
             }
             sb.append("\n");
         }
         return sb.toString();
     }

    // Méthode pour ajouter une ville sur la carte
    public void addCity(String city, List<Pair> list) {
        if (hashmap.containsKey(city)) {
            System.out.println("La ville " + city + " est déjà sur la carte");
        } else {
            hashmap.put(city, list);
        }
    }

    // Méthode pour supprimer une ville de la carte
    public void delCity(String city) {
        if (hashmap.containsKey(city)) {
            hashmap.remove(city);
        } else {
            System.out.println("La ville " + city + " n'est pas sur la map");
        }
    }

    // Méthode qui permet la copie profonde d'une carte
    public Carte getCopy() {

        // Nouvelle hashmap
        HashMap<String, List<Pair>> cpy_hashmap = new HashMap<>();

        // Parours des villes de la carte
        for(String ville : hashmap.keySet()) {
            // Nouvelle liste avec tous les pairs de la ville key
            List<Pair> cpy_list = new ArrayList<>();
            for (Pair pair : hashmap.get(ville)) {
                cpy_list.add(pair.getCopy());
            }
            // Ajout de la ville et de la liste de villes à la carte
            cpy_hashmap.put(ville, cpy_list);

        }
        // Renvoyer la carte avec la hashmpa remplie
        return new Carte(cpy_hashmap);
    }

    // Méthode qui permet de faire un test d'égalité entre 2
    public boolean equals(Carte carte2) {
        // Quelques tests de base pour gagner du temps
        if (this == carte2) return true;
        if (carte2 == null) return false;
        if (hashmap.size() != carte2.hashmap.size()) return false;

        // Parcours des villes
        for (String city : hashmap.keySet()) {

            // Si la carte n'a pas la ville
            if (!carte2.hashmap.containsKey(city)) return false;

            // On compare les listes de villes avec equals (voir methode equals dans la classe Pair)
            if (!carte2.hashmap.get(city).equals(hashmap.get(city))) {
                return false;
            }
        }
        return true;
    }

    // Méthode qui permet de trouver le meilleur chemin
     public List<String> trouverChemin(String depart, String arrivee) {
         List<String> chemin = new ArrayList<>();
         // HashSet pour stocker des éléments uniques sans ordre
         Set<String> visites = new HashSet<>();

         chemin.add(depart);

         // Si dfs trouve un chemin
         if (dfs(depart, arrivee, chemin, visites)) {
             // Renvoi du chemin
             return chemin;
         }
         return null;
     }

     // Méthode privée car accessible que dans la classe Carte
     // Depth First Search : Le principe consiste à explorer les villes voisines non explorées et de renvoyer
     // le premier chemin trouvé.

     private boolean dfs(String current_city, String arrivee, List<String> chemin, Set<String> visites) {

         // Si la ville current_city est l'arrivée on a trouvé un chemin
         if (current_city.equals(arrivee)) {
             return true;
         }
         // ajouter aux villes visitées
         visites.add(current_city);
         // Si la ville de départ (ou current city) est bien dans la hashmap
         if (hashmap.containsKey(current_city)) {
             // Parcourir les voisins de la ville
             for (Pair voisin : hashmap.get(current_city)) {
                 // Si le voisin n'a jamais été visité
                 if (!visites.contains(voisin.getVille())) {
                     chemin.add(voisin.getVille());
                     if (dfs(voisin.getVille(), arrivee, chemin, visites)) {
                         return true;
                     }
                     chemin.remove(chemin.size() - 1);
                 }
             }
         }
         return false;
     }
}
