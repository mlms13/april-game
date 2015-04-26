package game.entities;

import edge.World;
import edge.pixi.components.Position;
import edge.pixi.components.Display;
import edge.pixi.components.Rotation;
import edge.pixi.components.RotationVelocity;
import game.components.*;

class TankFactory {
  public static function createTank(world : World, x : Float, y : Float) {
    world.engine.create([
      Display.fromImagePath('assets/tank.png', 0.5, 0.5),
      new Position(x, y),
      new Rotation(0),
      new RotationVelocity(Math.PI / 6),
      new MaxSpeed(3),
      new Selectable()
    ]);
  }
}
