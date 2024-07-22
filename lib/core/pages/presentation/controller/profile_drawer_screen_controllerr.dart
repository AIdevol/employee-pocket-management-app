import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileDrawerScreenControllerr extends GetxController with SingleGetTickerProviderMixin {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController regionController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  late AnimationController animationController;
  late Animation<Offset> animation;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    animation = Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset(0.0, 0.0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInToLinear,
      ),
    );
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    roleController.dispose();
    emailController.dispose();
    regionController.dispose();
    dobController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }
}
