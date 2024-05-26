import java.awt.*;
import java.util.ArrayList;

public class ColoredFigure extends Decorateur implements Figure {

    Color color;
    // quand on utilise super() ne pas mettre la déclaration de variable
    ColoredFigure(Color color, Figure ... figures) {
        super(figures);
        this.color = color;
    }

    @Override
    public void draw(Graphics2D g) {
        g.setColor(color);
        for (Figure figure : figures) {
            figure.draw(g);
        }
    }

}
