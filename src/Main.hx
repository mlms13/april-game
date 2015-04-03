import game.Game;

import pixi.core.display.Container;
import pixi.core.renderers.Detector;
import pixi.core.renderers.SystemRenderer;
import js.Browser;

class Main {
  public static function main() {
    var stage = new Container();
    var renderer : SystemRenderer = Detector.autoDetectRenderer(Config.width, Config.height, {
      antialias: true,
      resolution: 1,
      transparent: false
    });
    Browser.document.body.appendChild(renderer.view);
    
    var game = new Game(stage, renderer);
    game.start();
  }
}