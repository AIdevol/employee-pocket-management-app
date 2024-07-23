import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weboapp_pocket/constants/color.dart';
import 'package:weboapp_pocket/core/pages/presentation/controller/details_manage_controller.dart';

class DetailsManage extends GetView<DetailsManageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: ListView(
          children: [_salaryStructure(context)],
        ),
      ),
    );
  }

  Widget _salaryStructure(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: screenSize.height * 0.40,
        width: screenSize.width * 0.93,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 200, 217, 219),
        ),
        child: _vertcalPaymentdetails(context),
      ),
    );
  }
}

_vertcalPaymentdetails(BuildContext context) {
  final screenSize = MediaQuery.of(context).size;

  return Scaffold(
    backgroundColor: appcolor,
    appBar: AppBar(
      title: Text(
        'Payment',
        style: TextStyle(fontSize: 15, fontFamily: 'Quicksand_bold'),
      ),
    ),
    drawer: Container(width: screenSize.width * 0.40, child: const Drawer()),
    // body: con,
  );
}
