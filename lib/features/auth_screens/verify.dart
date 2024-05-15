import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:transportation/features/Home/presentation/views/home_screen.dart';
import 'package:transportation/features/auth_screens/reset_password.dart';

import 'auth_cubit/auth_cubit.dart';
import 'auth_cubit/auth_state.dart';


class Verify extends StatefulWidget {
  String mobileNumberInVerify = "" ;
  String emailInVerify = ""  ;
  bool screens ;
  String? code ;



  Verify({Key? key,
    required this.mobileNumberInVerify,
    required this.emailInVerify,
    required this.screens
  }) : super(key: key);

  Verify.fromForgot({required this.screens , required this.code , required this.emailInVerify }) : super(key: GlobalKey());



  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {

  TextEditingController otp1Controller = TextEditingController();
  TextEditingController otp2Controller = TextEditingController();
  TextEditingController otp3Controller = TextEditingController();
  TextEditingController otp4Controller = TextEditingController();
  TextEditingController otp5Controller = TextEditingController();
  TextEditingController otp6Controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthStates>(
      listener: (context,state){
        if (widget.screens == true){
          if (state is VerifyFromRegisterLoadingState){
            showDialog(context: context, builder: (context)=>AlertDialog(
              content: AnimatedContainer(
                duration: Duration(seconds: 2),
                curve: Curves.easeIn,
                child: const Row(
                  children:
                  [
                    CupertinoActivityIndicator(color: Color(0xff5483B3)),
                    SizedBox(width: 12.5,),
                    Text("wait",style: TextStyle(color:Color(0xff052659),fontWeight: FontWeight.w500),),
                  ],
                ),

              ),
            ));
          }
          else if(state is VerifyFromRegisterSuccessState){

            Navigator.pop(context);   // عشان يخرج من alertDialog
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeView()));
          }
          else if(state is FailedToVerifyFromRegisterState){
            showDialog(context: context, builder: (context)=> AlertDialog(
              content: Text("${state.message}", style:const TextStyle(color: Colors.white),textAlign: TextAlign.center),
              backgroundColor: const Color(0xffD45161),
              icon: const Icon(Icons.info , color: Colors.white,),

            ));
          }
        }
        else{
          if (widget.code == otp1Controller.text+otp2Controller.text+otp3Controller.text+otp4Controller.text+otp5Controller.text+otp6Controller.text){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPassword(code: otp1Controller.text+otp2Controller.text+otp3Controller.text+otp4Controller.text+otp5Controller.text+otp6Controller.text, email: widget.emailInVerify,)));
          }
          else{
            showDialog(context: context, builder: (context)=> const AlertDialog(
              content: Text("Please Enter The Code Correctly", style: TextStyle(color: Colors.white),),
              backgroundColor:  Color(0xffD45161),
              icon: Icon(Icons.info , color: Colors.white,),

            ));
          }


          // if (state is VerifyFromForgotLoadingState){
          //   showDialog(context: context, builder: (context)=>AlertDialog(
          //     content: AnimatedContainer(
          //       duration: Duration(seconds: 2),
          //       curve: Curves.easeIn,
          //       child: const Row(
          //         children:
          //         [
          //           CupertinoActivityIndicator(color: Color(0xff5483B3)),
          //           SizedBox(width: 12.5,),
          //           Text("wait",style: TextStyle(color:Color(0xff052659),fontWeight: FontWeight.w500),),
          //         ],
          //       ),
          //
          //     ),
          //   ));
          // }
          // else if(state is VerifyFromForgotSuccessState){
          //
          //   Navigator.pop(context);   // عشان يخرج من alertDialog
          //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ResetPassword()));
          // }
          // else if(state is FailedToVerifyFromForgotState){
          //   showDialog(context: context, builder: (context)=> AlertDialog(
          //     content: Text("${state.message}", style:const TextStyle(color: Colors.white),),
          //     backgroundColor: const Color(0xffD45161),
          //     icon: const Icon(Icons.info , color: Colors.white,),
          //
          //   ));
          // }
        }

      },

      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Color(0xff052659),),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            title: const Text(
              "Verify" ,
              style: TextStyle(
                color: Color(0xff5483B3),
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/img_7.png",
                    width: 400,
                    height: 255,
                    //alignment: Alignment.center,
                  ),
                  const SizedBox(height: 40),

                  const Text(
                    "Enter OTP",
                    style: TextStyle(
                        color: Color(0xff5483B3),
                        fontWeight: FontWeight.w900,
                        fontSize: 26.3
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "An 4 digit OTP has been sent to",
                    style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 8),

                  //  Text(
                  //     "${widget.mobileNumberInVerify}",
                  //   style: const TextStyle(fontSize: 16.4, fontWeight: FontWeight.bold , color: Color(0xff5483B3)
                  // ),
                  // ),
                  const SizedBox(height: 40),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 51,
                        width: 42,
                        child: TextFormField(
                          controller: otp1Controller,
                          onChanged: (value){
                            if(value.length==1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          onSaved: (pin){},

                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              hintText: "",
                              border:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.73),
                              ),

                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11.73),
                                  borderSide: const BorderSide(
                                    color: Color(0xff5483B3),
                                  )
                              )
                          ),

                        ),
                      ),

                      Container(
                        height: 51,
                        width: 42,
                        child: TextFormField(
                          controller: otp2Controller,
                          onChanged: (value){
                            if(value.length==1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          onSaved: (pin){},

                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              hintText: "",
                              border:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.73),
                              ),

                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11.73),
                                  borderSide: const BorderSide(
                                    color: Color(0xff5483B3),
                                  )
                              )
                          ),

                        ),
                      ),



                      Container(
                        height: 51,
                        width: 42,
                        child: TextFormField(
                          controller: otp3Controller,
                          onChanged: (value){
                            if(value.length==1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          onSaved: (pin){},

                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              hintText: "",
                              border:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.73),

                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11.73),
                                  borderSide: const BorderSide(
                                    color: Color(0xff5483B3),
                                  )
                              )
                          ),

                        ),
                      ),


                      Container(
                        height: 51,
                        width: 42,
                        child: TextFormField(
                          controller: otp4Controller,
                          onChanged: (value){
                            if(value.length==1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          onSaved: (pin){},

                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              hintText: "",
                              border:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.73),
                              ),

                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11.73),
                                  borderSide:const BorderSide(
                                    color: Color(0xff5483B3),
                                  )
                              )
                          ),

                        ),
                      ),


                      Container(
                        height: 51,
                        width: 42,
                        child: TextFormField(
                          controller: otp5Controller,
                          onChanged: (value){
                            if(value.length==1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          onSaved: (pin){},
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              hintText: "",
                              border:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.73),
                              ),

                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11.73),
                                  borderSide:const BorderSide(
                                    color: Color(0xff5483B3),
                                  )
                              )
                          ),

                        ),
                      ),

                      Container(
                        height: 51,
                        width: 42,
                        child: TextFormField(
                          controller: otp6Controller,
                          onChanged: (value){
                            if(value.length==1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          onSaved: (pin){},
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              hintText: "",
                              border:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.73),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11.73),
                                  borderSide: const BorderSide(
                                    color: Color(0xff5483B3),
                                  )
                              )
                          ),

                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  GestureDetector(
                      onTap: (){
                        if (widget.screens == true ){
                          BlocProvider.of<AuthCubit>(context).verifyFromRegister(
                              phoneNumber: widget.mobileNumberInVerify,
                              email: widget.emailInVerify,
                              verificationCode: otp1Controller.text+otp2Controller.text+otp3Controller.text+otp4Controller.text+otp5Controller.text+otp6Controller.text
                          );
                        }
                        else{
                          BlocProvider.of<AuthCubit>(context).forgot(email: widget.emailInVerify);
                        }


                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 56.3,
                        decoration: BoxDecoration(
                            color: const Color(0xff052659),
                            borderRadius: BorderRadius.circular(17)
                        ),
                        child: const Text(
                          "Verify",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w900,
                              color: Colors.white
                          ),
                        ),
                      )
                  ),

                  const SizedBox(height: 20),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Resend OTP",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.4,
                            color: Colors.black54
                        ),
                      ),

                      SizedBox(width: 5),

                      Text(
                        "(00:12)",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.4,
                            color: Colors.black38
                        ),
                      )
                    ],
                  )

                ],
              ),
            ),
          ),
          backgroundColor: Colors.white,

        );
      },
    );
  }
}












// class Verify extends StatefulWidget {
//   Verify({Key? key,
//     required this.mobileNumberInVerify
//   }) : super(key: key);
//
//   String mobileNumberInVerify  ;
//
//
//   @override
//   State<Verify> createState() => _VerifyState();
// }
//
// class _VerifyState extends State<Verify> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios, color: Color(0xff052659),),
//           onPressed: (){
//             Navigator.pop(context);
//           },
//         ),
//         title: Text(
//           "Verify" ,
//           style: TextStyle(
//             color: Color(0xff5483B3),
//             fontWeight: FontWeight.w900,
//             fontSize: 30,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(30),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Image.asset("assets/img_7.png",
//                 width: 400,
//                 height: 255,
//                 //alignment: Alignment.center,
//               ),
//               SizedBox(height: 40),
//
//               Text(
//                 "Enter OTP",
//                 style: TextStyle(
//                     color: Color(0xff5483B3),
//                     fontWeight: FontWeight.w900,
//                     fontSize: 26.3
//                 ),
//               ),
//
//               SizedBox(height: 8),
//
//               Text(
//                 "An 4 digit OTP has been sent to",
//                 style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w500),
//                 textAlign: TextAlign.center,
//               ),
//
//               SizedBox(height: 8),
//
//               Text(
//                 "${widget.mobileNumberInVerify}",
//                 style: TextStyle(fontSize: 16.4, fontWeight: FontWeight.bold , color: Color(0xff5483B3)
//                 ),
//               ),
//               SizedBox(height: 40),
//
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     height: 51,
//                     width: 42,
//                     child: TextFormField(
//                       onChanged: (value){
//                         if(value.length==1){
//                           FocusScope.of(context).nextFocus();
//                         }
//                       },
//                       onSaved: (pin){},
//
//                       keyboardType: TextInputType.number,
//                       textAlign: TextAlign.center,
//                       inputFormatters: [LengthLimitingTextInputFormatter(1),
//                         FilteringTextInputFormatter.digitsOnly
//                       ],
//                       decoration: InputDecoration(
//                           hintText: "",
//                           border:OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(11.73),
//                           ),
//
//                           focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(11.73),
//                               borderSide: BorderSide(
//                                 color: Color(0xff5483B3),
//                               )
//                           )
//                       ),
//
//                     ),
//                   ),
//
//
//                   Container(
//                     height: 51,
//                     width: 42,
//                     child: TextFormField(
//                       onChanged: (value){
//                         if(value.length==1){
//                           FocusScope.of(context).nextFocus();
//                         }
//                       },
//                       onSaved: (pin){},
//
//                       keyboardType: TextInputType.number,
//                       textAlign: TextAlign.center,
//                       inputFormatters: [LengthLimitingTextInputFormatter(1),
//                         FilteringTextInputFormatter.digitsOnly
//                       ],
//                       decoration: InputDecoration(
//                           hintText: "",
//                           border:OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(11.73),
//
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(11.73),
//                               borderSide: BorderSide(
//                                 color: Color(0xff5483B3),
//                               )
//                           )
//                       ),
//
//                     ),
//                   ),
//
//
//                   Container(
//                     height: 51,
//                     width: 42,
//                     child: TextFormField(
//                       onChanged: (value){
//                         if(value.length==1){
//                           FocusScope.of(context).nextFocus();
//                         }
//                       },
//                       onSaved: (pin){},
//
//                       keyboardType: TextInputType.number,
//                       textAlign: TextAlign.center,
//                       inputFormatters: [LengthLimitingTextInputFormatter(1),
//                         FilteringTextInputFormatter.digitsOnly
//                       ],
//                       decoration: InputDecoration(
//                           hintText: "",
//                           border:OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(11.73),
//                           ),
//
//                           focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(11.73),
//                               borderSide: BorderSide(
//                                 color: Color(0xff5483B3),
//                               )
//                           )
//                       ),
//
//                     ),
//                   ),
//
//
//                   Container(
//                     height: 51,
//                     width: 42,
//                     child: TextFormField(
//                       onChanged: (value){
//                         if(value.length==1){
//                           FocusScope.of(context).nextFocus();
//                         }
//                       },
//                       onSaved: (pin){},
//                       keyboardType: TextInputType.number,
//                       textAlign: TextAlign.center,
//                       inputFormatters: [LengthLimitingTextInputFormatter(1),
//                         FilteringTextInputFormatter.digitsOnly
//                       ],
//                       decoration: InputDecoration(
//                           hintText: "",
//                           border:OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(11.73),
//                           ),
//
//                           focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(11.73),
//                               borderSide: BorderSide(
//                                 color: Color(0xff5483B3),
//                               )
//                           )
//                       ),
//
//                     ),
//                   ),
//
//                   Container(
//                     height: 51,
//                     width: 42,
//                     child: TextFormField(
//                       onChanged: (value){
//                         if(value.length==1){
//                           FocusScope.of(context).nextFocus();
//                         }
//                       },
//                       onSaved: (pin){},
//                       keyboardType: TextInputType.number,
//                       textAlign: TextAlign.center,
//                       inputFormatters: [LengthLimitingTextInputFormatter(1),
//                         FilteringTextInputFormatter.digitsOnly
//                       ],
//                       decoration: InputDecoration(
//                           hintText: "",
//                           border:OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(11.73),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(11.73),
//                               borderSide: BorderSide(
//                                 color: Color(0xff5483B3),
//                               )
//                           )
//                       ),
//
//                     ),
//                   ),
//                 ],
//               ),
//
//               SizedBox(height: 25),
//
//               GestureDetector(
//                   onTap: (){
//                     //Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPassword()));
//
//                     Navigator.push(
//                       context,
//                       PageTransition(child: ResetPassword(), type: PageTransitionType.rightToLeft,duration: Duration(milliseconds: 300)),
//                     ) ;
//                   },
//                   child: Container(
//                     alignment: Alignment.center,
//                     height: 56.3,
//                     decoration: BoxDecoration(
//                         color: Color(0xff052659),
//                         borderRadius: BorderRadius.circular(17)
//                     ),
//                     child: Text(
//                       "Verify",
//                       style: TextStyle(
//                           fontSize: 19,
//                           fontWeight: FontWeight.w900,
//                           color: Colors.white
//                       ),
//                     ),
//                   )
//               ),
//
//               SizedBox(height: 20),
//
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Resend OTP",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16.4,
//                         color: Colors.black54
//                     ),
//                   ),
//
//                   SizedBox(width: 5),
//
//                   Text(
//                     "(00:12)",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16.4,
//                         color: Colors.black38
//                     ),
//                   )
//                 ],
//               )
//
//             ],
//           ),
//         ),
//       ),
//       backgroundColor: Colors.white,
//
//     );
//   }
// }