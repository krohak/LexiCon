// our function for drawing the room.
void drawRoom () {
  stroke(255); // the color of the borders is set to white
  
  // top
  fill(255,255 - 9*(frameCount - topFade)); // if the wall was hit by the ball, it'll fade.
  beginShape(); // draw the top wall
  vertex(0.9 * -width/2,0.9 * -height/2,0);
  vertex(0.9 * -width/2,0.9 * -height/2,-depth);
  vertex(0.9 * width/2,0.9 * -height/2,-depth);
  vertex(0.9 * width/2,0.9 * -height/2,0);
  endShape(CLOSE);

  // left
  fill(255,255 - 9*(frameCount - leftFade));
  beginShape();
  vertex(0.9 * -width/2,0.9 * -height/2,0);
  vertex(0.9 * -width/2,0.9 * -height/2,-depth);
  vertex(0.9 * -width/2,0.9 * height/2,-depth);
  vertex(0.9 * -width/2,0.9 * height/2,0);
  endShape(CLOSE);
  
  // right
  fill(255,255 - 9*(frameCount - rightFade));
  beginShape();
  vertex(0.9 * width/2,0.9 * height/2,0);
  vertex(0.9 * width/2,0.9 * height/2,-depth);
  vertex(0.9 * width/2,0.9 * -height/2,-depth);
  vertex(0.9 * width/2,0.9 * -height/2,0);
  endShape(CLOSE);
  
  // bottom
  fill(255,255 - 9*(frameCount - bottomFade));
  beginShape();
  vertex(0.9 * width/2,0.9 * height/2,0);
  vertex(0.9 * width/2,0.9 * height/2,-depth);
  vertex(0.9 * -width/2,0.9 * height/2,-depth);
  vertex(0.9 * -width/2,0.9 * height/2,0);
  endShape(CLOSE);
  
  if (stopped == false) { // ball marker
    line(0.9 * -width/2,0.9 * -height/2,ball.ballPos.z-ball.radius/2, 0.9 * -width/2, 0.9 * height/2,ball.ballPos.z-ball.radius/2);
    line(0.9 * -width/2,0.9 * height/2,ball.ballPos.z-ball.radius/2, 0.9 * width/2, 0.9 * height/2,ball.ballPos.z-ball.radius/2);
    line(0.9 * width/2,0.9 * height/2,ball.ballPos.z-ball.radius/2, 0.9 * width/2, 0.9 * -height/2,ball.ballPos.z-ball.radius/2);
    line(0.9 * width/2,0.9 * -height/2,ball.ballPos.z-ball.radius/2, 0.9 * -width/2, 0.9 * -height/2,ball.ballPos.z-ball.radius/2);
  }
}
