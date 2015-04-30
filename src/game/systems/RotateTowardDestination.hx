package game.systems;

import edge.ISystem;
import edge.pixi.components.Position;
import edge.pixi.components.Rotation;
import edge.pixi.components.RotationVelocity;
import game.components.*;

class RotateTowardDestination implements ISystem {
  public function new() { }

  var timeDelta : Float;
  public function update(s : Selected, p : Position, r : Rotation, rv : RotationVelocity, dest : Destination) {
    // calculate difference between current angle and the angle to destination
    var destAngle = Math.atan2(dest.y - p.y, dest.x - p.x),
        rotationStep = rv.dangle * timeDelta / 1000,
        difference = Math.atan2(Math.sin(destAngle - r.angle), Math.cos(destAngle - r.angle));

    r.angle += Math.abs(difference) < rotationStep ? difference : rotationStep * (difference < 0 ? -1 : 1);
  }
}
