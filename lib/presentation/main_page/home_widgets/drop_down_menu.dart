//
// import 'package:flutter/material.dart';
// import 'package:flutter_sizer/flutter_sizer.dart';
// import 'package:transpotation_system_app/constants.dart';
//
// /// Flutter code sample for [DropdownButton.style].
//
//
// class DropdownButtonApp extends StatelessWidget {
//   const DropdownButtonApp({
//     super.key,
//   });
//
// @override
//   Widget build(BuildContext context) {
//     return DropdownButtonExample(dropdownValue: '', options: [],);
//
//
//   }
// }
//
// class DropdownButtonExample extends StatefulWidget {
//    DropdownButtonExample({
//     super.key,
//     required this.dropdownValue,
//     required this.options,
//   });
//    String dropdownValue = 'Start point';
//   List<String> options = <String>['One', 'Two', 'Three', 'Four'];
//
//    @override
//   State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
// }
//
// class _DropdownButtonExampleState extends State<DropdownButtonExample> {
//   // List<String> options = <String>['One', 'Two', 'Three', 'Four'];
//   // String dropdownValue = 'Start point';
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//
//       decoration: BoxDecoration(color: mediumcolor,borderRadius: BorderRadius.circular(12)),
//       width: 75.w,
//
//       child: DropdownButton<String>(
//         // value: dropdownValue,
//         hint: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 5.w),
//           child: Text(
//             "Start Point",
//             textAlign: TextAlign.start,
//             style: TextStyle(color: Colors.white, fontSize: 19 , fontWeight: FontWeight.bold
//           ),
//           ),
//         ),
//         onChanged: (String? value) {
//           setState(() {
//              widget.dropdownValue = value!;
//           });
//         },
//         items: widget.options.map<DropdownMenuItem<String>>((String value) {
//           return DropdownMenuItem<String>(
//             value: value,
//             child: Text(value),
//           );
//         }).toList(),
//
//         // style: const TextStyle(color: Colors.blue),
//         // selectedItemBuilder: (BuildContext context) {
//         //   return options.map((String value) {
//         //     return Align(
//         //       alignment: Alignment.centerLeft,
//         //       child: Text(
//         //         dropdownValue,
//         //         style: const TextStyle(color: Colors.white , fontSize : 19, fontWeight: FontWeight.bold),
//         //       ),
//         //     );
//         //   }).toList();
//         // },
//
//       ),
//     );
//   }
// }
//


import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../../constants.dart';

/// Flutter code sample for [DropdownButton.style].

class CustomDropdownButton extends StatefulWidget {
  CustomDropdownButton({
    super.key,
    required this.hintText,
    required this.dropdownValue,
    required this.options,
  });

   String hintText ;
   String? dropdownValue;
   List<String> options;

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: lighterColor, borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 3,
            offset: Offset(0, 0), // specify the offset from the container
          ),
        ],
      ),
      width: 75.w,

      child: Container(margin: EdgeInsets.symmetric(horizontal: 4.w),
        child: DropdownButton<String>(

          value: widget.dropdownValue,style: TextStyle(color: mediunColor, fontSize: 19, fontWeight: FontWeight.bold),

          hint: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Row(
              children: [
                DropdownMenuItem<String>(
                  value: null,
                  child: Text(
                    widget.hintText,
                    textAlign: TextAlign.start,
                    // style: const TextStyle(color: mediunColor, fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 25.w,)
              ],
            ),
          ),


          onChanged: (String? value) {
            setState(() {
              widget.dropdownValue = value!;
            });
          },

          items: widget.options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value,
                style: const TextStyle(color: darkerColor),
              ),
            );
          }).toList(),

          icon: const Icon(Icons.arrow_drop_down, color: mainColor),

        ),
      ),
    );
  }
}

