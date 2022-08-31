import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class signupscreencontroller extends GetxController {
  bool _ishide = false;

  bool _ishide2 = false;

  bool get ishide => _ishide;
  bool get ishide2 => _ishide2;
  void isSelected() {
    _ishide = !ishide;
    update();
  }

  void isSelected2() {
    _ishide2 = !ishide2;
    update();
  }
}
