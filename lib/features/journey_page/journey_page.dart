import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../constants.dart';
import '../drawer/drawer_screen.dart';
import '../ticket_pages/confirm_page.dart';
import 'journey_widgets/reserve_seats_rectagle.dart';


class JourneyPage extends StatelessWidget {
  const JourneyPage({super.key});

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
                      Scaffold.of(context).openEndDrawer();
                    },
                  );
                }
            ),
          ],

        ),

        endDrawer: const DrawerScreen(),


        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
          child: Column(
            children: [

              // SizedBox(height:4.h),

              //journey text data
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  //fROM: row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      const Text("From : ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 19, color: darkerColor
                          ),
                      ),
                      SizedBox(width: 5.w,),
                      const Text("Tanta",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19, color: Color(0xffB47428)
                        ),
                      ),

                    ],),
                  SizedBox(height:1.h),


                  //To: row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("To : ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19, color: darkerColor
                        ),
                      ),
                      SizedBox(width: 5.w,),
                      const Text("Mansoura",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19, color: Color(0xffB47428)
                        ),
                      ),
                    ],),
                  SizedBox(height:1.h),

                  //Leaving At: row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Leaving At : ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19, color: darkerColor
                        ),
                      ),
                      SizedBox(width: 5.w,),
                      const Text("12 PM",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19, color: Color(0xffB47428)
                        ),
                      ),

                    ],),
                  SizedBox(height:1.h),

                  //Arriving At
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Arriving At : ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19, color: darkerColor
                        ),
                      ),
                      SizedBox(width: 5.w,),
                      const Text("2 PM",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19, color: Color(0xffB47428)
                        ),
                      ),

                    ],),


                ],
              ),

              SizedBox(height: 4.h,),

              //Available seats
              Row(
                children: [
                  //text
                  const Text("Available Seats: ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 19, color: darkerColor
                    ),
                  ),

              SizedBox(width: 5.w,),
              //num of seats
              Text("16",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 19, color: darkerColor
                ),
              ),

              SizedBox(width: 10.w,),

              //reserved & available
              Column(
                children: [
                  Row(
                    children: [
                      //dark circle
                      Container(width: 5.w,height: 2.5.h,
                        decoration: BoxDecoration(color: darkerColor,borderRadius: BorderRadius.circular(20)),
                      ),
                      SizedBox(width: 2.w,),
                      //reserved
                      const Text("Reserved",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15, color: darkerColor
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 1.h,),

                  //available
                  Row(
                    children: [
                      //dark circle
                      Container(width: 5.w,height: 2.5.h,
                        decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(20)),
                      ),
                      SizedBox(width: 2.w,),
                      //reserved
                      const Text("Available",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15, color: darkerColor
                        ),
                      ),
                    ],
                  ),
                ],
              ),
                ]
              ),
              SizedBox(height: 2.h,),



              //the reserve seat
               ReserveSeatRectangle(),




              SizedBox(height: 3.h,),
              //Book container
              GestureDetector(
                onTap:(){

                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ConfirmTicketPage()),
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
                      "Book",
                      style: TextStyle(color: mainColor, fontSize: 18),
                    ),
                  ),
                ),
              )

            ]
          ),

        ),
    );
  }
}
