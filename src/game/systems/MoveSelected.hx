package game.systems;

import edge.ISystem;
import game.components.Selected;
import edge.pixi.components.Display;
import edge.pixi.components.Position;

class MoveSelected implements ISystem {
  public function new() {
  }

  public function update(s : Selected, d : Display, p : Position) {
    d.sprite.alpha = 1;
    p.x += 0.01;
    p.y += 0.01;
  }
}
