import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class updatepasscontroller extends GetxController {
  RxBool isShow = false.obs;

  bool _isshow = false;

  bool _isshow2 = false;
  bool _isshow3 = false;

  bool get isshow => _isshow;
  bool get isshow2 => _isshow2;
  bool get isshow3 => _isshow3;
  void isSelected() {
    _isshow = !isshow;
    update();
  }

  void isSelected2() {
    _isshow2 = !isshow2;
    update();
  }

  void isSelected3() {
    _isshow3 = !isshow3;
    update();
  }
}
