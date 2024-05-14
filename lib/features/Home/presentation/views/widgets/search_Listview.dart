import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import '../../../../../core/constants.dart';
import '../journey_page.dart';

class SearchListView extends StatelessWidget {
   SearchListView({super.key});
  var busTrips = ['Tanta','cairo','Alexadria','Aswan', 'Mansoura', 'Assuit'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 90.w,height: 70.h,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => SizedBox(height: 2.5.h), // Adjust the height as needed
        itemCount: busTrips.length,

        itemBuilder: (context, index) {
          final busTrip = busTrips[index]; // Get the current bus trip data



          return GestureDetector(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const JourneyPage()),
              );
            },
            child: Container(
              width: 80.w, height:11.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: mediunColor,
              ),

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //bus icon
                    Image.asset('assets/search_screen/bus_icon.png',width: 15.w,),

                    SizedBox(width: 3.w,),

                    //text data
                    SizedBox( width: 65.w,

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //start town & time
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(//town
                                busTrip,
                                // textDirection: TextDirection.ltr,
                                textAlign: TextAlign.start,
                                style: TextStyle(color: mainColor,fontSize: 19, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width:26.w),
                              Text(//town
                                "12:00 Am",
                                textAlign: TextAlign.end,
                                style: TextStyle(color: darkerColor,fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),


                          Divider(height: 1.h, thickness: 1.5, color: mainColor),

                          //ticket`s & distination
                          Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                            children: [

                              Text(//tickets
                                "12 tickets remaining",
                                textAlign: TextAlign.end,
                                style: TextStyle(color: darkerColor,fontSize: 14, fontWeight: FontWeight.bold),
                              ),

                              // SizedBox(width:26.w),
                              Text(//town
                                busTrip,
                                // textDirection: TextDirection.ltr,
                                textAlign: TextAlign.start,
                                style: TextStyle(color: mainColor,fontSize: 19, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
