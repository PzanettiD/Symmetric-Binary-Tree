float angle = 180.0; //Determines a angle. 
float weight = 8; //The strokeWeight value.

void setup()
{
  size(800, 800);  //Creates a 800x800 window.
}

void draw()
{ 
   stroke(255);
   strokeWeight(weight);
   
   translate(width/2, height);
   change();
}

void branches(float len)  //Function to create the branches to the tree, requires a float argument, to set the length of the branches.
{
  line(0, 0, 0, -len);
  translate(0, -len);
  if (len > 3)
  {
    pushMatrix(); //Pushes the current transformation onto the matrix stack.
   
    strokeWeight(weight * 0.67);
    rotate(radians(angle));  //The radians function transforms degrees to radians (terms of PI), which is needed to the rotate function.
    stroke(random(0, 255), random(0, 255), random(0,255));
    branches(len * 0.67);   //Lowers the length of each following branch.
   
    popMatrix(); //Pops the current transformation off the matrix stack.
    pushMatrix();
   
    strokeWeight(weight * 0.67);
    rotate(-radians(angle));
    stroke(random(0, 255), random(0, 255), random(0,255));
    branches(len * 0.67);
   
    popMatrix();
  }
}


void change() //Function to alter the angle according to a key press.
{
  background(0);
  branches(200);
  
  textSize(40);
  fill(255);   
  text(angle, -350, -500);  //Displays the angle in degrees.
  
  if (keyPressed)
  {
     if (key == CODED)
     {
         if (keyCode == RIGHT) //If the user presses the right key.
         {
             angle *= 1.25; 
         }
         if (keyCode == LEFT) //If the user presses the left key.
         {
             angle /= 1.25;
         }
     }
  }
}
