import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weboapp_pocket/constants/images_constants.dart';
import 'package:weboapp_pocket/core/pages/presentation/views/profile_drawer_screen.dart';

class AppbarViews extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueGrey,
      title: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 20.0,
        ),
        child: AnimatedTextKit(
          totalRepeatCount: 50,
          animatedTexts: [
            WavyAnimatedText(
              'Weboapp Pockets',
              textStyle: TextStyle(
                color: Colors.white,
                fontFamily: 'Quicksand_bold',
              ),
            ),
            // WavyAnimatedText('Look at the waves'),
          ],
          isRepeatingAnimation: true,
          onTap: () {
            print("Tap Event");
          },
        ),
      ),

      /* Text(
        'Weboapp Pockets',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Quicksand_bold',
        ),
      ), */
      leading: IconButton(
        hoverColor: Colors.grey,
        icon: Image.asset(
          menuIcons2,
          scale: 1,
          height: 25,
          width: 25,
        ),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: () {
            // Implement search functionality
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: CircleAvatar(
            backgroundImage: AssetImage(appIcon),
            backgroundColor: Colors.cyan,
            child: InkWell(
                highlightColor: Colors.blueGrey,
                onTap: () => showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => ProfileDrawerScreen(),
                    )),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
