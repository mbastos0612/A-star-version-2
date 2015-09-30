
class agenteBuscador { 
  
  int xActual;
  int yActual;
  par pos;
  par objetivo;
  
  agenteBuscador(par meta){
    
    xActual = int(random(1, 400)); //<>//
    yActual = int(random(1, 400));
    pos = new par(0,0);
    objetivo = new par(meta.x,meta.y);

  } 
  

 
   boolean revisarMeta(){
   
     return objetivo.parIgual(pos);
   
   }
    
} 