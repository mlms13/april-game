package game.entities;

import edge.World;
import game.components.*;

class TankFactory {
  public static function createTank(world : World, x : Float, y : Float) {
    world.engine.create([
      new Display('assets/tank.png'),
      new Position(x, y)
    ]);
  }
}
