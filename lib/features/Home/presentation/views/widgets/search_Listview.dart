// import 'package:flutter/material.dart';
// import 'package:flutter_sizer/flutter_sizer.dart';
// import '../../../../../core/constants.dart';
// import '../../../Data/Models/start_destination_journeys.dart';
// import '../journey_page.dart';
//
//
// class SearchListView extends StatelessWidget {
//    // late List<String> startPointBusTrips = ['Tanta','cairo','Alexadria','Aswan', 'Mansoura', 'Assuit'];
//    // late List<String> destinationBusTrips = ['Tanta','cairo','Alexadria','Aswan', 'Mansoura', 'Assuit'];
//    // late int? numberOfAvailableTickets;
//    // late String? destinationName ;
//    // late String? startBusStopName;
//    // late String? leavingTime;
//    late final List<StartDestinationJourney> busTrips;
//
//    // SearchListView({required this.busTrips});
// //SizedBox(width: 90.w,height: 70.h,
//    @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: ListView.separated(
//         separatorBuilder: (BuildContext context, int index) => SizedBox(height: 2.5.h), // Adjust the height as needed
//         itemCount: busTrips.length,
//
//
//         itemBuilder: (context, index) {
//           // final startBusTrip = startPointBusTrips[index]; // Get the current bus trip data
//           // final desBusTrip = startPointBusTrips[index];
//           // final List<Item> busTrips;
//           final busTrip = busTrips[index]; // Get the current bus trip data
//           // final desBusTrip = startPointBusTrips[index];
//
//
//
//
//           return GestureDetector(
//             onTap: (){
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => const JourneyPage()),
//               );
//             },
//             child: SingleChildScrollView(
//               child: Container(
//                 width: 80.w, height:11.h,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: mediunColor,
//                 ),
//
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SingleChildScrollView(
//                     child: Row(
//                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         //bus icon
//                         Image.asset('assets/search_screen/bus_icon.png',width: 15.w,),
//
//                         SizedBox(width: 3.w,),
//
//                         //text data
//                         SizedBox( width: 65.w,
//
//                           child: SingleChildScrollView(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 //start town & time
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(//town
//                                       busTrip.startBusStopName ?? "",
//                                       // textDirection: TextDirection.ltr,
//                                       textAlign: TextAlign.start,
//                                       style: TextStyle(color: mainColor,fontSize: 19, fontWeight: FontWeight.bold),
//                                     ),
//                                     // SizedBox(width:26.w),
//                                     Text(//town
//                                         busTrip.leavingTime ?? "",
//                                       textAlign: TextAlign.end,
//                                       style: TextStyle(color: darkerColor,fontSize: 14, fontWeight: FontWeight.bold),
//                                     ),
//                                   ],
//                                 ),
//
//
//                                 Divider(height: 1.h, thickness: 1.5, color: mainColor),
//
//                                 //ticket`s & destination
//                                 Row(
//                                   mainAxisAlignment:MainAxisAlignment.spaceBetween,
//                                   children: [
//
//                                     Text(//tickets
//                                       "${busTrip.numberOfAvailableTickets ?? 0} tickets remaining",
//                                       textAlign: TextAlign.end,
//                                       style: TextStyle(color: darkerColor,fontSize: 14, fontWeight: FontWeight.bold),
//                                     ),
//
//                                     // SizedBox(width:26.w),
//                                     Text(//town
//                                       busTrip.destinationName ?? "",
//                                       // textDirection: TextDirection.ltr,
//                                       textAlign: TextAlign.start,
//                                       style: TextStyle(color: mainColor,fontSize: 19, fontWeight: FontWeight.bold),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import '../../../../../core/constants.dart';
import '../journey_page.dart';

class SearchListView extends StatelessWidget {
  SearchListView({required this.destinationName, required this.startBusStopName});

  late List<String> numberOfAvailableTickets = ['12','19','20','16','21','29'];
  late String? destinationName;
  late String? startBusStopName ;
  late List<String> leavingTime=['12:00','5:00','16:00','20:00','1:00','9:00'];
  late List<String> arrivalTime=['2:00','7:00','18:00','22:00','3:00','11:00'];
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 90.w,height: 70.h,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => SizedBox(height: 2.5.h), // Adjust the height as needed
        itemCount: numberOfAvailableTickets.length,

        itemBuilder: (context, index) {
          final startTown = startBusStopName;
          final endTown = destinationName;
          final tickets = numberOfAvailableTickets[index]; // Get the current bus trip data
          final Time = leavingTime[index];
          // final desBusTrip = startPointBusTrips[index];



          return GestureDetector(
            onTap: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) =>  JourneyPage(
                  destinationName: destinationName,
                  startBusStopName: startBusStopName,
                  arrivalTime: arrivalTime[index],
                  leavingTime:  leavingTime[index],
                  numberOfAvailableSeats: numberOfAvailableTickets[index],)),
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
                                startTown!,
                                // textDirection: TextDirection.ltr,
                                textAlign: TextAlign.start,
                                style: TextStyle(color: mainColor,fontSize: 19, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width:26.w),
                              Text(//town
                                Time,
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
                                "$tickets tickets remaining",
                                textAlign: TextAlign.end,
                                style: TextStyle(color: darkerColor,fontSize: 14, fontWeight: FontWeight.bold),
                              ),

                              // SizedBox(width:26.w),
                              Text(//endtown
                                endTown!,
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