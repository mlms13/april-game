package game.systems;

import edge.Entity;
import edge.ISystem;
import edge.pixi.components.Position;
import edge.pixi.components.DisplaySprite;
import pixi.core.renderers.SystemRenderer;
import pixi.core.display.Container;

class DrawPosition implements ISystem {
  var stage : Container;

  public function new(stage : Container) {
    this.stage = stage;
  }

  public function updateAdded(e : Entity, data : { d : DisplaySprite}) {
    stage.addChild(data.d.sprite);
    data.d.sprite.alpha = 0.8;
  }

  public function updateRemoved(e : Entity, data : { d : DisplaySprite}) {
    stage.removeChild(data.d.sprite);
  }

  public function update(d : DisplaySprite, p : Position) {
    d.sprite.x = p.x * Config.tileWidth;
    d.sprite.y = p.y * Config.tileWidth;

    // d.sprite.scale.x = d.flipX ? -1 : 1;
    // d.sprite.scale.y = d.flipY ? -1 : 1;
  }
}
