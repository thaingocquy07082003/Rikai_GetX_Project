import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'level.dart';
class GameDemo extends FlameGame {

  @override
  Color backgroundColor() => const Color(0xFF211F30);


  late final CameraComponent cam;
  final world = Level();

  @override
  Future<void> onLoad() async {
    cam = CameraComponent.withFixedResolution(world: world, width: 680, height: 360);
    cam.viewfinder.anchor = Anchor.topLeft;
    await addAll([cam, world]);
    super.onLoad();
  }
}
