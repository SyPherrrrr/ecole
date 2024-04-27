public class Main {

    // Méthode main pour éxecuter le main
    public static void main(String[] args) {

        Systeme systeme = new Systeme();
        CarteBancaire cb = new CarteBancaire(1234, 1023, 667);
        Utilisateur moi = systeme.newUtilisateur( "Elias", cb);

        System.out.println(moi);


    }



}
