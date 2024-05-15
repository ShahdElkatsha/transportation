import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_cubit/auth_cubit.dart';
import 'auth_cubit/auth_state.dart';
import 'verify.dart';








import 'verify.dart';
class Forgot extends StatefulWidget {
  const Forgot({Key? key}) : super(key: key);

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {

  bool forgotScreen = false ;

  GlobalKey<FormState> formState = GlobalKey();

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthStates>(
        listener: (context,state){
          if (state is ForgotLoadingState){
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
          else if(state is ForgotSuccessState){

            Navigator.pop(context);   // عشان يخرج من alertDialog
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  Verify.fromForgot(screens: forgotScreen,code: state.code,emailInVerify: emailController.text,)));
          }
          else if(state is FailedToForgotState){
            showDialog(context: context, builder: (context)=> AlertDialog(
              content: Text("${state.message}", style:const TextStyle(color: Colors.white), textAlign: TextAlign.center,),
              backgroundColor: const Color(0xffD45161),
              icon: const Icon(Icons.info , color: Colors.white,),

            ));
          }

        },
        builder: (context,state){
          return  Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              leading: IconButton(
                icon:const Icon(Icons.arrow_back_ios, color: Color(0xff052659),),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
              title: const Text(
                "Forgot" ,
                style: TextStyle(
                  color: Color(0xff5483B3),
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding:const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/auth_photos/forget_screen_photo.png",
                      width: 400,
                      height: 255,
                      //alignment: Alignment.center,
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: Color(0xff5483B3),
                          fontWeight: FontWeight.w900,
                          fontSize: 26.3
                      ),
                    ),

                    const SizedBox(height: 15),

                    Text(
                      "Don’t worry! it happens. Please enter phone number associated with your account",
                      style: TextStyle(color: Colors.grey[700] , fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 15),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Enter your Email",
                        style: TextStyle(
                            color: Color(0xff5483B3),
                            fontSize: 16,
                            fontWeight: FontWeight.w900
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const SizedBox(height: 10),

                    Form(
                      key:formState,
                      child: TextFormField(
                        maxLines: 1,
                        controller: emailController,
                        onChanged: (value){

                        },
                        keyboardType: TextInputType.emailAddress,
                        validator: (val){
                          if (emailController.text.isEmpty){
                            return "Required";
                          }
                          else{
                            return null ;
                          }
                        },
                        decoration: InputDecoration(
                            contentPadding:const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                            hintText: "",
                            border:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(17),
                            ),

                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17),
                                borderSide: const BorderSide(
                                  color: Color(0xff5483B3),
                                )
                            )
                        ),

                      ),
                    ),

                    const SizedBox(height: 15),

                    GestureDetector(
                        onTap: () {
                          if (formState.currentState!.validate()) {
                            BlocProvider.of<AuthCubit>(context).forgot(email: emailController.text);

                            // Navigator.push(
                            //   context,
                            //   PageTransition(
                            //       child: Verify.fromForgot(),
                            //       type: PageTransitionType.rightToLeft,
                            //       duration: const Duration(milliseconds: 300)),
                            // );
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 56,
                          decoration: BoxDecoration(
                              color:const Color(0xff052659),
                              borderRadius: BorderRadius.circular(17)
                          ),
                          child:const Text(
                            "Get OTP",
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w900,
                                color: Colors.white
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: Colors.white,

          );
        });
  }
}















// class Forgot extends StatefulWidget {
//   const Forgot({Key? key}) : super(key: key);
//
//   @override
//   State<Forgot> createState() => _ForgotState();
// }
//
// class _ForgotState extends State<Forgot> {
//   String mobileNumber = " "  ;
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
//           "Forgot" ,
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
//               Image.asset("assets/auth_photos/forget_screen_photo.png",
//                 width: 400,
//                 height: 255,
//                 //alignment: Alignment.center,
//               ),
//               SizedBox(height: 40),
//               Text(
//                 "Forgot Password?",
//                 style: TextStyle(
//                     color: Color(0xff5483B3),
//                     fontWeight: FontWeight.w900,
//                     fontSize: 26.3
//                 ),
//               ),
//
//               SizedBox(height: 15),
//
//               Text(
//                 "Don’t worry! it happens. Please enter phone number associated with your account",
//                 style: TextStyle(color: Colors.grey[700] , fontWeight: FontWeight.w500),
//                 textAlign: TextAlign.center,
//               ),
//
//               SizedBox(height: 15),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   "Enter your mobile number",
//                   style: TextStyle(
//                       color: Color(0xff5483B3),
//                       fontSize: 16,
//                       fontWeight: FontWeight.w900
//                   ),
//                   textAlign: TextAlign.start,
//                 ),
//               ),
//               SizedBox(height: 10),
//
//               Container(
//                 height: 56.3,
//                 child: TextFormField(
//                   onChanged: (value){
//                     mobileNumber = value  ;
//                   },
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                       hintText: "",
//                       border:OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(17),
//                       ),
//
//                       focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(17),
//                           borderSide: BorderSide(
//                             color: Color(0xff5483B3),
//                           )
//                       )
//                   ),
//
//                 ),
//               ),
//
//               SizedBox(height: 15),
//
//               GestureDetector(
//                   onTap: (){
//                     //Navigator.push(context, MaterialPageRoute(builder: (context)=> Verify(mobileNumberInVerify: mobileNumber)));
//
//                     Navigator.push(
//                       context,
//                       PageTransition(child: Verify(mobileNumberInVerify: mobileNumber,), type: PageTransitionType.rightToLeft,duration: Duration(milliseconds: 300)),
//                     ) ;
//                   },
//                   child: Container(
//                     alignment: Alignment.center,
//                     height: 56,
//                     decoration: BoxDecoration(
//                         color: Color(0xff052659),
//                         borderRadius: BorderRadius.circular(17)
//                     ),
//                     child: Text(
//                       "Get OTP",
//                       style: TextStyle(
//                           fontSize: 19,
//                           fontWeight: FontWeight.w900,
//                           color: Colors.white
//                       ),
//                     ),
//                   )
//               ),
//             ],
//           ),
//         ),
//       ),
//       backgroundColor: Colors.white,
//
//     );
//   }
// }