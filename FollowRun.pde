player player = new player();
ArrayList<Obstacles> floors = new ArrayList<Obstacles>();
public int safe,count = 0;
void setup(){
  size(800,500);
   for (int i = 0; i <= 20 ; i++){
   floors.add(new Obstacles(i));
 }
}

void draw(){
  background(0,0,0);
  
  //update();
 // player.makeFloors();
 if(!player.dead){
 if(frameCount % 100 == 0){
    player.createFollowers();
  }

 for(int j = floors.size()-1 ; j >= 0 ; j--){
   floors.get(j).show();
   if(floors.get(j).x < (- floors.get(j).breite) - 10){
     print("Removed Floor");
     floors.remove(j);
   }
 }
 
 for(int j = floors.size()-1; j >= 0; j--){
   player.update(floors.get(j)); 
   
 }
 
 
 for(int c = 0 ; c < player.follower.size(); c++){
   if(player.follower.get(c).follower){
     this.count += 1;
   }
 }
 safe = this.count;
 this.count = 0;
 textSize(30);
 fill(255);
 text(safe,width/2,height/2);
 player.updateFollowers();
 player.show();
 } } 
void keyPressed(){
  if(key == CODED){
    if(keyCode == SHIFT){
      player.jump();
      player.jumpTime = millis();
    }
    
  }
}
  void update(){
    /*
   if(player.y + player.a >= floor.y){
     player.y = floor.y - player.a;
   }
   */
  }
  
