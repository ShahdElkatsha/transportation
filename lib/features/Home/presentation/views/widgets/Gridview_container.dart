

library globals;
import 'package:flutter/material.dart';

import '../../../../../core/constants.dart';


class CustomGridviewContainer extends StatefulWidget {
  CustomGridviewContainer({
    Key? key,
    required this.seatNum,
    required this.reservedList,
  }) : super(key: key);

  final String seatNum;
  final List<String> reservedList;



  @override
  State<CustomGridviewContainer> createState() =>
      _CustomGridviewContainerState();
}

class _CustomGridviewContainerState extends State<CustomGridviewContainer> {
  // Initialize variables to track the current color and click count
  Color _containerColor = greyCustom; // Initialize with default grey color
  Color _textColor = darkerColor; // Initialize with default darker color
  String? selectedSeat;

  // Function to handle container click
  void _handleContainerClick() {
    setState(() {
      // Check if the current string is reserved
      if (widget.reservedList.contains(widget.seatNum)) {
        // If reserved, do not change the color
        return;
      }

      // _containerColor = Color(0xffB47428);
      // // Reset the color of all seats
      // _resetColor();

      // // Toggle the color between grey and darkerColor
      _containerColor =
      _containerColor == greyCustom ? Colors.amber : greyCustom;
      // _textColor = _textColor == darkerColor ? greyCustom : darkerColor;
    });
  }

  // // Function to reset the color of all seats
  // void _resetColor() {
  //   // _containerColor = widget.reservedList.contains(widget.seatNum) ? darkerColor : _containerColor;
  //   // _textColor = widget.reservedList.contains(widget.seatNum) ? greyCustom : _textColor;
  //   _containerColor = greyCustom;
  //   _textColor = darkerColor;
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _handleContainerClick();
        selectedSeat = widget.seatNum;
      },
      child: Container(
        decoration: BoxDecoration(
          color: widget.reservedList.contains(widget.seatNum)
              ? darkerColor
              : _containerColor,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Text(
            widget.seatNum,
            style: TextStyle(
              color: widget.reservedList.contains(widget.seatNum)
                  ? greyCustom
                  : _textColor,
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}


//
// import 'package:flutter/material.dart';
//
// import '../../../constants.dart';
//
// class CustomGridviewContainer extends StatefulWidget {
//   CustomGridviewContainer({
//     Key? key,
//     required this.SeatNum,
//     required this.reservedList,
//   }) : super(key: key);
//
//   final String SeatNum;
//   final List<String> reservedList;
//
//   @override
//   State<CustomGridviewContainer> createState() =>
//       _CustomGridviewContainerState();
// }
//
// class _CustomGridviewContainerState extends State<CustomGridviewContainer> {
//   // Initialize variables to track the current color and click count
//   Color _clickContainerColor = greyCustom; // Initialize with default grey color
//   Color _clickTextColor = darkerColor; // Initialize with default darker color
//
//   int _clickCount = 0;
//
//
//   // Function to handle container click
//   void _handleContainerClick() {
//     setState(() {
//       // Check if the current string is reserved
//       if (widget.reservedList.contains(widget.SeatNum)) {
//         // If reserved, do not change the color
//         return;
//       }
//
//       // Toggle the color between grey and darkerColor
//       _clickContainerColor = _clickContainerColor == greyCustom ? darkerColor : greyCustom;
//       _clickTextColor = _clickTextColor == darkerColor ? greyCustom : darkerColor;
//     });
//   }
//
//
//   // // Function to handle container click
//   // void _handleContainerClick() {
//   //   setState(() {
//   //     // Increment the click count
//   //     _clickCount++;
//   //
//   //     // Check if the current string is reserved
//   //     if (widget.reservedList.contains(widget.SeatNum)) {
//   //       // Do not update colors for reserved strings
//   //       return;
//   //     }
//   //
//   //     // Update container color and text color based on click count
//   //     if (_clickCount % 2 == 1) {
//   //       _clickContainerColor = darkerColor;
//   //       _clickTextColor = greyCustom;
//   //     } else {
//   //       _clickContainerColor = greyCustom; // Reset color to grey on every second click
//   //       _clickTextColor = darkerColor;
//   //     }
//   //   });
//   // }
//
//
//       // // Change the container color based on whether the string is reserved or not
//       // if(widget.reservedList.contains(widget.SeatNum)){
//       //   _clickContainerColor = widget.reservedList.contains(widget.SeatNum) ? darkerColor : greyCustom;;
//       //   _clickTextColor = widget.reservedList.contains(widget.SeatNum) ? greyCustom : darkerColor;;
//       // }
//       // else if(_clickCount % 2 == 1){
//       //    _clickContainerColor =darkerColor;
//       //    _clickTextColor = greyCustom;
//       // }else if(_clickCount % 2 != 1){
//       //   _clickContainerColor = greyCustom; // Reset color to grey on every second click
//       //   _clickTextColor = darkerColor;
//       // }
//
//
//
//       // if (_clickCount % 2 == 0) {
//       //   _clickContainerColor =
//       //   widget.reservedList.contains(widget.SeatNum) ? darkerColor : greyCustom;
//       //   _clickTextColor =
//       //   widget.reservedList.contains(widget.SeatNum) ? darkerColor : greyCustom;
//       // } else {
//       //   _clickContainerColor = greyCustom; // Reset color to grey on every second click
//       //   _clickTextColor = darkerColor; // Reset text color to darker on every second click
//       // }
//   //   });
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         _handleContainerClick();
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: _clickContainerColor = widget.reservedList.contains(widget.SeatNum) ? darkerColor : greyCustom,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         padding: const EdgeInsets.all(8),
//         child: Center(
//           child: Text(
//             widget.SeatNum,
//             style: TextStyle(
//               color: _clickTextColor = widget.reservedList.contains(widget.SeatNum) ? greyCustom : darkerColor,
//               fontSize: 19,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
// // i need to make the container that his string reserved don`t change when click
//
