import java.util.Stack;

int longitudCanvas = 410;
int const_tam_lab = 20;
par objetivo;
par[] arbol = new par[longitudCanvas*longitudCanvas];
par[] paresVisitados = new par[longitudCanvas*longitudCanvas];
int[] padres = new int[longitudCanvas*longitudCanvas];
Stack<par> pila=new Stack<par>();
agenteBuscador agente;
int indiceArbolPush = 0;
int indiceArbolPop = 0;
int indiceVisitados = 0;
PImage img;




void setup(){

  size(410,410); //<>//
 frameRate(10);
  objetivo = colocar_meta();
  agente = new agenteBuscador(objetivo);
  push(agente.pos); //aqui tenemos que meter el nodo raiz del arbol que es la posicion inical del agente
   img = loadImage("laberinto1.png");  // Load the image into the program  
 
}

void draw(){
   
      
     image(img, 0, 0);
  
  boolean llegue = agente.revisarMeta(); //<>//
  

  if(llegue==false){
    
     fill(255,0,0);
    
     expandirPar(agente.pos);  //<>//
     par sigpos = pop();
     agente.pos = sigpos;
     ellipse(agente.pos.x, agente.pos.y, 20, 20);
     
     print("sigpos del agente ");
     print(agente.pos.x,agente.pos.y);
     print("\n");
  fill(255,99,255);
  rect(objetivo.x, objetivo.y, 20, 20); //<>//
    
  }else{
  
    fill(0,255,0);
    ellipse(agente.pos.x, agente.pos.y, 20, 20);
    //print("llegue a la meta");
    
  }

}


void expandirPar(par pos){
  
  
   paresVisitados[indiceVisitados] = pos;
   indiceVisitados++;

  int x1 = pos.x-const_tam_lab; //<>//
  int x2 = pos.x+const_tam_lab;
  int y1 = pos.y-const_tam_lab;
  int y2 = pos.y+const_tam_lab;
 
  par  arriba= new par(pos.x,y1);
  par abajo = new par(pos.x,y2);
  par izq = new par(x1,pos.y);
  par der = new par(x2,pos.y);
  
  if(validarPar(arriba)){
    push(arriba);
  
  }
  
    if(validarPar(abajo)){
      push(abajo);
  
  }
  
  
    if(validarPar(izq)){
      push(izq);
  
  }
  
  
    if(validarPar(der)){
      push(der);
  
  }
  
  
}

boolean validarPar(par pos){

  // print("pos validado ");
   //print(pos.x,pos.y);
   //print("\n");
  
  // print("resultado de validacion: ");
  // print( ((pos.x >= 0 ) && (pos.x <= longitudCanvas)) && ( (pos.y >= 0 ) && (pos.y <= longitudCanvas) ) && ( !noVisitado(pos)) );
   //print("\n");
  
 return ( ((pos.x >= 0 ) && (pos.x <= longitudCanvas)) && ( (pos.y >= 0 ) && (pos.y <= longitudCanvas) ) && ( !noVisitado(pos)) && (!verificar_pared(pos)));
 // return ( ((pos.x > 0 ) && (pos.x < longitudCanvas)) && ( (pos.y > 0 ) && (pos.y < longitudCanvas) ));
  

}

boolean noVisitado(par pos){

    boolean visitado = false;
    boolean resultado = false;
    
    for(int i=0;i<indiceVisitados;i++){
      
      visitado=pos.parIgual(paresVisitados[i]);
      
      if(visitado==true){
        resultado=true;
      
      }

    }
  
  return resultado;
}


void push(par pos){
   
  
  //logica para que no meta repeditos en arbol
  
  boolean enArbol = false;
  boolean control = false;
  
 for(int i=0;i<indiceArbolPush;i++){
   control=pos.parIgual(arbol[i]);
   if(control==true){
    enArbol=true;
   }
   
 }
 
 //if(enArbol==false){
  
 //    arbol[indiceArbolPush] = pos;
 //    indiceArbolPush++;
 //  }
 
 
  
 if(enArbol==false){
  
      pila.push(pos);
  }
 
 
 
   
 

}

par pop(){
  
  //indiceArbolPop++;
  //par pos = new par(arbol[indiceArbolPop].x,arbol[indiceArbolPop].y); 
  
   par pos = pila.pop();
  return pos; 

}

boolean verificar_pared(par pos){
    
  boolean soypared = false; //<>//
  
  color c = get(pos.x, pos.y);
  color camino = color(255);
  
  if(c!=camino){
    
     soypared = true;
  
  }
  
  return soypared;


}


par convertidor_a_20(par pos){

  par respuesta = new par(0,0); 
  respuesta.x = (floor(pos.x/const_tam_lab))  * const_tam_lab;
  respuesta.y = (floor(pos.y/const_tam_lab)) * const_tam_lab;

 return respuesta;

}


par colocar_meta(){

  boolean valido = false; //<>//
  int targetX; 
  int targetY; 
  par objetivo  = new par(0,0);
  
  
  //while(!valido){
  
    targetX = int(random(1, longitudCanvas-1));
    targetY = int(random(1, longitudCanvas-1));
    objetivo.x = targetX;  
    objetivo.y = targetY;
    
    objetivo = convertidor_a_20(objetivo);
    
    
  print("pos validado ");
   print(objetivo.x,objetivo.y);
   print("\n");
    
    valido =  validarPar(objetivo);
  
 // }
 
 return objetivo;

}