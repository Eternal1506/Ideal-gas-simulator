class Simulation { // class that runs the simulation
  
  int number_of_particles;
  float temperature;
  float compression;
  ArrayList<Particle> par = new ArrayList<Particle>();
  Container cont;

  
 
  
  Simulation(){
   
    this.cont = new Container (this.temperature, this. compression);

    
  }
  
    void add_particles (int n) { // add/removes particle based on the user's interaction
    
  
    this.number_of_particles = n-this.par.size();
    
    if (this.number_of_particles < 0){ // removes particles
      
      for( int i = 0; i < abs(this.number_of_particles)+1; i++){
        try {
        this.par.remove(i);
        }
        catch (Exception  e){}
      }
      
    }
    
    else{ // adds particles
      for( int i = 0; i < this.number_of_particles; i++) {
        PVector posi = new PVector( random(0,width), random(this.cont.bar_start+10,height));
        PVector velo = new PVector( random(-2,2), random(-2,2));
        velo = velo.normalize().mult(this.temperature/10 +0.1);
       
        Particle p = new Particle( posi, velo, 20);
        
        this.par.add(p);
        
      }
    }
  }
  
  void temperature_change( float t ){ // changes the speed of the particles when the temperature changes
    this.temperature = t;

    this.temperature = t/10 + 0.1;
    
    for (Particle p: this.par) {
      
      p.vel = p.vel.normalize().mult(this.temperature);

    }
    
  }
  
  void compression_change( float c ) { // Changes the volumne
   
    this.cont.vol_change( c );
    
  }
  
  void check_all_collisions() { // checks all collisions that might happen

   
    for ( Particle p1 : this.par) {

      
      for ( Particle p2 : this.par) {
        
        if (p1.pos == p2.pos) { // checks if p1 and p2 refer to the same particle
          continue;
        }

        p1.check_par_collision(p2);
          
      }
      
      p1.collision_with_walls();
      this.cont.check_collisions(p1);
      
    }
  }
  
  void start_simulation() { // updates everything and runs the simulation
    
    check_all_collisions();
   
    for ( int i = 0 ; i < this.par.size(); i++) {
      
      this.par.get(i).update();
      
    }
    
    this.cont.update();
    
    
  }

}
