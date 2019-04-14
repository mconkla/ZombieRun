class player{
  ArrayList<follower> follower = new ArrayList<follower>();
  public int jumpTime = 0;
  public boolean jump = false;
  public boolean ground = true;
  public boolean dead = false;
  PImage player;
  Obstacles floor;
  float a = 60;
  float x = 120;
  float y = 50;

        final public float gravity = 0.6;
        final public float beschleunigung = 0.9;
        public float speed = 2;
      
  void show(){
    player = loadImage("player.png");
    update(this.floor);
    move();
    image(player,this.x,this.y,a,a);
    //rect(this.x,this.y,a,a);
  }
  
  void move(){
    
    this.speed += this.gravity; //Speed addiert mit Gravitationskonstante
    this.speed *= this.beschleunigung; //Speed multipliziert mit beschleunigunskonstante
    this.y += speed; //Y-Position mit Speed addiert
    
  }
  
  void update(Obstacles floor){
    this.floor = floor;
    if(this.y + a  > floor.y && this.x > floor.x && this.x + a < floor.x + floor.breite && this.x < floor.x + floor.breite){
      this.y = floor.y - a ;
      //print("Can JUmp");
      this.ground = true;
      this.jump = false;
    }
    else if(this.y > floor.y + floor.hoehe)
  {
    this.dead = true;
    
  }
    else if (this.y + a < this.floor.y - 1){
     this.ground = false;
      this.jump = true;
    }
   
  }
  
  void jump(){
    print(this.ground);
    if(this.ground){
      this.speed -= 40;
      this.jump = true;
      this.ground = false;
      
    }else{
      this.ground = true;
      jump = false;
    }
  }
  
  void updateFollowers(){
    for(int j = follower.size()-1; j >= 0 ;j--){
      follower.get(j).show(this.x,this.y,this.a,j,jumpTime,jump,ground,this.floor);
      if(follower.get(j).x < 0 || follower.get(j).dead){
        follower.remove(j);
      }
    }
    
  }
  void createFollowers(){
    follower.add(new follower(this.x + 300,height - 100));
  }

  
}
  
  
  
  
