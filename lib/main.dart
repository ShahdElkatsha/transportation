import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:transportation/app_router.dart';
import 'package:transportation/presentation/splash/splash_screen.dart';

void main() {
  runApp(Transportation(appRouter: AppRouter()));
}

class Transportation extends StatelessWidget {
  final AppRouter appRouter;

  const Transportation({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterSizer(
      builder: (context, orientation, screenType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}

