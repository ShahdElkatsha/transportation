// import 'package:flutter/material.dart';
// import '../auth_screens/login/login.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration(seconds: 3), (){
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Image.asset("assets/logo.png"),
//       backgroundColor: Colors.black,
//     );
//   }
// }


import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:page_transition/page_transition.dart';

import '../../constants.dart';
import '../auth_screens/login/login.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Image.asset(
          "assets/logo/SplashLogoRight.png",
          width: 75.w,
        ),
        nextScreen: const Login(),

        splashTransition: SplashTransition.slideTransition,
        backgroundColor: darkerColor.withOpacity(1.0),
        splashIconSize: 400,

        pageTransitionType: PageTransitionType.leftToRight ,

        animationDuration: const Duration(seconds: 2 ),
      ),
    );
  }
}

