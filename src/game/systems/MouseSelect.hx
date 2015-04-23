package game.systems;

import edge.ISystem;
import edge.Entity;
import edge.pixi.components.Position;
import edge.pixi.cosystems.MouseSystem;
import edge.pixi.components.Display;
import pixi.core.display.Container;

import game.components.*;

class MouseSelect extends MouseSystem implements ISystem {
  public function new(stage : Container) {
    super(stage);
  }

  var entity : Entity;

  public function update(s : Selectable, p : Position, dis : Display) {
    if (!firstDown) return;

    var mouseTileX = x / Config.tileWidth;
    var mouseTileY = y / Config.tileHeight;

    // only handle clicks the first time the mouse is down
    if (mouseTileX >= p.x && mouseTileX <= p.x + 1 &&
        mouseTileY >= p.y && mouseTileY <= p.y + 1) {
      if (entity.existsType(Selected)) {
        entity.removeType(Selected);
      } else {
        entity.add(new Selected());
      }
    }
  }
}
