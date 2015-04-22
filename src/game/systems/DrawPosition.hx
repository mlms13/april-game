package game.systems;

import edge.Entity;
import edge.ISystem;
import edge.pixi.components.Position;
import edge.pixi.components.Display;
import pixi.core.renderers.SystemRenderer;
import pixi.core.display.Container;

class DrawPosition implements ISystem {
  var stage : Container;

  public function new(stage : Container) {
    this.stage = stage;
  }

  public function updateAdded(e : Entity, data : { d : Display}) {
    stage.addChild(data.d.node);
    data.d.node.alpha = 0.8;
  }

  public function updateRemoved(e : Entity, data : { d : Display}) {
    stage.removeChild(data.d.node);
  }

  public function update(d : Display, p : Position) {
    d.node.x = p.x * Config.tileWidth;
    d.node.y = p.y * Config.tileWidth;

    // d.node.scale.x = d.flipX ? -1 : 1;
    // d.node.scale.y = d.flipY ? -1 : 1;
  }
}
