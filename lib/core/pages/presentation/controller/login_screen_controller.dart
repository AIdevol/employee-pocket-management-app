import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  RxBool isObscure = true.obs;
  RxBool isObscure2 = true.obs;
  RxBool isObscure3 = true.obs;

  var isAccepted = false.obs;

  void toggleAccepted() {
    isAccepted.value = !isAccepted.value;
  }

  void setAccepted(bool value) {
    isAccepted.value = value;
  }
}
