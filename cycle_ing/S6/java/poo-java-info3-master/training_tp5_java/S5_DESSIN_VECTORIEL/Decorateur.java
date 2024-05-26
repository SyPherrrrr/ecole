import java.awt.*;
import java.util.ArrayList;
import java.util.Arrays;


// Une classe abstraite en Java est une classe qui ne peut pas être instanciée directement
// et est destinée à être sous-classée.

abstract class Decorateur implements Figure {

    ArrayList<Figure> figures;

    Decorateur(Figure ... figures) {
        this.figures = new ArrayList<>(Arrays.asList(figures));
    }


    // On met abstract pour que les sous-classes de Decorateur fournissent
    // leur propre implémentation spécifique de cette méthode
    abstract public void draw(Graphics2D g);
}
