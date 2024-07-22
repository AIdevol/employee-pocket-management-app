import 'package:get/get.dart';
import 'package:weboapp_pocket/core/pages/presentation/binding/bingings.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    AuthBingings().dependencies();

    // Get.lazyPut<AuthBingings>(() => AuthBingings());
  }
}
