package game.components;

import edge.IComponent;

class Dimensions implements IComponent {
  var width : Float;
  var height : Float;

  public function new(width : Float, height : Float) {
    this.width = width;
    this.height = height;
  }
}
