import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:transportation/features/Home/presentation/manager/BusStopCubit/bus_stop_cubit.dart';
import 'package:transportation/features/Home/presentation/manager/BusStopCubit/bus_stop_states.dart';
import '../../../../../core/constants.dart';


class CustomDropdownButton extends StatefulWidget {
  CustomDropdownButton({
    Key? key,
    required this.hintText,
    this.dropdownValue,
  }) : super(key: key);

  final String hintText;
  String? dropdownValue;

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  @override
  void initState() {
    super.initState();
    context.read<BusStopsCubit>().getBusStops();
  }

  @override
  Widget build(BuildContext context) {
    List<String> items = ['Cairo','Tanta','Alexandria','Luxor','Aswan','Qena','Kafr elsheekh'];

    return BlocBuilder<BusStopsCubit, BusStopState>(
      builder: (context, state) {
        // if (state is BusStopLoading) {
        //   return CircularProgressIndicator();
        // } else if (state is BusStopSuccess) {
        //   items = state.items;
        // } else if (state is BusStopFailure) {
        //   return Text('Failed to load bus stops', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),);
        // }

        // Ensure that the dropdownValue is in the list of items
        if (widget.dropdownValue != null && !items.contains(widget.dropdownValue)) {
          widget.dropdownValue = null;
        }

        return SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: lighterColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 4,
                  blurRadius: 3,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            width: 75.w,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              child: DropdownButton<String>(
                value: widget.dropdownValue,
                hint: Row(
                  children: [
                    // Icon(
                    //   Icons.arrow_drop_down,
                    //   color: Colors.white,
                    // ),
                    SizedBox(width: 8),
                    Text(widget.hintText),
                  ],
                ),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    widget.dropdownValue = value;
                  });
                },
                style: const TextStyle(color: Colors.blue),
                underline: SizedBox(),
                isExpanded: true,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                ),
                selectedItemBuilder: (BuildContext context) {
                  return items.map((String value) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          // Icon(
                          //   Icons.arrow_drop_down,
                          //   color: Colors.white,
                          // ),
                          SizedBox(width: 8),
                          Text(
                            widget.dropdownValue ?? widget.hintText,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    );
                  }).toList();
                },
                items: items.isNotEmpty
                    ? items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Row(
                      children: [
                        // Icon(
                        //   Icons.location_on,
                        //   color: Colors.white,
                        // ),
                        SizedBox(width: 8), // Add some space between the icon and the text
                        Text(value),
                      ],
                    ),
                  );
                }).toList()
                    : [
                  DropdownMenuItem<String>(
                    value: null,
                    child: Row(
                      children: [
                        // Icon(
                        //   Icons.location_on,
                        //   color: Colors.white,
                        // ),
                        SizedBox(width: 8),
                        Text(widget.hintText),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}






















// with problem with getting data

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_sizer/flutter_sizer.dart';
// import 'package:transportation/features/Home/presentation/manager/BusStopCubit/bus_stop_cubit.dart';
// import 'package:transportation/features/Home/presentation/manager/BusStopCubit/bus_stop_states.dart';
// import '../../../../../core/constants.dart';
//
// class CustomDropdownButton extends StatefulWidget {
//   CustomDropdownButton({
//     Key? key,
//     required this.hintText,
//     this.dropdownValue,
//   }) : super(key: key);
//
//   final String hintText;
//   String? dropdownValue;
//
//   @override
//   State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
// }
//
//
//
// class _CustomDropdownButtonState extends State<CustomDropdownButton> {
//   @override
//   Widget build(BuildContext context) {
//     List<String> items = [];
//     print(items);
//
//     return BlocBuilder<BusStopsCubit, BusStopState>(
//       builder: (context, state) {
//         if (state is BusStopSuccess) {
//           items = state.items;
//         }
//
//         // Ensure that the dropdownValue is in the list of items
//         if (widget.dropdownValue != null && !items.contains(widget.dropdownValue)) {
//           widget.dropdownValue = null;
//         }
//
//         return SingleChildScrollView(
//           child: Container(
//             decoration: BoxDecoration(
//               color: lighterColor,
//               borderRadius: BorderRadius.circular(12),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 4,
//                   blurRadius: 3,
//                   offset: Offset(0, 0),
//                 ),
//               ],
//             ),
//             width: 75.w,
//             child: Container(
//               margin: EdgeInsets.symmetric(horizontal: 4.w),
//               child: DropdownButton<String>(
//                 icon: const Icon(Icons.arrow_drop_down, color: mainColor),
//                 value: widget.dropdownValue,
//                 hint: Row(
//                   children: [
//                     // Icon(
//                     //   Icons.arrow_drop_down,
//                     //   color: Colors.white,
//                     // ),
//                     SizedBox(width: 8),
//                     Text(widget.hintText, style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
//                   ],
//                 ),
//                 onChanged: (String? value) {
//                   // This is called when the user selects an item.
//                   setState(() {
//                     widget.dropdownValue = value;
//                   });
//                 },
//                 style: const TextStyle(color: Colors.blue),
//                 underline: SizedBox(),
//                 isExpanded: true,
//                 selectedItemBuilder: (BuildContext context) {
//                   return items.map((String value) {
//                     return Align(
//                       alignment: Alignment.centerLeft,
//                       child: Row(
//                         children: [
//                           // Icon(
//                           //   Icons.arrow_drop_down,
//                           //   color: Colors.white,
//                           // ),
//                           SizedBox(width: 8),
//                           Text(
//                             widget.dropdownValue ?? widget.hintText,
//                             style: const TextStyle(color: Colors.white),
//                           ),
//                         ],
//                       ),
//                     );
//                   }).toList();
//                 },
//                 items: items.isNotEmpty
//                     ? items.map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.location_on,
//                           color: Colors.white,
//                         ),
//                         SizedBox(width: 8), // Add some space between the icon and the text
//                         Text(value),
//                       ],
//                     ),
//                   );
//                 }).toList()
//                     : [
//                   DropdownMenuItem<String>(
//                     value: null,
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.location_on,
//                           color: Colors.white,
//                         ),
//                         SizedBox(width: 8),
//                         Text(widget.hintText),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }














// last one (problem not resolved)

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_sizer/flutter_sizer.dart';
// import 'package:transportation/features/Home/presentation/manager/BusStopCubit/bus_stop_cubit.dart';
// import 'package:transportation/features/Home/presentation/manager/BusStopCubit/bus_stop_states.dart';
// import '../../../../../core/constants.dart';
//
// class CustomDropdownButton extends StatefulWidget {
//   CustomDropdownButton({
//     Key? key,
//     required this.hintText,
//     required this.dropdownValue,
//   }) : super(key: key);
//
//   final String hintText;
//   String? dropdownValue;
//
//   @override
//   State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
// }
//
// class _CustomDropdownButtonState extends State<CustomDropdownButton> {
//   @override
//   Widget build(BuildContext context) {
//     List<String> items=[];
//     return BlocBuilder<BusStopsCubit, BusStopState>(
//       builder: (context, state) {
//         if(state is BusStopSuccess)
//           {
//
//             items=state.items;
//           }
//         return SingleChildScrollView(
//           child: Container(
//             decoration: BoxDecoration(
//               color: lighterColor,
//               borderRadius: BorderRadius.circular(12),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 4,
//                   blurRadius: 3,
//                   offset: Offset(0, 0),
//                 ),
//               ],
//             ),
//             width: 75.w,
//             child: Container(
//               margin: EdgeInsets.symmetric(horizontal: 4.w),
//               child: DropdownButton<String>(
//                 value: widget.dropdownValue,
//                 onChanged: (String? value) {
//                   // This is called when the user selects an item.
//                   setState(() {
//                     widget.dropdownValue = value!;
//                   });
//                 },
//                 style: const TextStyle(color: Colors.blue),
//                 selectedItemBuilder: (BuildContext context) {
//
//                   return items.map((String value) {
//                     return Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         widget.dropdownValue.toString(),
//                         style: const TextStyle(color: Colors.white),
//                       ),
//                     );
//                   }).toList();
//                 },
//                 items: items.map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//               ),
// ),
// ),
// );
// },
// );
// }
// }
//







            // the old


            //
            //
            //
            //
            //
            //
            //
            //   DropdownButton<String>(
            //     value: widget.dropdownValue,
            //     style: TextStyle(
            //       color: mediunColor,
            //       fontSize: 19,
            //       fontWeight: FontWeight.bold,
            //     ),
            //     hint: Padding(
            //       padding: EdgeInsets.symmetric(horizontal: 5.w),
            //       child: Row(
            //         children: [
            //           DropdownMenuItem<String>(
            //             value: null,
            //             child: Text(
            //               widget.hintText,
            //               textAlign: TextAlign.start,
            //             ),
            //           ),
            //           SizedBox(width: 25.w),
            //         ],
            //       ),
            //     ),
            //     onChanged: (String? value) {
            //       setState(() {
            //         widget.dropdownValue = value!;
            //       });
            //     },
            //     items: state is BusStopSuccess
            //         ? state.items.map<DropdownMenuItem<String>>((Item value){
            //           return DropdownMenuItem<String>(
            //           value: value.id,
            // child: Text(value.name??""),
            // );
            // }).toList():[],
            //
            //
            //
            // //       state.items.map<DropdownMenuItem<String>>((String value) {
            // // return DropdownMenuItem<String>(
            // // value: value,
            // // child: Text(value),
            // // );
            // // }),
            //
            //
            //
            //
            //
            //     // state.items
            //     //     .map<DropdownMenuItem<String>>((e) =>
            //     //     DropdownMenuItem<String>(
            //     //       value: e.id,
            //     //       child: Text(
            //     //         e.name ?? "",
            //     //         style: const TextStyle(color: darkerColor),
            //     //       ),
            //     //     ))
            //     //     .toList()
            //     //     : [],
            //     icon: const Icon(Icons.arrow_drop_down, color: mainColor),
            //   ),

