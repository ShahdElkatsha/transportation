import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class CustomTicketContainer extends StatelessWidget {
  const CustomTicketContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Stack(
            children:[
              Image.asset('assets/ticket_details/ticket_background.png'),

              //the data
              Column(
                children: [

                  SizedBox(height: 6.h,),

                  //start to end Town
                  Row(
                    children: [
                      SizedBox(width: 30.w,),
                      //start town
                      Text('Mansoura',
                        style: TextStyle(fontSize: 12, color: Color(0xffFFE2BF), fontWeight: FontWeight.bold),
                      ),

                      SizedBox(width: 2.w,),
                      Icon(Icons.arrow_forward , color: Color(0xffFFE2BF) , size:12,),
                      SizedBox(width: 2.w,),

                      //end town
                      Text('Tanta',
                        style: TextStyle(fontSize: 12, color: Color(0xffFFE2BF), fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h,),

                  //time
                  //day of week
                  Text('Friday', style: TextStyle(fontSize: 10, color: Color(0xffFFFFFF), fontWeight: FontWeight.bold),),
                  //day num
                  Text('15', style: TextStyle(fontSize: 30, color: Color(0xffFFFFFF), fontWeight: FontWeight.bold),),
                  // month& year
                  Text('March 2024', style: TextStyle(fontSize: 10, color: Color(0xffFFFFFF), fontWeight: FontWeight.bold),),
                  SizedBox(height: 1.h,),

                  //seat & time
                  //seat
                  Row(
                    children: [
                      SizedBox(width: 14.w,),
                      Icon(Icons.airline_seat_recline_normal_rounded, size: 23, color: Colors.white,),
                      SizedBox(width: 1.w,),
                      //seat num
                      Text('seat ( 12 )',
                        style: TextStyle(fontSize: 12, color:Colors.white, fontWeight: FontWeight.bold),
                      ),
                  ],),
                  SizedBox(height: 1.h,),
                  //time
                  Row(
                    children: [
                      SizedBox(width: 14.w,),
                      Icon(Icons.access_time, size: 23, color: Colors.white,),
                      SizedBox(width: 1.w,),
                      //end town
                      Text('12:00 PM',
                        style: TextStyle(fontSize: 12, color:Colors.white, fontWeight: FontWeight.bold),
                      ),

                    ],),


                ],
              )
        ]),
    );
  }
}
