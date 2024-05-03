import java.util.HashMap;
import java.util.List;

public class Carte {

    HashMap<String, List<Pair>> hashmap ;

    Carte(HashMap<String, List<Pair>> hashmap) {
        this.hashmap = hashmap;
    }

    @Override
    public String toString() {
        return hashmap.toString();
    }





}
