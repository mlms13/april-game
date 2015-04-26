package game.systems;

import edge.ISystem;
import edge.Entity;
import edge.pixi.components.Position;
import edge.pixi.cosystems.MouseSystem;
import edge.pixi.components.Display;
import pixi.core.display.Container;

import game.components.*;

class MouseSetDestination extends MouseSystem implements ISystem {
  public function new(stage : Container) {
    super(stage);
  }

  var entity : Entity;
  public function update(s : Selected) {
    if (!firstDown) return;

    var mouseTileX = x / Config.tileWidth;
    var mouseTileY = y / Config.tileHeight;

    entity.add(new Destination(mouseTileX, mouseTileY));
  }
}
