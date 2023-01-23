import 'package:rive/rive.dart';

//controlador dos estados do gatilho, "componente"
class RiveUtils {
  static StateMachineController getRiveController(Artboard artboard,
      {StateMachineName = "State Machine 1"}) {
    StateMachineController? controller = StateMachineController.fromArtboard(
        artboard, StateMachineName); //nome dado pelo criador no Rive
    artboard.addController(controller!);
    return controller;
  }
}
