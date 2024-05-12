import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../constants.dart';
import '../drawer/drawer_screen.dart';
import '../search_screen/Search_screen.dart';
import 'home_widgets/drop_down_menu.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static List<String> list = <String>['One', 'Two', 'Three', 'Four'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: darkerColor,
        centerTitle: true,

        // flexibleSpace: Image.asset('assets/appBarLogo.png' , fit: BoxFit.fitHeight , alignment: Alignment.bottomLeft,),
        toolbarHeight: 100,
        //   leading: IconButton(
        //   icon: Icon(Icons.arrow_back_ios , color: darkerColor, size: 8.w,),
        //   onPressed: (){
        //     Navigator.pop(context);
        //   },
        // ),

        // Your logo widget
        leading: Row(
            children: [

              // SizedBox(width: 10.w,),
              // Your logo widget
              Padding(
                padding: const EdgeInsets.all(0),
                child: Image.asset(
                  'assets/appBarLogo.png',
                  width: 13.5.w,
                ),
              ),
            ]
        ),


          // title:
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.menu_rounded, size: 11.w,), // Icon for drawer
                onPressed: () {
                  // Open drawer
                  Scaffold.of(context).openEndDrawer();
                },
              );
            }
          ),
        ],

      ),


      endDrawer: const DrawerScreen(),




      body: Column(
        children: [

          SizedBox(height: 5.h,),
          //map photo
          Center(
              child: Image.asset('assets/map_photo.png', width: 60.w,)
          ),

          SizedBox(height: 7.h,),

          //start point
          CustomDropdownButton(
              hintText: 'Start Point',
              dropdownValue: 'Start Point',
              options:  ['Start Point','Tanta', 'Mansoura', 'Cairo', 'Alexandria']
          ),

          SizedBox(height: 4.h,),

          //Destination
          CustomDropdownButton(
              hintText: 'Destination',
              dropdownValue: 'Destination',
              options:  ['Destination','Mansoura', 'Alexandria', 'Tanta', 'Cairo']
          ),


          SizedBox(height:10.h,),

          //search container
          GestureDetector(
            onTap:(){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
            child: Container(
              width: 40.w, height:6.h,
              decoration: BoxDecoration(color: darkerColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 3,
                      offset: Offset(0, 3), // specify the offset from the container
                    ),
                  ],
              ),
              child: const Center(
                child: Text(
                  "Search",
                  style: TextStyle(color: mainColor, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )


        ],
      ),
    );
  }
}
