package game.systems;

import edge.ISystem;
import pixi.core.display.Container;
import pixi.core.utils.EventData;
import pixi.core.math.Point;

import game.components.Dimensions;
import game.components.Display;
import game.components.Position;
import game.components.Selectable;

class MouseSelect implements ISystem {
  var stage : Container;
  var mouseCoords: { x : Float, y : Float };
  var mouseIsDown : Bool;

  public function new(stage : Container) {
    this.stage = stage;
    this.stage.interactive = true;
    mouseCoords = { x : 0.0, y : 0.0 };
    mouseIsDown = false;

    this.stage.on("mousemove", mouseMove);
    this.stage.on("mousedown", mouseDown);
    this.stage.on("mouseup", mouseUp);
  }

  function mouseMove(e : EventData) {
    var pt = (e.data.global : Point);
    mouseCoords.x = pt.x;
    mouseCoords.y = pt.y;
  }

  function mouseDown(_) {
    mouseIsDown = true;
  }

  function mouseUp(_) {
    mouseIsDown = false;
  }

  public function update(s : Selectable, p : Position, dim : Dimensions, dis : Display) {
    if (!mouseIsDown) return;

    if (mouseCoords.x >= p.x && mouseCoords.x <= p.x + dim.width &&
        mouseCoords.y >= p.y && mouseCoords.y <= p.y + dim.height) {
      if (!s.isSelected) {
        s.isSelected = true;
        dis.sprite.alpha = 1;
      } else {
        s.isSelected = false;
        dis.sprite.alpha = 0.8;
      }
    }
  }
}
