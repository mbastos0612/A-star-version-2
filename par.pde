

class par { 
  int x, y; 
  
  par(int val1 , int val2){
    
    x = val1;
    y = val2;
  
  } 
  
  boolean parIgual(par recibido){

    
    return ( (x == recibido.x) && (y == recibido.y) );
  }
         
} 