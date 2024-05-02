import java.awt.*;
import java.util.ArrayList;
import java.util.Arrays;

public class BoldFigure extends Decorateur implements Figure {

    Stroke s;

    BoldFigure(Stroke s, Figure ... figure) {
        super(figure);
        this.s = s;
    }

    public void draw(Graphics2D g) {
        g.setStroke(s);
        this.figures.forEach(figure -> figure.draw(g));
    }

}
