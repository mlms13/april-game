package game;

import edge.World;
import edge.Engine;
import pixi.core.display.Container;
import pixi.core.renderers.SystemRenderer;

import game.components.*;
import game.systems.*;

class Game {
  var stage : Container;
  var renderer : SystemRenderer;
  var world : World;

  public function new(stage : Container, renderer : SystemRenderer) {
    this.stage = stage;
    this.renderer = renderer;
    world = new World(40);

    // TODO: load a map here instead...
    for (i in 0...Config.xTiles) {
      for (j in 0...Config.yTiles) {
        world.engine.create([
          new Display("assets/grass.png"),
          new Position(i, j)
        ]);
      }
    }

    world.physics.add(new MouseInteraction(stage));
    world.render.add(new DrawPosition(stage));
    world.render.add(new PixiRenderer(stage, renderer));
  }

  public function start() {
    world.start();
  }
}
