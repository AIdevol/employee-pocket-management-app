import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:weboapp_pocket/constants/color.dart';
import 'package:weboapp_pocket/core/home/views/perfomance_progres.dart';
import 'package:weboapp_pocket/core/pages/presentation/controller/details_manage_controller.dart';

class DetailsManage extends GetView<DetailsManageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: ListView(
          children: [
            _salaryStructure(context),
            Gap(30),
            _progressView(context)
          ],
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

Widget _vertcalPaymentdetails(BuildContext context) {
  final screenSize = MediaQuery.of(context).size;
  final DetailsManageController controller =
      Get.find<DetailsManageController>();

  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: appcolor,
    ),
    child: Column(
      children: [
        AppBar(
          title: const Text(
            'Payment',
            style: TextStyle(fontSize: 15, fontFamily: 'Quicksand_bold'),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(Icons.picture_as_pdf),
                onPressed: () => controller.generatePDF(),
              ),
            ),
          ],
        ),
        const Expanded(
          child: Row(
            children: [
              Expanded(
                child: DataTableExample(),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _progressView(BuildContext context) {
  final screenSize = MediaQuery.of(context).size;
  return Center(
    child: Container(
      height: screenSize.height * 0.29,
      width: screenSize.width * 0.93,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 200, 217, 219),
      ),
      // child: PerfomanceProgressScreenView(),
    ),
  );
}

class DataTableExample extends StatelessWidget {
  const DataTableExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(
                label: Text('Month',
                    style: TextStyle(fontStyle: FontStyle.italic))),
            DataColumn(
                label: Text('Salary',
                    style: TextStyle(fontStyle: FontStyle.italic))),
            DataColumn(
                label: Text('Cut_Pay',
                    style: TextStyle(fontStyle: FontStyle.italic))),
            DataColumn(
                label: Text('OverTime pay',
                    style: TextStyle(fontStyle: FontStyle.italic))),
          ],
          rows: const <DataRow>[
            DataRow(cells: <DataCell>[
              DataCell(Text('January')),
              DataCell(Text('37000')),
              DataCell(Text('Null')),
              DataCell(Text('0')),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Text('February')),
              DataCell(Text('37000')),
              DataCell(Text('Null')),
              DataCell(Text('0')),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Text('March')),
              DataCell(Text('35000')),
              DataCell(Text('2000')),
              DataCell(Text('0')),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Text('April')),
              DataCell(Text('36000')),
              DataCell(Text('1000')),
              DataCell(Text('0')),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Text('May')),
              DataCell(Text('40000')),
              DataCell(Text('Null')),
              DataCell(Text('3000')),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Text('June')),
              DataCell(Text('56000')),
              DataCell(Text('Null')),
              DataCell(Text('9000')),
            ]),
          ],
        ),
      ),
    );
  }
}
