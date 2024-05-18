import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:provider/provider.dart';
// import 'package:transportation/app_router.dart';
import 'package:transportation/features/Home/presentation/views/home_screen.dart';
import 'core/network/local_network.dart';
import 'features/Home/Data/Repos/home_repo_imp.dart';
import 'features/Home/presentation/manager/BusStopCubit/bus_stop_cubit.dart';
import 'features/auth_screens/auth_cubit/auth_cubit.dart';
import 'features/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheNetwork.cacheInitialization();
  CacheNetwork.getCacheData(key: "token");

  // final AuthRepo authRepoImpl=AuthRepoImpl();
  // final AuthManager authManager=AuthManager( authRepoImpl);

  runApp(Transportation(
    // appRouter: AppRouter(),
    // authManager: authManager,
  ));
}

class Transportation extends StatefulWidget {
  // final AppRouter appRouter;
  // final AuthManager authManager;

  const Transportation({Key? key,
    // required this.appRouter,
    // required this.authManager
  }) : super(key: key);

  @override
  State<Transportation> createState() => _TransportationState();
}

class _TransportationState extends State<Transportation> {
  @override
  Widget build(BuildContext context) {
    return
      MultiBlocProvider(
           providers:[
      Provider<BusStopsCubit>.value(value: BusStopsCubit(homeRepoImpl())
          ..getBusStops()
      ),
             BlocProvider(create: (context)=>AuthCubit())
    ],
          child:

     FlutterSizer(
        builder: (context, orientation, screenType) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeView(),
          // onGenerateRoute: widget.appRouter.generateRoute,
        ),

    )
      );
  }
}

