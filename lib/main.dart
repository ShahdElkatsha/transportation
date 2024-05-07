import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:transportation/features/splash/splash_screen.dart';
// import 'splash/splash_screen.dart';

 main() {
  runApp(const Transportation());
 }

class Transportation extends StatelessWidget {
  const Transportation({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSizer(
      builder:(context, orientation, screenType) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),


      ),
    );
  }
}

