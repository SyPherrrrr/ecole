import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


public class Test {
    public static void main(String[] args) {

        HashMap<String, List<Pair>> hashmap = new HashMap<>();

        // Remplissage hashmap
        List<Pair> nantesList = new ArrayList<>();
        nantesList.add(new Pair("Rennes", 1.05));
        nantesList.add(new Pair("Angers", 0.95));
        nantesList.add(new Pair("Poitiers", 2.1));
        hashmap.put("Nantes", nantesList);

        List<Pair> brestList = new ArrayList<>();
        brestList.add(new Pair("Rennes", 2.4));
        hashmap.put("Brest", brestList);

        List<Pair> rennesList = new ArrayList<>();
        rennesList.add(new Pair("Brest", 2.4));
        rennesList.add(new Pair("Le Mans", 0.9));
        rennesList.add(new Pair("Rouen", 2.8));
        rennesList.add(new Pair("Nantes", 1.05));
        hashmap.put("Rennes", rennesList);

        List<Pair> rouenList = new ArrayList<>();
        rouenList.add(new Pair("Paris", 1.2));
        rouenList.add(new Pair("Le Mans", 1.9));
        rouenList.add(new Pair("Rennes", 2.8));
        hashmap.put("Rouen", rouenList);

        List<Pair> parisList = new ArrayList<>();
        parisList.add(new Pair("Rouen", 1.2));
        parisList.add(new Pair("Le Mans", 1.8));
        hashmap.put("Paris", parisList);


        List<Pair> leMansList = new ArrayList<>();
        leMansList.add(new Pair("Paris", 1.8));
        leMansList.add(new Pair("Rouen", 1.9));
        leMansList.add(new Pair("Rennes", 0.9));
        leMansList.add(new Pair("Angers", 0.95));
        leMansList.add(new Pair("Tours", 1.1));
        hashmap.put("Le Mans", leMansList);

        List<Pair> angersList = new ArrayList<>();
        angersList.add(new Pair("Le Mans", 0.95));
        angersList.add(new Pair("Tours", 1.2));
        angersList.add(new Pair("Nantes", 0.95));
        hashmap.put("Angers", angersList);

        List<Pair> toursList = new ArrayList<>();
        toursList.add(new Pair("Angers", 1.2));
        toursList.add(new Pair("Le Mans", 1.1));
        toursList.add(new Pair("Poitiers", 0.8));
        hashmap.put("Tours", toursList);

        List<Pair> poitiersList = new ArrayList<>();
        poitiersList.add(new Pair("Tours", 0.8));
        poitiersList.add(new Pair("Nantes", 2.1));
        hashmap.put("Poitiers", poitiersList);


        // Carte initiale
        Carte carte = new Carte(hashmap);


        // Test copie de carte
        Carte cpy_carte = carte.getCopy();

        // Test d'égalité entre copie et carte initiale
        System.out.println("Test d'égalité avec == :");
        System.out.println(carte==cpy_carte);
        System.out.println("Test d'égalité avec nouveau equals :");
        System.out.println(carte.equals(cpy_carte));

        // Modification de la copie
        List<Pair> LyonList = new ArrayList<>();
        LyonList.add(new Pair("Nantes", 1.2));
        cpy_carte.addCity("Lyon", LyonList);
        cpy_carte.delCity("Nantes");

        // Test d'égalité après modification de la copie
        System.out.println("Test d'égalité après modification :");
        System.out.println(carte.equals(cpy_carte));

        System.out.println(carte);
        System.out.println(cpy_carte);



        // Test du chemin entre 2 villes
        String depart = "Nantes";
        String arrivee = "Le Mans";

        List<String> chemin = carte.trouverChemin(depart,arrivee);
        String chemin_="";
        for (String city : chemin) {
            chemin_ = chemin_ + "=>" + city;
        }
        chemin_ = chemin_.substring(2);
        System.out.println("Chemin entre " + depart + " et " + arrivee + " : " + chemin_);

    }
}
