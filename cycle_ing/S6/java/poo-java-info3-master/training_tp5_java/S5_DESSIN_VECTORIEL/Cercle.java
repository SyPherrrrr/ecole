import java.awt.*;

public class Cercle implements Figure{

    int x;
    int y;

    int h;
    int l;

    Cercle(int x, int y, int h, int l) {
        this.x = x;
        this.y = y;
        this.h = h;
        this.l = l;
    }

    //Utiliser @Override dans les classes implémentant l'interface pour indiquer que vous fournissez une implémentation
    // de la méthode définie dans l'interface.
    @Override
    public void draw(Graphics2D g) {
        g.drawOval(x,y,h,l);
    }


}

