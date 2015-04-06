package game.components;

import edge.IComponent;
import pixi.core.sprites.Sprite;
import pixi.core.textures.Texture;

class Selectable implements IComponent {
  public var isSelected : Bool;

  public function new(?selected : Bool) {
    this.isSelected = selected == null ? false : selected;
  }
}
