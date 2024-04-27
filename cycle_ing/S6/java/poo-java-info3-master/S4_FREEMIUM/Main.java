public class Main {
    public static void main(String[] args) {

        Systeme systeme = new Systeme();


        EMail mail = new EMail("toto","yahoo.fr");
        Utilisateur tom = new Utilisateur(mail,"TOM");

        systeme.AddUser(tom);

        // Test de get qui permet de trouver un user par son mail
        System.out.println(systeme.get(mail));




    }
}
