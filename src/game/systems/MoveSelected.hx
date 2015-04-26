package game.systems;

import edge.ISystem;
import edge.pixi.components.Display;
import edge.pixi.components.Position;
import edge.pixi.components.Rotation;
import game.components.*;

class MoveSelected implements ISystem {
  public function new() {
  }

  var timeDelta : Float;

  public function update(s : Selected, d : Display, p : Position, r : Rotation, m : MaxSpeed, t : Target) {
    d.node.alpha = 1;

    // this is a dirty hack to allow a reasonable threshold of accuracy,
    // otherwise the tank flips back and forth, never reaching the target
    if (Math.abs(p.x - t.x) < 0.05 && Math.abs(p.y - t.y) < 0.05) return;

    r.angle = Math.atan2(t.y - p.y, t.x - p.x);

    var speedThisFrame = m.speed * timeDelta / 1000;
    var stepX = Math.cos(r.angle) * speedThisFrame;
    var stepY = Math.sin(r.angle) * speedThisFrame;

    p.x += stepX;
    p.y += stepY;
  }
}
