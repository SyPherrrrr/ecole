import java.awt.*;
import java.util.ArrayList;
import java.util.Arrays;

public class Groupe implements Figure {
    ArrayList<Figure> figures;
    public Groupe(Figure ... figures) {
        this.figures = new ArrayList<Figure>();
        // permet d'ajouter toutes les figures en paramètres dans le tableau
        this.figures.addAll(Arrays.asList(figures));
    }

    @Override
    public void draw(Graphics2D g) {
        for (Figure figure : figures) {
            figure.draw(g);
        }
    }
}
