import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'keyboard_controller.g.dart';

@riverpod
class KeypadController extends _$KeypadController {
  @override
  bool build() {
    return false;
  }

  void show() => state = true;

  void hide() => state = false;

  void toggle() => state = !state;
}