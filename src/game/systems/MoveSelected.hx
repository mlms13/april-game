package game.systems;

import edge.ISystem;
import game.components.Selected;
import game.components.Display;

class MoveSelected implements ISystem {
  public function new() {
  }

  public function update(s : Selected, d : Display) {
    d.sprite.alpha = 1;
  }
}
