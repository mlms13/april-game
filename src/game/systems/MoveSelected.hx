package game.systems;

import edge.ISystem;
import game.components.Selected;
import edge.pixi.components.DisplaySprite;
import edge.pixi.components.Position;
import edge.pixi.components.Rotation;

class MoveSelected implements ISystem {
  public function new() {
  }

  public function update(s : Selected, d : DisplaySprite, p : Position, r : Rotation) {
    d.sprite.alpha = 1;
    r.angle -= 0.01;
    p.x += 0.01;
    p.y += 0.01;
  }
}
