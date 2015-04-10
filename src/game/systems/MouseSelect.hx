package game.systems;

import edge.ISystem;
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

  public function update(s : Selectable, p : Position, dis : Display) {
    if (!clickedThisFrame) return;

    var mouseTileX = coords.x / Config.tileWidth;
    var mouseTileY = coords.y / Config.tileHeight;

    // only handle clicks the first time the mouse is down
    if (mouseTileX >= p.x && mouseTileX <= p.x + 1 &&
        mouseTileY >= p.y && mouseTileY <= p.y + 1) {
      if (!s.isSelected) {
        s.isSelected = true;
        dis.sprite.alpha = 1;
      } else {
        s.isSelected = false;
        dis.sprite.alpha = 0.8;
      }
    }
  }
}
