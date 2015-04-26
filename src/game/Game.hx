package game;

import edge.World;
import edge.Engine;
import edge.pixi.components.Position;
import edge.pixi.components.Display;
import edge.pixi.systems.UpdateRotation;
import pixi.core.display.Container;
import pixi.core.renderers.SystemRenderer;

import game.components.*;
import game.entities.*;
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
          Display.fromImagePath('assets/grass.png'),
          new Position(i, j)
        ]);
      }
    }

    world.engine.create([
      Display.fromImagePath('assets/base.png'),
      new Position(Config.xTiles - 2, Config.yTiles -2)
    ]);

    TankFactory.createTank(world, 2, 2);

    world.physics.add(new MouseSelect(stage));
    world.physics.add(new MouseSetDestination(stage));
    world.render.add(new DrawPosition(stage));
    world.render.add(new PixiRenderer(stage, renderer));
    world.render.add(new RotateTowardDestination());
    world.render.add(new MoveForward());
    world.render.add(new UpdateRotation());
  }

  public function start() {
    world.start();
  }
}
