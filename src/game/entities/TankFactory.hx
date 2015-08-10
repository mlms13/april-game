package game.entities;

import edge.World;
import edge.pixi.components.Display;
import edge.pixi.components.Rotation;
import edge.pixi.components.RotationVelocity;
import game.components.*;

class TankFactory {
  public static function createTank(world : World, x : Float, y : Float) {
    var sprite = Display.fromImagePath('assets/tank.png', 0.5, 0.5);
    sprite.node.x = x;
    sprite.node.y = y;
    world.engine.create([
      sprite,
      new Rotation(0),
      new RotationVelocity(Math.PI / 2),
      new MaxSpeed(3),
      new Selectable()
    ]);
  }
}
