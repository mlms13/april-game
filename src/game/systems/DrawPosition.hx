package game.systems;

import edge.Entity;
import edge.ISystem;
import pixi.core.renderers.SystemRenderer;
import pixi.core.display.Container;
import game.components.Display;
import game.components.Position;

class DrawPosition implements ISystem {
  var stage : Container;

  public function new(stage : Container) {
    this.stage = stage;
  }

  public function updateAdded(e : Entity, data : { d : Display}) {
    stage.addChild(data.d.sprite);
    data.d.sprite.alpha = 0.8;
  }

  public function updateRemoved(e : Entity, data : { d : Display}) {
    stage.removeChild(data.d.sprite);
  }

  public function update(d : Display, p : Position) {
    d.sprite.x = p.x;
    d.sprite.y = p.y;

    d.sprite.scale.x = d.flipX ? -1 : 1;
    d.sprite.scale.y = d.flipY ? -1 : 1;
  }
}
