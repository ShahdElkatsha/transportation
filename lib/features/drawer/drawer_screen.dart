import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../auth_screens/login/login.dart';
import 'drawer_pages/previous_tickets.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [

              SizedBox(height: 11.h,),
              Image.asset('assets/drawer/accPhoto.png', height: 15.h, ),
              SizedBox(height: 3.h,),

              //name
               Text(
                'Name',
                style: TextStyle(
                  fontWeight: FontWeight.bold,fontSize: 19
                ),
                ),

              SizedBox(height: 8.h,),

              //previous Tickets
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const PreviousTicketsPage()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/drawer/prev_ticket.png', width: 9.w,),
                    SizedBox(width: 3.w,),
                    Text(
                      'Previous Tickets',
                      style: TextStyle(fontSize: 22
                    ),
                    ),
                  ],
                ),
              ),

              Divider(thickness: 1, height: 3.h, indent: 10.w, endIndent: 10.w, color: Colors.grey,),

              //contact
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/drawer/contact.png',width: 7.w,),
                  SizedBox(width: 6.w,),
                  Text(
                      'contact',
                      style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(width: 12.w,),
                ],
              ),

              Divider(thickness: 1, height: 3.h, indent: 10.w, endIndent:10.w, color: Colors.grey,),

              //about us
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/drawer/aboutUs.png',width: 7.w,),
                  SizedBox(width: 5.w,),
                  Text(
                    'about us',
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(width: 12.w,),
                ],
              ),

              Divider(thickness: 1, height: 3.h, indent: 10.w, endIndent: 10.w, color: Colors.grey,),


              //Account
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/drawer/account.png',width: 7.w,),
                  SizedBox(width: 5.w,),
                  Text(
                    'Account',
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(width: 12.w,),
                ],
              ),

              Divider(thickness: 1, height: 3.h, indent: 10.w, endIndent: 10.w, color: Colors.grey,),


              //log out
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/drawer/LogOut.png',width: 7.w,),
                    SizedBox(width: 5.5.w,),
                    Text(
                      'log out',
                      style: TextStyle(fontSize: 23),
                    ),
                    SizedBox(width: 12.w,),
                  ],
                ),
              ),







            ],
          ),
        )

    );
  }
}

//
// import 'package:flutter/material.dart';
//
// class DrawerScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           DrawerHeader(
//             decoration: BoxDecoration(
//               color: Colors.blue,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Image.asset('assets/logo/logo.png'),
//                 SizedBox(height: 10),
//                 Text(
//                   'Name',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                     fontSize: 16,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           ListTile(
//             leading: Image.asset('assets/drawer/prev_ticket_white.png'),
//             title: Text('Previous Tickets'),
//             onTap: () {
//               // Navigate or perform any action
//               Navigator.pop(context);
//             },
//           ),
//           Divider(thickness: 2),
//           ListTile(
//             leading: Image.asset('assets/drawer/prev_ticket_white.png'),
//             title: Text('Contact'),
//             onTap: () {
//               // Navigate or perform any action
//               Navigator.pop(context);
//             },
//           ),
//           Divider(thickness: 2),
//           ListTile(
//             leading: Image.asset('assets/drawer/prev_ticket_white.png'),
//             title: Text('About Us'),
//             onTap: () {
//               // Navigate or perform any action
//               Navigator.pop(context);
//             },
//           ),
//           Divider(thickness: 2),
//           ListTile(
//             leading: Image.asset('assets/drawer/prev_ticket_white.png'),
//             title: Text('Account'),
//             onTap: () {
//               // Navigate or perform any action
//               Navigator.pop(context);
//             },
//           ),
//           Divider(thickness: 2),
//           ListTile(
//             leading: Image.asset('assets/drawer/prev_ticket_white.png'),
//             title: Text('Log Out'),
//             onTap: () {
//               // Navigate or perform any action
//               Navigator.pop(context);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//
