import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class changepasswordcontroller extends GetxController {
  bool _ishidden = false;

  bool _ishidden2 = false;

  bool get ishidden => _ishidden;
  bool get ishidden2 => _ishidden2;
  void setisSelected() {
    _ishidden = !ishidden;
    update();
  }

  void setisSelected2() {
    _ishidden2 = !ishidden2;
    update();
  }
}
