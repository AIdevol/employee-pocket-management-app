import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weboapp_pocket/constants/images_constants.dart';
import 'package:weboapp_pocket/core/home/views/home_screen.dart';
import 'package:weboapp_pocket/core/pages/presentation/views/profile_drawer_screen.dart';

class SimpleDrawer extends StatelessWidget {
  const SimpleDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(1),
        bottomRight: Radius.circular(1),
      ),
      child: Drawer(
        shadowColor: Colors.grey,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey, // Update as needed
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(appIcon),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Devesh Tiwari',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.home),
              ),
              title: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text('Home'),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
                leading: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.settings),
                ),
                title: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text('Settings'),
                ),
                onTap: () {
                  Navigator.pop(context);
                }
                // () {
                // ProfileDrawerScreen();
                // showModalBottomSheet(
                //   context: context,
                //   isScrollControlled: true,
                //   builder: (context) => ProfileDrawerScreen(),
                // );
                // },
                ),
            ListTile(
              leading: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.contacts),
              ),
              title: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text('Blogs'),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.local_laundry_service_sharp),
              ),
              title: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text('Leave'),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.info),
              ),
              title: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text('Github View'),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
