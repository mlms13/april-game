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
    // only handle clicks the first time the mouse is down
    if (!firstDown) return;

    var mouseTileX = x / Config.tileWidth;
    var mouseTileY = y / Config.tileHeight;

    // check to see if the click matches the coords of the sprite
    if (mouseTileX >= p.x - 0.5 && mouseTileX <= p.x + 0.5 &&
        mouseTileY >= p.y - 0.5 && mouseTileY <= p.y + 0.5) {

      if (entity.existsType(Selected)) {
        // if it's already selected, unselect
        dis.node.alpha = 0.8;
        entity.removeType(Selected);
      } else {
        // otherwise, select it
        dis.node.alpha = 1;
        entity.add(new Selected());
      }
    }
  }
}
