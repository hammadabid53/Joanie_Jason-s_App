import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class loginscreencontroller extends GetxController {
  bool _ishidee = false;

  bool get ishidee => _ishidee;

  void isSelected() {
    _ishidee = !ishidee;
    update();
  }


  
}
