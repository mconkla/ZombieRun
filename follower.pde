class follower{
  float x;
  float y;
  float a= 40;
  float movement = 3;
  float nummer;
  int wait = 50;
  int jumpTime;
  boolean ground = true;
  int jumped = 0;
  float upmove = 2;
  boolean jump = false;
  boolean follower = false;
  boolean ggground = true;
  boolean dead = false;
  PImage followerPic;
        final public float gravity = 0.4;
        final public float beschleunigung = 0.9;
        public float speed = 2;
        
       
  Obstacles floor;
        
  follower(float x,float y){
    this.x = x;
    this.y = y;
  }
  
  void show(float playersx, float playersy,float playersa,float nummer,int jumpTime,boolean jump,boolean gground,Obstacles floor){
    followerPic = loadImage("follower.png");
    this.floor = floor;
    if(gground){
      jumped = 0;
    }
    this.jump = jump;
    this.jumpTime = jumpTime;
    this.nummer = nummer;
    isfollower(playersx,playersy,playersa);
    if(this.jump && this.follower && this.ground){
     jump();
    }
    move();
    update();
    image(followerPic,this.x,this.y,a,a);
    //rect(this.x,this.y,a,a);
    
  }
  
  void isfollower(float px, float py,float pa){
    if(this.x < px + pa && this.y >= py && this.y < py + pa && this.x > px || this.x + a < px+pa && this.x + a > px && this.y + a  < py + pa && this.y > py){
      movement = 0;
      this.x = px - 20 * this.nummer;
      this.follower = true;
    }
    
  }
  
  void update(){
    if(this.y + a  > this.floor.y && this.x > this.floor.x && this.x + a < this.floor.x + this.floor.breite && this.x < this.floor.x + this.floor.breite){
      this.y = this.floor.y - a;
      this.jump = false;
      this.ground = true;
    }
     else if(this.y > floor.y + floor.hoehe)
  {
    this.dead = true;
    
  }
    else if (this.y + a< this.floor.y - 1){
     this.ground = false;
      this.jump = true;
    }
  }
  void move(){
    this.speed += this.gravity; //Speed addiert mit Gravitationskonstante
    this.speed *= this.beschleunigung; //Speed multipliziert mit beschleunigunskonstante
    this.y += speed; //Y-Position mit Speed addier
    this.x -= movement;
    
  }
  void jump(){
    if(millis() - this.jumpTime >= wait * this.nummer && this.jump && this.jumped == 0){
      jumped += 1;
      this.speed -= 30;
      this.jump = false;
      this.ground = false;
    }
  }
  
  
}
