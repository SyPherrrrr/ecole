import java.awt.*;
import java.util.ArrayList;
import java.util.Arrays;

 public class ColoredFigure extends  Decorateur implements Figure {

    ArrayList<Figure> figures;
    Color color ;

    ColoredFigure(Color c, Figure ... figure) {
        super(figure);
        this.color = c;
    }

    public void draw(Graphics2D g) {
        g.setColor(color);
        for (Figure figure : figures) {
            figure.draw(g);
        }
    }



}
