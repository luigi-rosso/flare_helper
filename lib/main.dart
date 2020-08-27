import 'dart:io';
import 'dart:typed_data';

import 'package:flare_dart/actor.dart';
import 'package:flare_dart/actor_component.dart';
import 'package:flare_dart/actor_artboard.dart';
import 'package:flare_dart/actor_layer_effect_renderer.dart';
import 'package:flare_dart/actor_inner_shadow.dart';
import 'package:flare_dart/actor_drop_shadow.dart';
import 'package:flare_dart/actor_color.dart';

class HelperColorFill extends ColorFill {
  @override
  void initializeGraphics() {}

  @override
  ActorComponent makeInstance(ActorArtboard resetArtboard) => HelperColorFill();
}

class HelperColorStroke extends ColorStroke {
  @override
  void initializeGraphics() {}

  @override
  ActorComponent makeInstance(ActorArtboard resetArtboard) =>
      HelperColorStroke();

  @override
  void markPathEffectsDirty() {}
}

class HelperGradientFill extends GradientFill {
  @override
  void initializeGraphics() {}

  @override
  ActorComponent makeInstance(ActorArtboard resetArtboard) =>
      HelperGradientFill();
}

class HelperGradientStroke extends GradientStroke {
  @override
  void initializeGraphics() {}

  @override
  ActorComponent makeInstance(ActorArtboard resetArtboard) =>
      HelperGradientStroke();

  @override
  void markPathEffectsDirty() {}
}

class HelperRadialGradientFill extends RadialGradientFill {
  @override
  void initializeGraphics() {}

  @override
  ActorComponent makeInstance(ActorArtboard resetArtboard) =>
      HelperRadialGradientFill();
}

class HelperRadialGradientStroke extends RadialGradientStroke {
  @override
  void initializeGraphics() {}

  @override
  ActorComponent makeInstance(ActorArtboard resetArtboard) =>
      HelperRadialGradientStroke();

  @override
  void markPathEffectsDirty() {}
}

class HelperActor extends Actor {
  @override
  Future<bool> loadAtlases(List<Uint8List> rawAtlases) async {
    return true;
  }

  @override
  ColorFill makeColorFill() => HelperColorFill();

  @override
  ColorStroke makeColorStroke() => HelperColorStroke();

  @override
  ActorDropShadow makeDropShadow() => ActorDropShadow();

  @override
  GradientFill makeGradientFill() => HelperGradientFill();

  @override
  GradientStroke makeGradientStroke() => HelperGradientStroke();

  @override
  ActorInnerShadow makeInnerShadow() => ActorInnerShadow();

  @override
  ActorLayerEffectRenderer makeLayerEffectRenderer() =>
      ActorLayerEffectRenderer();

  @override
  RadialGradientFill makeRadialFill() => HelperRadialGradientFill();

  @override
  RadialGradientStroke makeRadialStroke() => HelperRadialGradientStroke();

  @override
  Future<Uint8List> readOutOfBandAsset(String filename, context) async {
    return null;
  }
}

void main(List<String> arguments) async {
  if (arguments.length != 1) {
    print('Expected path to .flr file as only argument.');
    return;
  }
  var filename = arguments.first;
  var bytes = File(filename).readAsBytesSync();
  var actor = HelperActor();

  if (!await actor.load(ByteData.view(bytes.buffer), null)) {
    print('Failed to load $filename.');
    return;
  }
  var artboard = actor.artboard;
  if (artboard == null) {
    print('No artboard in $filename.');
    return;
  }

  print(
      'Filename $filename contains ${artboard.animations.length} animations.');
  for (final animation in artboard.animations) {
    print('  ${animation.name}');
  }
}
