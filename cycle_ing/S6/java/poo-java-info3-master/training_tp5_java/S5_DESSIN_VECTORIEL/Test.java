import javax.swing.* ;
import java.awt.* ;
import java.util.ArrayList;

import static java.awt.Color.red;


class MaFenetre extends JFrame {

    MaFenetre(Figure f){
	setSize(320,200+50);
	setContentPane(new Paneau(f)) ;
    }
}




class Paneau extends JPanel {

    Figure f ;

    Paneau(Figure f){
	this.f=f ;
    }

    @Override
    public void paintComponent (Graphics g){
	if (g instanceof Graphics2D)
	    f.draw((Graphics2D) g) ;
	else throw new RuntimeException();
    }
}



class Test {

    public static void main(String[] args){

        Figure f = new Groupe(
                 new Cercle(70, 70, 100 , 100), new Rectangle(10, 10, 100 , 50));

        Figure test1 = new ColoredFigure(
                red,
                new Groupe(
                        new Cercle(70, 70, 100 , 100), new Rectangle(10, 10, 100 , 50)));


        MaFenetre fen = new MaFenetre(test1) ;
        fen.setVisible(true);
        fen.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

    }
    
}
