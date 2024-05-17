import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


public class Test {
    public static void main(String[] args) {

        Pair pair = new Pair("Rennes", 2.4);
        System.out.println(pair); // Affiche : Ville: Rennes, Distance: 2.4

        HashMap<String, List<Pair>> hashmap = new HashMap<>();

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

            


        Carte carte = new Carte(hashmap);
        System.out.println(carte);


    }
}
