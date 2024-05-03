public class Pair {
    String ville;
    double distance;

    Pair(String ville, double distance) {
        this.ville = ville;
        this.distance = distance;
    }

    @Override
    public String toString(){
        return "Ville: " + ville + ", Distance: " + distance;
    }

    public String getVille() {
        return ville;
    }

    public double getDistance() {
        return distance;
    }
}
