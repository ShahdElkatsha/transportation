import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../../constants.dart';
import '../../ticket_pages/tickets_widgets/Custom_ticket_container.dart';

class PreviousTicketsPage extends StatelessWidget {
  const PreviousTicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: darkerColor,
        centerTitle: true,

        // flexibleSpace: Image.asset('assets/appBarLogo.png' , fit: BoxFit.fitHeight , alignment: Alignment.bottomLeft,),
        // toolbarHeight: 100,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios , color: Color(0xFF052659), size: 8.w,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),

      title: Text(
        "Previous Tickets",
        style: TextStyle(color: darkerColor, fontWeight: FontWeight.bold),
      ),

      //   title:Row(
      //       children: [
      //
      //         // Your logo widget
      //         Padding(
      //           padding: const EdgeInsets.all(0),
      //           child: Image.asset(
      //             'assets/appBarLogo.png', width: 20.w,
      //           ),
      //         ),
      //       ]
      //   ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
        child: SingleChildScrollView(
          child: Column(
            children: [

              const CustomTicketContainer(),

              SizedBox(height: 2.h,),

              const CustomTicketContainer(),

              SizedBox(height: 2.h,),

              const CustomTicketContainer(),
            ],
          ),
        ),
      ),
    );



  }
}
