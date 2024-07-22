import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weboapp_pocket/core/pages/presentation/controller/login_screen_controller.dart';

class TermsAndConditions extends GetView<LoginScreenController> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginScreenController());
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: controller.isAccepted.value,
                    onChanged: (bool? value) {
                      controller.setAccepted(value ?? false);
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.toggleAccepted();
                    },
                    child: Text(
                      'Terms&cond..',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
