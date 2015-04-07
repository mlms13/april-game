package edge.cosystem;

import pixi.core.display.Container;
import pixi.core.utils.EventData;
import pixi.core.math.Point;

class PixiMouse {
  var stage : Container;
  var coords : { x : Float, y : Float };
  var isDown : Bool;

  public function new(stage : Container) {
    this.stage = stage;
    this.stage.interactive = true;
    coords = { x : 0, y : 0 };
    isDown = false;

    this.stage.on("mousemove", mouseMove);
    this.stage.on("mousedown", mouseDown);
    this.stage.on("mouseup", mouseUp);
  }

  function mouseMove(e : EventData) {
    var pt = (e.data.global : Point);
    coords.x = pt.x;
    coords.y = pt.y;
  }

  function mouseDown(_) {
    isDown = true;
  }

  function mouseUp(_) {
    isDown = false;
  }
}
