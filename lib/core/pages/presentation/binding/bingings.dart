import 'package:get/get.dart';
import 'package:weboapp_pocket/core/pages/presentation/controller/login_screen_controller.dart';
import 'package:weboapp_pocket/core/pages/presentation/controller/profile_drawer_screen_controllerr.dart';
import 'package:weboapp_pocket/core/pages/presentation/controller/update_screen_controller.dart';

class AuthBingings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginScreenController>(() => LoginScreenController());
    Get.lazyPut<ProfileDrawerScreenControllerr>(
        () => ProfileDrawerScreenControllerr());

    Get.lazyPut<UpdateScreenController>(() => UpdateScreenController());
  }
}
