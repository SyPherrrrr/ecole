import java.awt.Rectangle ;

public class Palet implements MovingObject {

  int x ;
  int y ;
  
  int vx ;
  int vy ;
  
  static int marge ;
  
  Palet(int _x, int _y, int _vx, int _vy){
    x = _x ;
    y = _y ;
    vx = _vx ;
    vy = _vy ;
    marge = 15 ;
  }
  
  static boolean sortie_x (int px){ return (px< (0+marge)) || (px>(320 - marge)) ; }
  static boolean sortie_y (int py){ return (py< (0+marge)) || (py>(200 - marge)) ; }
  
  public void deplace(){
    if ( sortie_x (x + vx) ) {
	    vx = (-1) * vx ;
    }
    else {
	    x = x + vx ;
    }
    
    if ( sortie_y (y + vy) ) {
	    vy = (-1) * vy ;
    }
    else {
	    y = y + vy ;
    }
  }
  
  public Rectangle getRect(){
    return new Rectangle(x,y,10,10);
  }
  
}
