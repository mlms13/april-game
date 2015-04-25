package game.systems;

import edge.ISystem;
import edge.Entity;
import edge.pixi.components.Position;
import edge.pixi.cosystems.MouseSystem;
import edge.pixi.components.Display;
import pixi.core.display.Container;

import game.components.*;

class MouseSetTarget extends MouseSystem implements ISystem {
  public function new(stage : Container) {
    super(stage);
  }

  var selected : edge.View<{s : Selected, target : Target}>;

  public function update() {
    if (!firstDown) return;

    var mouseTileX = x / Config.tileWidth;
    var mouseTileY = y / Config.tileHeight;

    for (unit in selected) {
      unit.data.target.x = mouseTileX;
      unit.data.target.y = mouseTileY;
    }
  }
}
