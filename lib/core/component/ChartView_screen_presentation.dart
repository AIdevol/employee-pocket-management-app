import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharView extends StatefulWidget {
  @override
  _CharViewState createState() => _CharViewState();
}

class _CharViewState extends State<CharView> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          // Donut Chart
          Container(
            height: Get.height * 0.26,
            width: Get.width * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Color.fromARGB(255, 200, 217, 219),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: PieChart(
                PieChartData(
                  sections: getSections(),
                  centerSpaceRadius: 25,
                  sectionsSpace: 2,
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (event is FlTapUpEvent) {
                          final touchedSection =
                              pieTouchResponse?.touchedSection;
                          if (touchedSection != null) {
                            touchedIndex = touchedSection.touchedSectionIndex;
                          } else {
                            touchedIndex = -1;
                          }
                        }
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          // Data Representation
          Expanded(
            child: Container(
              height: Get.height * 0.26,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color.fromARGB(255, 200, 217, 219),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: getDataRepresentation(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Method to get the sections for the PieChart
  List<PieChartSectionData> getSections() {
    return [
      PieChartSectionData(
        color: Colors.blue,
        value: 30,
        title: '30%',
        radius: touchedIndex == 0 ? 60 : 50,
        titleStyle: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      PieChartSectionData(
        color: Colors.red,
        value: 25,
        title: '25%',
        radius: touchedIndex == 1 ? 60 : 50,
        titleStyle: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      PieChartSectionData(
        color: Colors.green,
        value: 20,
        title: '20%',
        radius: touchedIndex == 2 ? 60 : 50,
        titleStyle: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      PieChartSectionData(
        color: Colors.orange,
        value: 15,
        title: '15%',
        radius: touchedIndex == 3 ? 60 : 50,
        titleStyle: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      PieChartSectionData(
        color: Colors.purple,
        value: 10,
        title: '10%',
        radius: touchedIndex == 4 ? 60 : 50,
        titleStyle: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ];
  }

  // Method to get the data representation widgets
  List<Widget> getDataRepresentation() {
    return [
      DataTile(
          color: Colors.blue,
          label: 'Work',
          value: '30%',
          isHighlighted: touchedIndex == 0),
      DataTile(
          color: Colors.red,
          label: 'leave',
          value: '25%',
          isHighlighted: touchedIndex == 1),
      DataTile(
          color: Colors.green,
          label: 'Work',
          value: '20%',
          isHighlighted: touchedIndex == 2),
      DataTile(
          color: Colors.orange,
          label: 'Project',
          value: '15%',
          isHighlighted: touchedIndex == 3),
      DataTile(
          color: Colors.purple,
          label: 'Team ',
          value: '10%',
          isHighlighted: touchedIndex == 4),
    ];
  }
}

class DataTile extends StatelessWidget {
  final Color color;
  final String label;
  final String value;
  final bool isHighlighted;

  const DataTile({
    Key? key,
    required this.color,
    required this.label,
    required this.value,
    required this.isHighlighted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: isHighlighted
                  ? Border.all(color: Colors.black, width: 2)
                  : null,
            ),
          ),
          SizedBox(width: 8),
          Text(label, style: TextStyle(fontSize: 16)),
          Spacer(),
          Text(value,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
