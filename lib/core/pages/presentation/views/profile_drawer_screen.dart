import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:weboapp_pocket/constants/images_constants.dart';
import 'package:weboapp_pocket/core/pages/presentation/controller/profile_drawer_screen_controllerr.dart';
import 'package:weboapp_pocket/utilities/custom_text_form_field.dart';

class ProfileDrawerScreen extends GetView<ProfileDrawerScreenControllerr> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileDrawerScreenControllerr>();

    return SlideTransition(
      position: controller.animation,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          height: double.infinity,
          color: const Color.fromARGB(255, 200, 217, 219),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _ProfileSelectorAvatar(context: context),
                    const Gap(40),
                    _detailSection(context: context),
                    const Gap(20),
                    _emailView(context: context),
                    const Gap(20),
                    _profileIntro(context: context),
                    const Gap(20),
                    _regionStateAndDetails(context: context),
                    const Gap(20),
                    _phoneView(context: context),
                    const Gap(20),
                    _addressView(context: context),
                    const Gap(20),
                    _elevatedButton(context: context)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _ProfileSelectorAvatar({required BuildContext context}) {
    return CircleAvatar(
      backgroundImage: AssetImage(appIcon),
      backgroundColor: Colors.cyan,
      radius: 60,
    );
  }

  Widget _detailSection({required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 160,
          height: 50,
          child: CustomTextFormField(
            maxLines: null,
            expands: true,
            controller: controller.firstNameController,
            labelText: 'First Name',
            hintText: 'First Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your first name';
              }
              return null;
            },
          ),
        ),
        Gap(20),
        SizedBox(
          width: 160,
          height: 50,
          child: CustomTextFormField(
            maxLines: null,
            expands: true,
            controller: controller.lastNameController,
            labelText: 'Last Name',
            hintText: 'Last Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your last name';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _profileIntro({required BuildContext context}) {
    return SizedBox(
      width: 340,
      height: 50,
      child: CustomTextFormField(
        maxLines: null,
        expands: true,
        controller: controller.roleController,
        labelText: 'Role in Company',
        hintText: 'Role',
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your role';
          }
          return null;
        },
      ),
    );
  }

  Widget _emailView({required BuildContext context}) {
    return SizedBox(
      width: 340,
      height: 50,
      child: CustomTextFormField(
        controller: controller.emailController,
        labelText: 'Email',
        hintText: 'Email',
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email';
          }
          return null;
        },
        maxLines: null,
        expands: true,
      ),
    );
  }

  Widget _regionStateAndDetails({required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 160,
          height: 50,
          child: CustomTextFormField(
            maxLines: null,
            expands: true,
            controller: controller.regionController,
            labelText: 'Region',
            hintText: 'Region',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your region';
              }
              return null;
            },
          ),
        ),
        Gap(20),
        SizedBox(
          width: 160,
          height: 50,
          child: CustomTextFormField(
            maxLines: null,
            expands: true,
            controller: controller.dobController,
            labelText: 'Dob',
            hintText: 'Dob',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your date of birth';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _phoneView({required BuildContext context}) {
    return SizedBox(
      width: 340,
      height: 50,
      child: CustomTextFormField(
        maxLines: null,
        expands: true,
        controller: controller.phoneController,
        labelText: 'Phone',
        hintText: 'Phone',
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your phone number';
          }
          return null;
        },
      ),
    );
  }

  Widget _addressView({required BuildContext context}) {
    return SizedBox(
      width: 340,
      height: 50,
      child: CustomTextFormField(
        maxLines: null,
        expands: true,
        controller: controller.addressController,
        labelText: 'Address',
        hintText: 'Address',
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your address';
          }
          return null;
        },
      ),
    );
  }

  Widget _elevatedButton({required BuildContext context}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(340, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          // Handle form submission
        }
      },
      child: Text("Update"),
    );
  }
}
