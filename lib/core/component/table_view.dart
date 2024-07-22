import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TableViewState extends StatelessWidget {
  TableViewState({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: Get.height * 0.26,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Color.fromARGB(255, 200, 217, 219),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columnSpacing: 16,
            columns: const [
              DataColumn(
                label: Text(
                  'Employee',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Assigned Team',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Project Timeline',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
            rows: List.generate(
              employeeData.length,
              (index) => DataRow(
                cells: [
                  DataCell(Text(employeeData[index]['employee'] ?? '')),
                  DataCell(Text(employeeData[index]['assigned_team'] ?? '')),
                  DataCell(Text(employeeData[index]['project_timeline'] ?? '')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Sample data for the table
  final List<Map<String, String>> employeeData = [
    {
      'employee': 'Devesh Tiwari',
      'assigned_team': 'Flutter Team',
      'project_timeline': '01 oct 2024'
    },
    {
      'employee': 'Devesh Tiwari',
      'assigned_team': 'Java Team',
      'project_timeline': '17 oct 2024'
    },
    {
      'employee': 'Devesh Tiwari',
      'assigned_team': 'Backend Team',
      'project_timeline': '03 Nov 2024'
    },
    // {'employee': 'David', 'assigned_team': 'Team D', 'project_timeline': 'Q4 2024'},
  ];
}
