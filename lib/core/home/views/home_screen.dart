import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:weboapp_pocket/boats/view/chat_screen.dart';
import 'package:weboapp_pocket/constants/imageAnimation.dart';
import 'package:weboapp_pocket/constants/images_constants.dart';
import 'package:weboapp_pocket/core/component/ChartView_screen_presentation.dart';
import 'package:weboapp_pocket/core/component/appbar_views.dart';
import 'package:weboapp_pocket/core/component/bottom_navigations.dart';
import 'package:weboapp_pocket/core/component/drawer.dart';
import 'package:weboapp_pocket/core/component/progress_chart_screen.dart';
import 'package:weboapp_pocket/core/component/table_view.dart';
import 'package:weboapp_pocket/core/pages/presentation/views/details_manage_screen.dart';
import 'package:weboapp_pocket/core/pages/presentation/views/update_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    Center(child: _screenView()),
    Center(child: _detailsView()),
    Center(child: UpdateViewScreen()),
    Center(child: InkWell(onTap: () {}, child: Text('settings'))), // New Screen
    Center(
        child:
            InkWell(onTap: () {}, child: Text('notifications'))), // New Screen
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    // Perform initialization here
    print("HomeScreen initialized");
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppbarViews(),
      drawer: SimpleDrawer(),
      body: Stack(
        children: [
          _children[_currentIndex],
          Positioned(
            bottom: screenSize.height * 0.04,
            right: screenSize.height * 0.04,
            child: _chatviewState(),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
        child: BottomNavigationBar(
          elevation: 20.0,
          backgroundColor: Colors.blueGrey,
          currentIndex: _currentIndex,
          onTap: onTappedBar,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                details,
                height: 22,
                width: 22,
              ),
              label: 'Details',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                calenderIcon,
                height: 20,
                width: 20,
              ),
              label: 'Daily Update',
            ),
          ],
        ),
      ),
    );
  }
}

Widget _screenView() {
  return ListView(
    children: [
      Gap(20),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          "Total Progress",
          style: TextStyle(fontSize: 15, fontFamily: 'Quicksand_bold'),
        ),
      ),
      Gap(10),
      CharView(),
      Gap(20),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          "Work Progress",
          style: TextStyle(fontSize: 15, fontFamily: 'Quicksand_bold'),
        ),
      ),
      Gap(10),
      _progressState(),
      Gap(20),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          "Team Collaborations",
          style: TextStyle(fontSize: 15, fontFamily: 'Quicksand_bold'),
        ),
      ),
      Gap(20),
      _tableViewState(),
      Gap(20),
    ],
  );
}

_progressState() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: Get.height * 0.26,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Color.fromARGB(255, 200, 217, 219),
      ),
      child: ProgressStateView(),
    ),
  );
}

_tableViewState() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: Get.height * 0.26,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Color.fromARGB(255, 200, 217, 219),
      ),
      child: TableViewState(),
    ),
  );
}

_chatviewState() {
  return InkWell(
      onTap: () => Get.to(ChatScreen()),
      child: CircleAvatar(
        backgroundColor: Colors.blueGrey,
        radius: 30,
        child: ClipOval(
          child: Image.asset(
            chatboat,
            width: 70,
            height: 70,
            scale: 1,
            fit: BoxFit.contain,
          ),
        ),
      ));
}

_detailsView() {
  return InkWell(
    onTap: () {},
    child: DetailsManage(),
  );
}
