public class Freemium extends Abonnement{ // La classe Freemium hérite de la classe Abonnement
    Integer nb_ecoutees;
    int nb_max;

    Freemium() {
        this.nb_ecoutees = 0;
        this.nb_max = 3;
    }

    void ecouter(){
        if (this.nb_ecoutees < this.nb_max){

        }
    }
}
