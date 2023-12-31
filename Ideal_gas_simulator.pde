/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Info: this program simulates the behaviour of an ideal gas.
// note: changing the values too fast might cause an error in animation. This is because the weird interaction between the GUI and processing, not because of the program. 
// Program By: Pratham Chauhan

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


import g4p_controls.*; // important import

Simulation sim = new Simulation(); // creating the simulation object

void setup(){ // setting up the programs
  
  size(700, 500, JAVA2D); // changes these to make the container bigger/smaller.
  rectMode(CORNERS);
  ellipseMode(CENTER);
  createGUI();

}

void draw(){
  
  background(0);
  sim.start_simulation(); // runs the simulation
  
}
