// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_sizer/flutter_sizer.dart';
// import 'package:transpotation_system_app/features/ticket_pages/tickets_widgets/Custom_ticket_container.dart';
//
// import '../../constants.dart';
// import '../main_page/home_screen.dart';
// import 'package:screenshot/screenshot.dart';
// import 'package:flutter/services.dart';
//
// class ImageGallerySaver {
//   static const MethodChannel _channel =
//   MethodChannel('image_gallery_saver');
//
//   static FutureOr<dynamic> saveImage(Uint8List imageBytes,
//       {int quality = 80,
//         String? name,
//         bool isReturnImagePathOfIOS = false}) async {
//     final result =
//     await _channel.invokeMethod('saveImageToGallery', <String, dynamic>{
//       'imageBytes': imageBytes,
//       'quality': quality,
//       'name': name,
//       'isReturnImagePathOfIOS': isReturnImagePathOfIOS
//     });
//     return result;
//   }
//
//   /// Save the PNG，JPG，JPEG image or video located at [file] to the local device media gallery.
//   static Future saveFile(String file,
//       {String? name, bool isReturnPathOfIOS = false}) async {
//     final result = await _channel.invokeMethod(
//         'saveFileToGallery', <String, dynamic>{
//       'file': file,
//       'name': name,
//       'isReturnPathOfIOS': isReturnPathOfIOS
//     });
//     return result;
//   }
// }
//
//
// class ConfirmTicketPage extends StatefulWidget {
//   const ConfirmTicketPage({super.key});
//
//   @override
//   State<ConfirmTicketPage> createState() => _ConfirmTicketPageState();
// }
//
// class _ConfirmTicketPageState extends State<ConfirmTicketPage> {
//
//   ScreenshotController screenshotController = ScreenshotController();
//    late Uint8List _imageFile;
//
//   @override
//   void initState() {
//     // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
//     super.initState();
//   }
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         foregroundColor: darkerColor,
//         centerTitle: true,
//
//         // flexibleSpace: Image.asset('assets/appBarLogo.png' , fit: BoxFit.fitHeight , alignment: Alignment.bottomLeft,),
//         toolbarHeight: 100,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios , color: Color(0xFF052659), size: 8.w,),
//           onPressed: (){
//             Navigator.pop(context);
//           },
//         ),
//
//         title:Row(
//             children: [
//
//               // Your logo widget
//               Padding(
//                 padding: const EdgeInsets.all(0),
//                 child: Image.asset(
//                   'assets/appBarLogo.png', width: 20.w,
//                 ),
//               ),
//             ]
//         ),
//       ),
//
//       body: Padding(
//         padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 7.h),
//         child: Column(
//           children: [
//
//             // SizedBox(height: 4.h,),
//             const Text("Your Ticket",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontWeight: FontWeight.bold, fontSize: 19, color: darkerColor
//               ),
//             ),
//             SizedBox(height: 10.h,),
//
//             Screenshot(
//                 controller: screenshotController,
//                 child: const CustomTicketContainer()
//             ),
//
//
//           SizedBox(height: 8.h,),
//
//
//             //save container
//             GestureDetector(
//               onTap:(){
//                 screenshotController.capture().then((Uint8List image) {
//                   //Capture Done
//                   setState(() {
//                     _imageFile = image;
//                   });
//                 } as FutureOr Function(Uint8List? value)).catchError((onError) {
//                   print(onError);
//                 });
//
//                 // screenshotController.capture(delay: Duration(milliseconds: 10)).then((capturedImage) async {
//                 //   ShowCapturedWidget(context, capturedImage!);
//                 // }).catchError((onError) {
//                 //   print(onError);
//                 // });
//               },
//               child: Container(
//                 width: 40.w, height:6.h,
//                 decoration: BoxDecoration(color: darkerColor,
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 4,
//                       blurRadius: 3,
//                       offset: Offset(0, 3), // specify the offset from the container
//                     ),
//                   ],
//                 ),
//                 child: const Center(
//                   child: Text(
//                     "Save",
//                     style: TextStyle(color: mainColor, fontSize: 18),
//                   ),
//                 ),
//               ),
//             ),
//
//             SizedBox(height: 4.h,),
//
//
//             //main page container
//             GestureDetector(
//               onTap:(){
//
//                 Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => const HomeView()),
//                 );
//               },
//               child: Container(
//                 width: 40.w, height:6.h,
//                 decoration: BoxDecoration(color: darkerColor,
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 4,
//                       blurRadius: 3,
//                       offset: Offset(0, 3), // specify the offset from the container
//                     ),
//                   ],
//                 ),
//                 child: const Center(
//                   child: Text(
//                     "Main Page",
//                     style: TextStyle(color: mainColor, fontSize: 18),
//                   ),
//                 ),
//               ),
//             )
//
//
//           ],
//         ),
//       ),
//
//     );
//
//   }
//
//
//
//
//
//
//   // Future<dynamic> ShowCapturedWidget(
//   //     BuildContext context, Uint8List capturedImage) {
//   //   return showDialog(
//   //     useSafeArea: false,
//   //     context: context,
//   //     builder: (context) => Scaffold(
//   //       appBar: AppBar(
//   //         title: Text("Captured widget screenshot"),
//   //       ),
//   //       body: Center(child: Image.memory(capturedImage)),
//   //     ),
//   //   );
//   // }
//
// // _saved(File image) async {
// //   // final result = await ImageGallerySaver.save(image.readAsBytesSync());
// //   print("File Saved to Gallery");
// // }
// }
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



import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:screenshot/screenshot.dart';
import 'package:transportation/features/ticket_pages/tickets_widgets/Custom_ticket_container.dart';

// import 'package:your_package_name_here/constants.dart'; // Update with your actual package name
// import 'package:your_package_name_here/main_page/home_screen.dart';

import '../../constants.dart';
import '../main_page/home_screen.dart'; // Update with your actual package name

class ImageGallerySaver {
  static const MethodChannel _channel =
  MethodChannel('image_gallery_saver');

  static FutureOr<dynamic> saveImage(Uint8List imageBytes,
      {int quality = 80,
        String? name,
        bool isReturnImagePathOfIOS = false}) async {
    final result =
    await _channel.invokeMethod('saveImageToGallery', <String, dynamic>{
      'imageBytes': imageBytes,
      'quality': quality,
      'name': name,
      'isReturnImagePathOfIOS': isReturnImagePathOfIOS
    });
    return result;
  }

  /// Save the PNG，JPG，JPEG image or video located at [file] to the local device media gallery.
  static Future saveFile(String file,
      {String? name, bool isReturnPathOfIOS = false}) async {
    final result = await _channel.invokeMethod(
        'saveFileToGallery', <String, dynamic>{
      'file': file,
      'name': name,
      'isReturnPathOfIOS': isReturnPathOfIOS
    });
    return result;
  }
}

class ConfirmTicketPage extends StatefulWidget {
  const ConfirmTicketPage({Key? key}) : super(key: key);

  @override
  State<ConfirmTicketPage> createState() => _ConfirmTicketPageState();
}

class _ConfirmTicketPageState extends State<ConfirmTicketPage> {
  ScreenshotController screenshotController = ScreenshotController();
  late Uint8List _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: darkerColor,
        centerTitle: true,
        toolbarHeight: 100,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: darkerColor, size: 8.w),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Image.asset(
                'assets/appBarLogo.png',
                width: 15.w,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
        child: Column(
          children: [
            const Text(
              "Your Ticket",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
                color: darkerColor,
              ),
            ),
            SizedBox(height: 10.h),
            Screenshot(
              controller: screenshotController,
              child: const CustomTicketContainer(),
            ),
            SizedBox(height: 8.h),
            GestureDetector(
              onTap: () {
                screenshotController.capture().then((Uint8List? image) {
                  if (image != null) {
                    setState(() {
                      _imageFile = image;
                    });
                    _saveImageToGallery(image);
                  } else {
                    print('Failed to capture image');
                  }
                }).catchError((error) {
                  print('Error capturing image: $error');
                });
              },
              child: Container(
                width: 40.w,
                height: 6.h,
                decoration: BoxDecoration(
                  color: darkerColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 3,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    "Save",
                    style: TextStyle(color: mainColor, fontSize: 18),
                  ),
                ),
              ),
            ),
            SizedBox(height: 4.h),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeView()),
                );
              },
              child: Container(
                width: 40.w,
                height: 6.h,
                decoration: BoxDecoration(
                  color: darkerColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 3,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    "Main Page",
                    style: TextStyle(color: mainColor, fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveImageToGallery(Uint8List imageBytes) async {
    try {
      final result = await ImageGallerySaver.saveImage(imageBytes);
      print('Image saved successfully: $result');
    } catch (error) {
      print('Error saving image: $error');
    }
  }
}

