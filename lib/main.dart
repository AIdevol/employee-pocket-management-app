import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:weboapp_pocket/core/authentication/init_bindings.dart';
import 'package:weboapp_pocket/core/home/views/home_screen.dart';
import 'package:weboapp_pocket/core/pages/presentation/views/login_screen.dart';
import 'package:weboapp_pocket/screenlauncher/screen_launcher.dart';

var log = Logger();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, child) => GetMaterialApp(
        // builder: ,
        debugShowCheckedModeBanner: false,
        initialBinding: InitBindings(),
        logWriterCallback: LoggerX.write,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashLoader(),
      ),
    );
  }
}

class LoggerX {
  static void write(String text, {bool isError = false}) {
    Future.microtask(() => isError ? log.v("$text") : log.i("$text"));
  }
}
