package game.systems;

import edge.ISystem;
import edge.pixi.components.Position;
import edge.pixi.components.Rotation;
import game.components.*;

class MoveForward implements ISystem {
  public function new() {
  }

  var timeDelta : Float;
  var entity : edge.Entity;
  public function update(s : Selected, p : Position, r : Rotation, m : MaxSpeed, dest : Destination) {
    // remove destination when the entity has arrived. there's a threshold here
    // because otherwise the entity never exactly reaches the point
    if (Math.abs(p.x - dest.x) < 0.05 && Math.abs(p.y - dest.y) < 0.05) {
      entity.removeType(Destination);
      return;
    }

    var speedThisFrame = m.speed * timeDelta / 1000;
    var stepX = Math.cos(r.angle) * speedThisFrame;
    var stepY = Math.sin(r.angle) * speedThisFrame;

    p.x += stepX;
    p.y += stepY;
  }
}
