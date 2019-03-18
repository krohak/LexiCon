// All of the data and functions for the opponent is stored here.
class Opponent {
  PVector location = new PVector(); // where is their paddle
  int fade = -999; // their paddle's fade.
  // Restrict the movement along the Y axis 
  float fix_Y = 0;
  Opponent (float Y) { // This is called when the opponent is created
    // we initialize the opponent's location.
    location = new PVector(0,0,-depth);
    fix_Y = Y;
  }
  // update the opponent.
  void update () {
    if (ball.velocity.z < 0) { // we check to see if the ball is moving towards the opponent.
      float speed;
      // if the ball is close enough to the paddle's center, we just lock it on
      // this prevents the opponent from going crazy
      if (dist(location.x,location.y, ball.ballPos.x, ball.ballPos.y) < difficulty+1)
        speed = dist(location.x,location.y, ball.ballPos.x, ball.ballPos.y);
      else // otherwise, we just move at the opponent's max speed.
        speed = difficulty + 1; 
      // angle between the opponent and the ball  
      float angle = atan2(ball.ballPos.y - location.y, ball.ballPos.x - location.x);
      // move the opponent towards the ball
      location.add(speed * cos(angle), speed * sin(angle),0);
    }
    else { // if the ball isn't heading towards the opponent
      // the opponent will move towards the center.
      if (mag(location.x,location.y) > 4) {
        float angle = atan2(-location.y, -location.x);
        location.add(3 * cos(angle), 3 * sin(angle),0);
      }
    }
    pushMatrix(); // Push matrix, so translating isn't global.
      fill(255,255 - 9*(frameCount - fade)); // fade the opponent's paddle if they recently hit the paddle
      translate(
      constrain(location.x - width/10, -width/2 *0.9, width/2 *0.9 - width/5), 
      constrain(location.y - height/10, -height/2 *0.9, height/2 *0.9 - height/5), 
      location.z); // move their paddle, and make sure it stays within the box.
      rect(0,0, width/5, height/5); // draw the opponent.
    popMatrix();
  } 
}
