package game.systems;

import edge.ISystem;
import edge.pixi.components.Display;
import edge.pixi.components.Position;
import edge.pixi.components.Rotation;
import game.components.*;

class MoveSelected implements ISystem {
  public function new() {
  }

  public function update(s : Selected, d : Display, p : Position, t : Target) {
    d.node.alpha = 1;


    p.x += 0.01 * (t.x - p.x);
    p.y += 0.01 * (t.y - p.y);
  }
}
