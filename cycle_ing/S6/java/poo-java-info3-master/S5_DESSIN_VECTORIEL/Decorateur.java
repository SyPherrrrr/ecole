import java.awt.*;
import java.util.ArrayList;
import java.util.Arrays;

abstract public class Decorateur implements Figure {

    ArrayList<Figure> figures;
    public Decorateur(Figure ... figures) {
        this.figures = new ArrayList<Figure>();
        // permet d'ajouter toutes les figures en paramètres dans le tableau
        this.figures.addAll(Arrays.asList(figures));
    }


    abstract public void draw(Graphics2D g);
}
