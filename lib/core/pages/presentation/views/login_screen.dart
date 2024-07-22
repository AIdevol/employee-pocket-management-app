import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weboapp_pocket/constants/images_constants.dart';
import 'package:weboapp_pocket/core/home/views/home_screen.dart';
import 'package:weboapp_pocket/core/pages/presentation/controller/login_screen_controller.dart';
import 'package:weboapp_pocket/core/component/checkbox.dart';
import 'package:weboapp_pocket/core/pages/presentation/views/profile_drawer_screen.dart';
import 'package:weboapp_pocket/core/pages/presentation/views/register_screen.dart';
import 'package:weboapp_pocket/utilities/custom_text_form_field.dart';
import 'package:gap/gap.dart';
// import 'terms_and_conditions.dart'; // Import the terms and conditions widget

class LoginScreen extends GetView<LoginScreenController> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildLoginView(context),
    );
  }

  Widget _buildLoginView(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Image.asset(
            appIcon,
            scale: 1,
            height: 300,
            width: 300,
          ),
          const Gap(20),
          Expanded(
            child: Container(
              width: 500,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 200, 217, 219),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _aboutSection(context),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomTextFormField(
                              controller: _usernameController,
                              labelText: 'Username',
                              hintText: 'Enter your username',
                              maxLines:
                                  null, // Allows the text field to grow with content
                              expands: true, // Makes the
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a username';
                                }
                                return null;
                              },
                            ),
                            const Gap(20),
                            CustomTextFormField(
                              controller: _passwordController,
                              labelText: 'Password',
                              hintText: 'Enter your password',
                              maxLines:
                                  null, // Allows the text field to grow with content
                              expands: true, // Makes thes
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a password';
                                }
                                return null;
                              },
                            ),
                            // const Gap(20),
                            _buildsignUpView(context),
                            const Gap(20),
                            Obx(() {
                              final controller =
                                  Get.find<LoginScreenController>();
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(380, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: controller.isAccepted.value
                                    ? () {
                                        if (_formKey.currentState!.validate()) {
                                          Get.snackbar(
                                            'Login',
                                            'Successfully logged in',
                                            snackPosition: SnackPosition.BOTTOM,
                                          );
                                          Get.offAll(() => HomeScreen());
                                        }
                                      }
                                    : null,
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Quicksand_bold'),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _aboutSection(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Column(
        children: [
          Gap(10),
          Text(
            'Login',
            style: TextStyle(
                fontSize: 35,
                fontFamily: 'Quicksand_bold',
                fontWeight: FontWeight.bold),
          ),
          Gap(10),
          Text(
            'Enter Your assigned Email form to the company',
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'Quicksand_Regular',
            ),
          )
        ],
      ),
    );
  }

  Widget _buildsignUpView(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TermsAndConditions(),
        InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => ProfileDrawerScreen(),
            );
          },
          child: const Text('Register Account',
              style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'Quicksand_bold',
                  color: Colors.blueAccent)),
        )
      ],
    );
  }
}
