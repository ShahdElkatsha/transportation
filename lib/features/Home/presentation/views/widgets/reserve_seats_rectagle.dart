import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import '../../../../../core/constants.dart';
import 'Gridview_container.dart';



class ReserveSeatRectangle extends StatelessWidget {

   ReserveSeatRectangle({super.key});



  @override
  Widget build(BuildContext context) {
    final List<String> reserved = ['1','2','5','7','12','22','19','8','28','29','30','20','13','24'];
    List<String> available;

    return Container(
      height: 43.h,
      decoration: BoxDecoration(color: mediunColor, borderRadius: BorderRadius.circular(20) ),

      child: Row(
        children: [
          Padding(
            padding:  EdgeInsets.all(5.w),
            child: SizedBox(width: 25.w,height: 41.h,
              child: GridView.count(
                primary: false,
                padding:  EdgeInsets.symmetric(horizontal: 2.w),
                crossAxisSpacing: 2.w,
                mainAxisSpacing: 2.w,
                crossAxisCount: 2,
                children: <Widget>[
                  CustomGridviewContainer(seatNum: "1", reservedList: reserved,),
                  CustomGridviewContainer(seatNum: "2", reservedList: reserved,),
                  CustomGridviewContainer(seatNum: "3", reservedList: reserved,),
                  CustomGridviewContainer(seatNum: "4", reservedList: reserved,),
                  CustomGridviewContainer(seatNum: "5", reservedList: reserved,),
                  CustomGridviewContainer(seatNum: "6", reservedList: reserved,),
                  CustomGridviewContainer(seatNum: "7", reservedList: reserved,),
                  CustomGridviewContainer(seatNum: "8", reservedList: reserved,),
                  CustomGridviewContainer(seatNum: "9", reservedList: reserved,),
                  CustomGridviewContainer(seatNum: "10", reservedList: reserved,),
                  CustomGridviewContainer(seatNum: "11", reservedList: reserved,),
                  CustomGridviewContainer(seatNum: "12", reservedList: reserved,),
                  CustomGridviewContainer(seatNum: "13", reservedList: reserved,),
                  CustomGridviewContainer(seatNum: "14", reservedList: reserved,),
                  CustomGridviewContainer(seatNum: "15", reservedList: reserved,),
                  CustomGridviewContainer(seatNum: "16", reservedList: reserved,),

                ],
              ),
            ),
          ),
          SizedBox(width:10.w),

          Padding(
            padding:  EdgeInsets.all(5.w),
            child: SizedBox(width: 25.w,height: 41.h,
              child: GridView.count(
                primary: false,
                padding:  EdgeInsets.symmetric(horizontal: 2.w),
                crossAxisSpacing: 2.w,
                mainAxisSpacing: 2.w,
                crossAxisCount: 2,
                children: <Widget>[
                  CustomGridviewContainer(seatNum: "17", reservedList: reserved,),
                  CustomGridviewContainer(seatNum: "18", reservedList: reserved,),
                  CustomGridviewContainer(seatNum: "19", reservedList: reserved,),
                  CustomGridviewContainer(seatNum: "20", reservedList: reserved,),
                  CustomGridviewContainer(seatNum: "21", reservedList: reserved,),
                  CustomGridviewContainer(seatNum: "22", reservedList: reserved,),
                  CustomGridviewContainer(seatNum: "23", reservedList: reserved,),
                  CustomGridviewContainer(seatNum: "24", reservedList: reserved,),
                  CustomGridviewContainer(seatNum: "25", reservedList: reserved,),
                  CustomGridviewContainer(seatNum: "26", reservedList: reserved,),
                  CustomGridviewContainer(seatNum: "27", reservedList: reserved,),
                  CustomGridviewContainer(seatNum: "28", reservedList: reserved,),
                  CustomGridviewContainer(seatNum: "29", reservedList: reserved,),
                  CustomGridviewContainer(seatNum: "30", reservedList: reserved,),
                  CustomGridviewContainer(seatNum: "31", reservedList: reserved,),
                  CustomGridviewContainer(seatNum: "32", reservedList: reserved,),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
