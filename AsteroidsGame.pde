
SpaceShip yato;
Star[] starfield;
Bullet gami;
ArrayList<Bullet> armada = new ArrayList<Bullet>(); 
ArrayList<Asteroid> soMany = new ArrayList<Asteroid>();
//your variable declarations here
public void setup() 
{
  size(1000, 750);
  yato =new SpaceShip();
  starfield = new Star[1000];
  for(int i=0; i<1000;i++){
    starfield[i] = new Star();
  }

  for (int i= 0; i<(int)(Math.random()*10+10); i++) {

    soMany.add(new Asteroid());
    
  }
  
}
public void draw() 
{
  background(0);
  yato.show();
  yato.move();
  

  for(int i=0; i<1000;i++){
   starfield[i].show();
   starfield[i].move();
  }

  for(int i=0; i<soMany.size();i++){
    soMany.get(i).show();
    soMany.get(i).move();
      
    
  }
  for(int a=0; a<armada.size();a++){
    armada.get(a).show();
    armada.get(a).move();
    if(armada.get(a).getX()>1000||armada.get(a).getX()<0){
      armada.remove(a);
    }
    if(armada.get(a).getY()>750||armada.get(a).getY()<0){
      armada.remove(a);
    }
    for(int i=0;i<soMany.size();i++){

      if(dist(soMany.get(i).getX(),soMany.get(i).getY(),armada.get(a).getX(),armada.get(a).getY())<10){
      soMany.remove(i);
      break;  
      }

    }

  }
  
}

public void keyPressed(){

  if(key == CODED){
    if(keyCode == UP){yato.accelerate(0.9);}
    if(keyCode == DOWN){yato.accelerate(-0.9);}
    if(keyCode == LEFT){yato.rotate(-5);}
    if(keyCode == RIGHT){yato.rotate(5);}

 }
 if(key == ENTER){ 
  yato.setX((int)((Math.random())*1001)); 
  yato.getX();
  yato.setY((int)((Math.random())*1001));
  yato.getY();

}

if(key == ' '){
    armada.add(new Bullet(yato));
}

}
public void keyReleased() {

  yato.setDirectionX(0);
  yato.setDirectionY(0);
}

class SpaceShip extends Floater  
{   


  public SpaceShip() {
    
    //corners
    corners = 43;
    int[] xS = {53,50,-9,-10,-10,-8,-6,-7,-9,-11,-12,-14,-15,-16,-18,-19,-21,-23,-25,-20,-20,-23,-23,-20,-20,-25,-23,-21,-19,-18,-16,-15,-14,-12,-11,-9,-7,-6,-8,-10,-10,-9,50};
    int[] yS = {0 ,2 ,2 ,1  ,3  ,5 ,3 ,6 ,6 ,4  ,1  , 1 , 2 , 1 , 1 , 4 , 6 , 6 , 3 , 3 , 1 , 1 ,-1 ,-1 ,-3 ,-3 ,-6 ,-6 ,-4 ,-1 ,-1 ,-2 ,-1 ,-1 ,-4 ,-6,-6,-3,-5,-3 ,-1 ,-2,-2}; 
    xCorners = xS; 
    yCorners = yS;

    //color
    myColor = color(255,255,128);
    //myCenter
    myCenterX = 500;
    myCenterY = 375;
    //myDirection
    myPointDirection= 270;
    myDirectionX = 0;
    myDirectionY =0;

  }
  public void setX(int x){myCenterX=x;}  
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY=y;}   
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX = x;}   
  public double getDirectionX(){return myDirectionX;}   
  public void setDirectionY(double y){myDirectionY = y;}   
  public double getDirectionY(){return myDirectionY;}   
  public void setPointDirection(int degrees){myPointDirection = degrees;}   
  public double getPointDirection(){return myPointDirection;}

  

}

class Star
{
  private double sX,sY,sTheta,sSpeed;
  private int sWH;
 
  public Star(){
    sX=500;
    sY=375;
    sTheta= Math.random()*2*Math.PI;
    sSpeed= 8;
    sWH= 1;

  }

  public void show(){


    noStroke();
    fill(255);
    ellipse((float)sX,(float) sY, sWH, sWH);

  }

  public void move(){

    sX = sX+ Math.cos(sTheta)*sSpeed;
    sY = sY+ Math.sin(sTheta)*sSpeed;
    if(sX>1000||sX<0){
      sX=500;
    }
    if(sY>750||sY<0){
      sY=375;
    }
  }
}

class Asteroid extends Floater{

  private int aRotation;
  public Asteroid(){

    corners=4;
    int[] xS ={5,-15,-5,15};
    int[] xY ={5,15,-5,-15};
    xCorners = xS;
    yCorners = xY;

    myColor = color(227,16,41);

    myCenterX =500;
    myCenterY =375;
    if(Math.random()<0.25){
      myCenterX = Math.random()*201;  
    }

    else if(Math.random()<0.5){
      myCenterX = Math.random()*201+800;   
    }
    else if(Math.random()<0.75){
      myCenterY = Math.random()*151;
    }
        
    else if (Math.random()<1){
      myCenterY = Math.random()*151+600;
    }
   
    myPointDirection =0;
    myDirectionX = Math.random()*5-2.5;
    myDirectionY = Math.random()*5-2.5;

    aRotation = (int)(Math.random()*15)-7;

  }

  public void setX(int x){myCenterX=x;}  
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY=y;}   
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX = x;}   
  public double getDirectionX(){return myDirectionX;}   
  public void setDirectionY(double y){myDirectionY = y;}   
  public double getDirectionY(){return myDirectionY;}   
  public void setPointDirection(int degrees){myPointDirection = degrees;}   
  public double getPointDirection(){return myPointDirection;}

  public void move(){

    rotate(aRotation);
    super.move();
      
    }
}

class Bullet extends Floater{

private double dRadians; 

public Bullet(SpaceShip yato){

 

  corners=8;
  int[] xS ={0,2,3, 2, 0,-2,-3,-2};
  int[] xY ={3,2,0,-2,-3,-2, 0, 2};
  xCorners = xS;
  yCorners = xY;

  myColor = color(212,254,255);

  myCenterX = yato.getX();
  myCenterY = yato.getY();
    
  myPointDirection =yato.getPointDirection();
  dRadians =myPointDirection*(Math.PI/180);

  myDirectionX = yato.getDirectionX()+(5 *Math.cos(dRadians));
  myDirectionY = yato.getDirectionY()+(5 *Math.sin(dRadians));

  }

public void show () 
   { 
    noStroke();
    fill(myColor);            
    ellipse((int)myCenterX,(int)myCenterY, 8,8);
    
    fill(240,255,255,50);
    ellipse((int)myCenterX,(int)myCenterY,15,15);
   }  

  public void setX(int x){myCenterX=x;}  
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY=y;}   
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX = x;}   
  public double getDirectionX(){return myDirectionX;}   
  public void setDirectionY(double y){myDirectionY = y;}   
  public double getDirectionY(){return myDirectionY;}   
  public void setPointDirection(int degrees){myPointDirection = degrees;}   
  public double getPointDirection(){return myPointDirection;} 


}


abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

