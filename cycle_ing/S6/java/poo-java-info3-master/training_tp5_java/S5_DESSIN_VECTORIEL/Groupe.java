import java.awt.*;
import java.util.ArrayList;
import java.util.Arrays;

public class Groupe implements Figure {

    ArrayList<Figure> figures;

    Groupe(Figure ... figures) {
        this.figures = new ArrayList<>(Arrays.asList(figures));
    }


// Méthode plus classique de faire le constructeur d'une liste
    //Groupe(Figure ... figure) {
    //    ArrayList<Figure> figures = new ArrayList<>();
    //    for (Figure figure_ : figure) {
    //        figures.add(figure_);
    //    }
    //}


    @Override
    public void draw(Graphics2D g) {
        for (Figure f : figures){
            f.draw(g);
        }
    }
}
