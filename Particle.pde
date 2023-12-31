class Particle{ // class of particle object
  
  PVector pos;
  PVector vel;
  float size;
  color col;
  float speed;
  boolean collided;

  
  Particle( PVector p, PVector v, float s ) {
    this.pos = p;

    this.vel = v;
    this.size = s;
    this.col = color(255,0,0);
    this.collided = false;
  }
  
  
  void update() { // update the position of the particle and its color
    
    this.pos.add(this.vel);
    this.speed = vel.mag();
    this.col = getcolor(this.speed);
    
    fill(this.col);
    noStroke();
    circle(this.pos.x, this.pos.y, this.size);
    
  }
  
  void check_par_collision( Particle p ) { //checks the collision with another particle

    
    float dx = this.pos.x - p.pos.x;
    float dy = this.pos.y - p.pos.y;
    float d = sqrt(pow(dx,2) + pow(dy,2));
    

    if (d < this.size){ // changes the velocities of particles if they have collided
      float dvx = this.vel.x - p.vel.x;
      float dvy = this.vel.y - p.vel.y;
      float sin = dx/d;
      float cos =  dy/d ;
      float dr = (this.size - d) / 2;
      float dx2 = sin * dr;
      float dy2 = cos * dr;

      this.pos.x += dx2;
      this.pos.y += dy2;
      p.pos.x -= dx2;
      p.pos.y -= dy2;

      float h = (dx * dvx + dy * dvy) / d;
      float new_dvx = -h * sin ;
      float new_dvy = -h * cos; 

      this.vel.x += new_dvx;
      this.vel.y += new_dvy;
      p.vel.x -= new_dvx;
      p.vel.y -= new_dvy;
    }
  }

  
    
    void collision_with_walls(){ // checks collisions with walls
     
         
      if(dist(this.pos.x, this.pos.y, 0, this.pos.y) - this.size/2 <= 0 || dist(this.pos.x, this.pos.y, 0, this.pos.y) + this.size/2 >= width) {  // Ensures the atom bounces off the vertical walls
        this.vel.x *= -1;
        
        
        if(this.pos.x - this.size/2 < 0) { // Prevents the particle from being stuck in the walls 
          this.pos.x = this.size/2 + 1;
        }
        
        else {
          this.pos.x = width - this.size/2 - 1;
        }
      }
      
      
      if (dist(this.pos.x, this.pos.y, this.pos.x, 0) - this.size/2 <= 0 ||dist(this.pos.x, this.pos.y, this.pos.x, 0) + this.size/2 >= height) { // Ensures the atom bounces off the horizontal walls 
        this.vel.y *= -1;
        
 
        if(this.pos.y - this.size/2 < 0) { // Prevents the particle from being stuck in the walls
          this.pos.y = this.size/2 + 1;
        }
        
        else {
          this.pos.y = height - this.size/2 - 1;
        }
      }
    }

  
  private color getcolor( float s ) { //outputs a color based on the speed of the particle
    
     return color(255*s/10, 0, 255*(1 - s/10));
     
  }

}
