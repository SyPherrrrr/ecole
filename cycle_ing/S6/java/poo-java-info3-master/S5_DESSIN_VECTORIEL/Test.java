import javax.swing.* ;
import java.awt.* ;


class MaFenetre extends JFrame {
    MaFenetre(Figure f){
	setSize(500,500);
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

	MaFenetre fen = new MaFenetre(new BoldFigure(new BasicStroke((float) 3), new Cercle(0, 0, 200, 200), new Cercle(0, 0, 100, 100),
            new Rectangle(100, 100, 200, 200)) {
    }) ;
	fen.setVisible(true);
	fen.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

    }
    
}
