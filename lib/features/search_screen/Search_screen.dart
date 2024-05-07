import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:transportation/features/search_screen/search_widgets/search_Listview.dart';

import '../../constants.dart';
// import '../constants.dart';
import '../drawer/drawer_screen.dart';
import '../main_page/home_screen.dart';
// import '../features/drawer/drawer_screen.dart';
// import '../drawer/drawer_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios , color: darkerColor, size: 8.w,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),


        title:Row(
            children: [

              // Your logo widget
              Padding(
                padding: const EdgeInsets.all(0),
                child: Image.asset(
                  'assets/appBarLogo.png', width: 15.w,
                ),
              ),
            ]
        ),
        actions: [
          Builder(
              builder: (context) {
                return IconButton(
                  icon: Icon(Icons.menu_rounded, size: 11.w,), // Icon for drawer
                  onPressed: () {
                    // Open drawer
                    Scaffold.of(context).openDrawer();
                  },
                );
              }
          ),
        ],

      ),


      drawer: const DrawerScreen(),


      body:Center(
        child: Column(
          children: [


            //custom listview of buses
            SearchListView(),


            SizedBox(height: 6.h,),

            //search again container
            GestureDetector(
              onTap:(){

                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeView()),
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
                    "Search Again",
                    style: TextStyle(color: mainColor, fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ),
      ),


    );
  }
}

