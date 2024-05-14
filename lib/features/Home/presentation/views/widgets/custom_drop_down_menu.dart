// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_sizer/flutter_sizer.dart';
// import 'package:transportation/features/Home/presentation/manager/BusStopCubit/bus_stop_cubit.dart';
// import 'package:transportation/features/Home/presentation/manager/BusStopCubit/bus_stop_states.dart';
//
// import '../../../../../core/constants.dart';
// import '../../../Data/Models/get_all_bus_stop.dart';
//
// // import '../../../../../constants.dart';
//
//
// /// Flutter code sample for [DropdownButton.style].
//
// class CustomDropdownButton extends StatefulWidget {
//   CustomDropdownButton({
//     super.key,
//     required this.hintText,
//     required this.dropdownValue,
//     // required this.options,
//   });
//
//   String hintText;
//
//   String? dropdownValue;
//
//   @override
//   State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
// }
//
// class _CustomDropdownButtonState extends State<CustomDropdownButton> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<BusStopsCubit, BusStopState>(
//       builder: (context, state) {
//
//
//         return SingleChildScrollView(
//           child: Container(
//             decoration: BoxDecoration(
//               color: lighterColor, borderRadius: BorderRadius.circular(12),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 4,
//                   blurRadius: 3,
//                   offset: Offset(0, 0), // specify the offset from the container
//                 ),
//               ],
//             ),
//             width: 75.w,
//
//             child: Container(margin: EdgeInsets.symmetric(horizontal: 4.w),
//               child: DropdownButton<String>(
//
//                 value: widget.dropdownValue,
//                 style: TextStyle(color: mediunColor,
//                     fontSize: 19,
//                     fontWeight: FontWeight.bold),
//
//                 hint: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 5.w),
//                   child: Row(
//                     children: [
//                       DropdownMenuItem<String>(
//                         value: null,
//                         child: Text(
//                           widget.hintText,
//                           textAlign: TextAlign.start,
//                           // style: const TextStyle(color: mediunColor, fontSize: 19, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       SizedBox(width: 25.w,)
//                     ],
//                   ),
//                 ),
//
//
//                 onChanged: (String? value) {
//                   setState(() {
//                     widget.dropdownValue = value!;
//                   });
//                 },
//
//                 items: state is BusStopSuccess?
//                 state.items.map((e) =>DropdownMenuItem<String>(
//                   value: e.id,
//                   child: Text(e.name??"",
//                     style: const TextStyle(color: darkerColor),
//                   ),
//                 ) ).toList():[],
//
//                 icon: const Icon(Icons.arrow_drop_down, color: mainColor),
//
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
// //     .map<DropdownMenuItem<String>>((String value) {
// // return DropdownMenuItem<String>(
// // value: value,
// // child: Text(value,
// // style: const TextStyle(color: darkerColor),
// // ),
// // );
// // }



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:transportation/features/Home/presentation/manager/BusStopCubit/bus_stop_cubit.dart';
import 'package:transportation/features/Home/presentation/manager/BusStopCubit/bus_stop_states.dart';

import '../../../../../core/constants.dart';
import '../../../Data/Models/get_all_bus_stop.dart';

class CustomDropdownButton extends StatefulWidget {
  CustomDropdownButton({
    Key? key,
    required this.hintText,
    required this.dropdownValue,
  }) : super(key: key);

  final String hintText;
  String? dropdownValue;

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  @override
  Widget build(BuildContext context) {
    List<String> items=[];
    return BlocBuilder<BusStopsCubit, BusStopState>(
      builder: (context, state) {
        if(state is BusStopSuccess)
          {

            items=state.items;
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
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    widget.dropdownValue = value!;
                  });
                },
                style: const TextStyle(color: Colors.blue),
                selectedItemBuilder: (BuildContext context) {
                  // This is the widget that will be shown when you select an item.
                  // Here custom text style, alignment and layout size can be applied
                  // to selected item string.
                  return items.map((String value) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.dropdownValue.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList();
                },
                items: items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),















              //
              //
              //
              //
              //
              //
              //
              //
              //
              //
              //
              // DropdownButton<String>(
              //   value: widget.dropdownValue,
              //   onChanged: (String? value) {
              //     // This is called when the user selects an item.
              //     setState(() {
              //       widget.dropdownValue = value!;
              //     });
              //   },
              //   style: const TextStyle(color: Colors.blue),
              //   selectedItemBuilder: (BuildContext context) {
              //
              //         return items.map((Item value) {
              //           return Align(
              //             alignment: Alignment.centerLeft,
              //             child: Text(
              //               widget.dropdownValue!,
              //               style: const TextStyle(color: Colors.white),
              //             ),
              //           );
              //         }).toList();
              //
              //     // This is the widget that will be shown when you select an item.
              //     // Here custom text style, alignment and layout size can be applied
              //     // to selected item string.
              //
              //   },
              //   items: items.map<DropdownMenuItem<String>>((Item value) {
              //     return DropdownMenuItem<String>(
              //       value: value.name,
              //       child: Text(value.name.toString()),
              //     );
              //   }).toList(),
              // ),

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
            ),
          ),
        );
      },
    );
  }
}

