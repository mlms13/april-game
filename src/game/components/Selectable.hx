package game.components;

import edge.IComponent;
import pixi.core.sprites.Sprite;

class Selectable implements IComponent {
  var x : Float;
  var y : Float;
  var width : Float;
  var height : Float;
  var sprite : Sprite;

  public function new(x : Float, y : Float, width : Float, height : Float, sprite : Sprite) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.sprite = sprite;
  }
}
