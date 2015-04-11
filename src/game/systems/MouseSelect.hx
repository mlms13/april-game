package game.systems;

import edge.ISystem;
import edge.Entity;
import pixi.core.display.Container;
import pixi.core.utils.EventData;
import pixi.core.math.Point;

import edge.cosystem.PixiMouse;
import game.components.*;

class MouseSelect extends PixiMouse implements ISystem {
  var clickedThisFrame : Bool;

  public function new(stage : Container) {
    super(stage);
  }

  public function before() {
    clickedThisFrame = firstDown;
  }

  var entity : Entity;

  public function update(s : Selectable, p : Position, dis : Display) {
    if (!clickedThisFrame) return;

    var mouseTileX = coords.x / Config.tileWidth;
    var mouseTileY = coords.y / Config.tileHeight;

    // only handle clicks the first time the mouse is down
    if (mouseTileX >= p.x && mouseTileX <= p.x + 1 &&
        mouseTileY >= p.y && mouseTileY <= p.y + 1) {
      if (entity.existsType("game.components.Selected")) {
        entity.removeType(Selected);
      } else {
        entity.add(new Selected());
      }
    }
  }
}
