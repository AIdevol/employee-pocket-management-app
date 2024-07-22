import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weboapp_pocket/core/pages/presentation/views/login_screen.dart';

class SplashLoader extends StatelessWidget {
  const SplashLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      Get.offAll(() => LoginScreen());
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => LoginScreen()),
      // );
    });

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: LoadingAnimationWidget.dotsTriangle(
              color: Colors.black,
              size: 50.0,
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                "Developed With 💌 Flutter",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
