class Container { // Container object // this objects contains all the particles
  
  float temp;
  float comp;
  ArrayList<Particle> par = new ArrayList<Particle>();
  float bar_start;

  Container( float t, float c ) {
   
    this.temp = t;
    this.comp = c;
    this.bar_start = 0;
    
  }
  
  void update() { // updates the compression bar
    
    noStroke();
    fill(100);
    rect( 0, this.bar_start-20, float(width), this.bar_start);
    
    
  }
  
  void vol_change(float new_vol) { // changes the volume of the container depending upon the user's interactions
    
    this.comp = new_vol;
    this.bar_start = (this.comp/100) * 0.7* height;

    
  }
  
  void check_collisions(Particle p) { // checks collisons with the compression bar
      
    if(p.pos.y - p.size/2 - this.bar_start <= 0){
      p.vel.y *= -1;
      
      if(p.pos.y - p.size/2 < this.bar_start) {  // Prevents the particle from being stuck in the walls 
        p.pos.y =  this.bar_start+10;
      }
      
      else {
        p.pos.y = this.bar_start+20 - p.size/2 - 1;

      }
    }
  }
}
