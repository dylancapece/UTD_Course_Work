/*
*/
import sprites.utils.*;
import sprites.maths.*;
import sprites.*;

// Game Configuration Varaibles
int monsterCols = 10;
int monsterRows = 5;
long mmCounter = 0;
int mmStep = 1;
double upRadians = 4.71238898;

// Game Operational Variables
Sprite ship;
Sprite monster;
Sprite monsters[][] = new Sprite[monsterCols][monsterRows];
Sprite rocket;
Sprite flyingMonster;

KeyboardController kbController = new KeyboardController(this);
StopWatch stopWatch = new StopWatch();

void setup() 
{
  // register the function (pre) that will be called
  // by Processing before the draw() function.
  registerMethod("pre", this);

  size(700, 500);
  frameRate(50);
  
  buildSprites();
  
  resetMonsters();

}

void buildSprites()
{
  // The Ship
  ship = buildShip();

  // The Grid Monsters 
  buildMonsterGrid();
  // The Rocket
  rocket = buildRocket();

  // Additional sprites are added as game development progresses.
}

void fireRocket() 
{
  if (rocket.isDead() && !ship.isDead()) 
  {
    rocket.setPos(ship.getPos());
    rocket.setSpeed(350, upRadians);
    rocket.setDead(false);
  }
}


Sprite buildShip()
{
  Sprite ship = new Sprite(this, "ship.png", 50);
  ship.setXY(width/2, height - 30);
  ship.setVelXY(0.0f, 0);
  ship.setScale(.75);
  // Domain keeps the moving sprite withing specific screen area 
  ship.setDomain(0, height-ship.getHeight(), width, height, Sprite.HALT);
  
  return ship;
}
Sprite buildRocket()
{
  Sprite rocket = new Sprite(this, "rocket.png", 30);
  rocket.setScale(.5);
  rocket.setDead(true);
  return rocket;
}


// Populate the monsters grid 
void buildMonsterGrid() 
{
  for (int idx = 0; idx < monsterCols; idx++ ) {
    for (int idy = 0; idy < monsterRows; idy++ ) {
      monsters[idx][idy] = buildMonster();
    }
  }
}

// Build individual monster
Sprite buildMonster() 
{
  Sprite monster = new Sprite(this, "monster.png", 30);
  monster.setScale(.5);
  monster.setDead(false);

  return monster;
}

// Reset the monster grid along with the inital monster's 
// positions and direction of movement.
void resetMonsters() 
{
  for (int idx = 0; idx < monsterCols; idx++ ) {
    for (int idy = 0; idy < monsterRows; idy++ ) {
      Sprite monster = monsters[idx][idy];
      double mwidth = monster.getWidth() + 20;
      double totalWidth = mwidth * monsterCols;
      double start = (width - totalWidth)/2 - 25;
      double mheight = monster.getHeight();  
      monster.setXY((idx*mwidth)+start, (idy*mheight)+50);
      // Re-enable monsters that were previously marked dead.
      monster.setDead(false);
    }
  }
  mmCounter = 0;
  mmStep = 1;
}

void stopRocket() 
{
  rocket.setSpeed(0, upRadians);
  rocket.setDead(true);
}


// Executed before draw() is called 
public void pre() 
{
    checkKeys();

  if (!rocket.isDead() && !rocket.isOnScreem())
  {
  stopRocket();
  }

  processCollisions();
  moveMonsters();
  S4P.updateSprites(stopWatch.getElapsedTime());
  
  if(pickNonDeadMonster() == null)
    resetMonsters();
   
double fmRightAngle = 0.3490; // 20 degrees
double fmLeftAngle = 2.79253; // 160 degrees
double fmSpeed = 150;

  
  // Add new flying monster if none exist
  Sprite flyingMonster = null;
  
if (flyingMonster == null) {
  flyingMonster = pickNonDeadMonster();
  if (flyingMonster == null) {
    resetMonsters();
    flyingMonster = pickNonDeadMonster();
  } 
  double direction = (int(random(2)) == 1) ? fmRightAngle : fmLeftAngle;
  flyingMonster.setSpeed(fmSpeed, direction);
  // Domain keeps the moving sprite withing specific screen area 
  flyingMonster.setDomain(0, 0, width, height+100, Sprite.REBOUND);
    // If flying monster is off screen
  if(flyingMonster != null && !flyingMonster.isOnScreem()) {
    flyingMonster.setDead(true);
    flyingMonster = null;
  }

}


} 

void checkKeys() 
{
  if (focused) { // Is game window in focus?
    if (kbController.isLeft()) {
      ship.setX(ship.getX()-10);
    }
    if (kbController.isRight()) {
      ship.setX(ship.getX()+10);
    }
    if (kbController.isSpace()) {
      // fireRocket is implemented in Phase 2
      fireRocket();
    }
  }

}

void moveMonsters() 
{
  // Reverse the direction of the monster grid movement
  if ((++mmCounter % 100) == 0) mmStep *= -1;

  // Move Grid Monsters
  for (int idx = 0; idx < monsterCols; idx++ ) {
    for (int idy = 0; idy < monsterRows; idy++ ) {
      Sprite monster = monsters[idx][idy];
      if (!monster.isDead() && monster != flyingMonster) {
        monster.setXY(monster.getX()+mmStep, monster.getY());
      }
    }
  }
    // Move Flying Monster
  
    float difficultity = 150;
  if (flyingMonster != null) {
    if (int(random(difficultity)) == 1) {
      // Change FM Speed
      double newSpeed = flyingMonster.getSpeed() + random(-40,40);
      flyingMonster.setSpeed(newSpeed);
      // Reverse FM direction.
      double fmRightAngle = 2.78253;
      double fmLeftAngle = 0.3490;
      if(flyingMonster.getDirection() == fmRightAngle) 
        flyingMonster.setDirection(fmLeftAngle);
      else
        flyingMonster.setDirection(fmRightAngle);
    }
  }


}

// Detect collisions between game pieces
void processCollisions() 
{
  for (int i = 0; i < monsters.length; i++)
  {
    for (int j = 0; j < monsters[i].length; j++)
    {
       Sprite monster = monsters[i][j];
       if (!monster.isDead() && !rocket.isDead() && rocket.bb_collision(monster)) {
       monster.setDead(true);
       rocket.setDead(true);
    }
  }
}
}
//Pick the first monster on the grid that is not dead
//Return null if they are all dead
Sprite pickNonDeadMonster() 
{
  for (int idy = monsterRows; idy > 0; idy-- ) {
    for (int idx = monsterCols; idx > 0; idx-- ) {
      Sprite monster = monsters[idx-1][idy-1];
      if (!monster.isDead()) {
        return monster;
      }
    }
  }
  return null;
}

public void draw() 
{
  background(0);
  S4P.drawSprites();
}