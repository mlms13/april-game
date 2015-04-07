package game.systems;

import edge.ISystem;
import pixi.core.display.Container;
import pixi.core.utils.EventData;
import pixi.core.math.Point;

import edge.cosystem.PixiMouse;
import game.components.*;

class MouseSelect extends PixiMouse implements ISystem {
  var wasDownLastFrame : Bool;

  public function new(stage : Container) {
    super(stage);
    wasDownLastFrame = false;
  }

  public function update(s : Selectable, p : Position, dim : Dimensions, dis : Display) {
    // only handle clicks the first time the mouse is down
    if (isDown && !wasDownLastFrame) {
      if (coords.x >= p.x && coords.x <= p.x + dim.width &&
          coords.y >= p.y && coords.y <= p.y + dim.height) {
        if (!s.isSelected) {
          s.isSelected = true;
          dis.sprite.alpha = 1;
        } else {
          s.isSelected = false;
          dis.sprite.alpha = 0.8;
        }
      }
    }
    wasDownLastFrame = isDown;
  }
}
