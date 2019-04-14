class Obstacles{
  float breite = 500;
  float hoehe = 20;
  float movement = 3;
  float x = 0;
  float y = 500 - hoehe;
  float gap = 50;
  float tilt ;
  int nummer = 0;
  Obstacles(int nummer){
    this.nummer = nummer;
   tilt = ((nummer * (breite + breite/4)) + gap);
   this.x = x + tilt;
  }
  void show(){
    //fill(255);
    move();
    fill(255,0,0);
    rect(this.x,this.y,breite,hoehe);
    
  }
  
  void move(){
    this.x -= 3;
    
  }
  
}
