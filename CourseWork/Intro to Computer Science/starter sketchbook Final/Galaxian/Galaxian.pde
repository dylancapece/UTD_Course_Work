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

// Game Operational Variables
Sprite ship;
Sprite monster;
Sprite monsters[][] = new Sprite[monsterCols][monsterRows];

KeyboardController kbController = new KeyboardController(this);
StopWatch stopWatch = new StopWatch();

void setup() 
{
  // Code Goes Here
}

void buildSprites()
{
  // The Ship
  ship = buildShip();

  // The Grid Monsters 
  buildMonsterGrid();

  // Additional sprites are added as game development progresses.
}

Sprite buildShip()
{
  // Code Goes Here
  return ship;
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
  // Code Goes Here
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

// Executed before draw() is called 
public void pre() 
{
  // Code Goes Here
} 

void checkKeys() 
{
  // Code Goes Here
}

void moveMonsters() 
{
  // Code Goes Here
}

// Detect collisions between game pieces
void processCollisions() 
{
  // Implemented in future releases.
}

public void draw() 
{
  // Code Goes Here.
}