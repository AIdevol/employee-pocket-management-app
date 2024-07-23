import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:weboapp_pocket/constants/imageAnimation.dart';
import 'package:weboapp_pocket/constants/text_constants.dart';
import 'package:weboapp_pocket/core/pages/presentation/controller/update_screen_controller.dart';
import 'package:weboapp_pocket/utilities/calendertime_date.dart';
import 'package:weboapp_pocket/utilities/custom_text_form_field.dart';

class UpdateViewScreen extends GetView<UpdateScreenController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.70,
      width: Get.width * 0.90,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 200, 217, 219),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _imageView(),
                const Gap(20),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    text1,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Quicksand_bold',
                    ),
                  ),
                ),
                Gap(20),
                _fieldView(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _imageView() {
    return Container(
      height: 170,
      width: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blueGrey,
      ),
      child: Image.asset(
        imageAnimation,
        scale: 1,
      ),
    );
  }

  Widget _fieldView(BuildContext context) {
    final controller = Get.find<UpdateScreenController>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  right: 20,
                  left: 20,
                  bottom: 20,
                ),
                child: CustomTextFormField(
                  controller: controller.roleController,
                  maxLines: null,
                  expands: true,
                  labelText: 'Role in Company',
                  hintText: 'Role',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your role';
                    }
                    return null;
                  },
                ),
              ),
            ),
            _calendarView(context),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
            right: 20,
            left: 20,
            bottom: 20,
          ),
          child: CustomTextFormField(
            controller: controller.roleController,
            labelText: 'Write your Project Update',
            hintText: 'Enter your project update here...',
            maxLines: null,
            expands: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your project update';
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(330, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {},
            child: const Text(
              'Submit',
              style: TextStyle(fontSize: 15, fontFamily: 'Quicksand_bold'),
            ),
          ),
        ),
      ],
    );
  }

  Widget _calendarView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20,
      ),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey,
        ),
        child: InkWell(
          onTap: () => _showCalendarDialog(context),
          child: Icon(
            Icons.calendar_month,
            size: 25,
          ),
        ),
      ),
    );
  }

  void _showCalendarDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Calendar',
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'Quicksand_Regular',
            ),
          ),
          content: Container(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CalendarDatePicker(
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1970),
                  lastDate: DateTime(2200),
                  onDateChanged: (DateTime newDate) {
                    // Handle date change
                  },
                ),
                // SizedBox(height: 20),
                Text(
                  'Current Time: ${TimeOfDay.now().format(context)}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  'Current Date: ${DateTime.now().toString().split(' ')[0]}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Close',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Quicksand_Regular',
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
