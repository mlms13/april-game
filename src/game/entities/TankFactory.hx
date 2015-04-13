package game.entities;

import edge.World;
import edge.pixi.components.Position;
import edge.pixi.components.DisplaySprite;
import edge.pixi.components.Rotation;
import game.components.Selectable;

class TankFactory {
  public static function createTank(world : World, x : Float, y : Float) {
    world.engine.create([
      DisplaySprite.fromImagePath('assets/tank.png'),
      new Position(x, y),
      new Rotation(0),
      new Selectable()
    ]);
  }
}
