import oscP5.*;
import netP5.*;

//OSC Controller
OscP5 oscP5;
NetAddress myRemoteLocation;

Ball ball; // the Ball
Opponent opponent; // the Opponent

/* Fading placemarks. 
Set to frame, then the corresponding part will fade at that
frame. */
int playerFade = -999;
int topFade = -999;
int bottomFade = -999;
int leftFade = -999;
int rightFade = -999;

/* First and stopped, booleans for serving */
boolean first = true;
boolean stopped = true;

/* The distance from the player the opponent is. */
int depth = 1500;

/* Restrict the movement along the Y axis */
float fix_Y = - height;

/* Scores and difficulty */
int opponentsScore = 0;
int playerScore = 0;
int difficulty = 1;

PFont font; // font 

/* Ball position */
public float paddlePosition = 0;

void setup () { 
  size(1280, 960, P3D);

  //OSC Listen for messages
  oscP5 = new OscP5(this, 9001);
  myRemoteLocation = new NetAddress("127.0.0.1", 9001);
  
  // initialize the ball and opponent
  ball = new Ball(fix_Y);
  opponent = new Opponent(fix_Y);
  
  //load the font
  //font = loadFont("Dialog.plain-30.vlw"); 
  //textFont(font); 
  textSize(width / 35);
}
void draw () {
  // move the screen to the center
  translate(width/2,height/2); 
  // rotateZ(frameCount*0.01);
  // set the background to black (erase everything from the
  // previous screen)
  background(0);
  // Enable lights. The gives the ball its 3D apearance.
  lights();
  
  // set the fill color to white for the text.
  fill(255);
  
  // write scores, difficulty, and author's name.
  textAlign(LEFT);  
  text("Player: " + playerScore, -width/2 * 0.9,-height/2 * 0.93);
  textAlign(RIGHT);
  text("Computer: " + opponentsScore, width/2 * 0.9,-height/2 * 0.93);
  textAlign(CENTER);
  text("Difficulty: " + difficulty, 0, -height/2 * 0.93);

  
  // update the opponent. This function is in the opponent class
  opponent.update();
  
  // draw the player's paddle.
  drawPaddle();
  
  // draw the ball.
  ball.display();
  
  if (stopped == false) { // make sure the player has served already
    // update and display the ball
    ball.update(); 
    ball.display();
  }
  else { // if the player hasn't served, let them know.
    textAlign(CENTER);
    text("Click to serve.", 0,height/4); 
  }
  
  // draw the room.
  drawRoom();
}

// The function for drawing the paddle.
void drawPaddle () {
  // Set the fill to white, but transparency depending
  // on the fade variable. The farther we are from the fade time
  // the more transparent.
  fill(255, 255 - 9*(frameCount - playerFade)); 
  
  // draw the paddle. The constraints keep the paddle within the stage
//  rect(constrain(mouseX - width/2 - width/10, -width/2 *0.9, width/2 *0.9 - width/5), //@Changed
rect(constrain(paddlePosition - width/2 - width/10, -width/2 *0.9, width/2 *0.9 - width/5),
       fix_Y, 
       width/5, height/5);
}

// Restart, for when someone scores.
void restart () {
  stopped = true;
  ball = new Ball(fix_Y);
  first = true;
}

// For when the player serves
void mousePressed() {
  if(stopped) { // make sure the game hasn't started already
    stopped = false; // tell all the other functions that the game's started
  }
}

void oscEvent(OscMessage theOscMessage) {

int stimulationValue = theOscMessage.get(0).intValue(); //get value of stimulation

 if(stimulationValue == 769 && (paddlePosition-5) > -width/2.0 - width/10){ //Left
   paddlePosition -= 5;
 }
 else if(stimulationValue == 770 && (paddlePosition+5) < width/2.0){ //Right
  paddlePosition += 5;
 }
  println(paddlePosition);
}
