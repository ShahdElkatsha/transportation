import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportation/features/Home/presentation/views/home_screen.dart';

import '../Home/presentation/views/Search_screen.dart';
import 'auth_cubit/auth_cubit.dart';
import 'auth_cubit/auth_state.dart';


class ResetPassword extends StatefulWidget {
  String code ;
  String email ;

  ResetPassword({Key? key,required this.code , required this.email}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool secureText1 = true ;
  bool secureText2 = true ;

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  GlobalKey <FormState> formKey = GlobalKey() ;


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthStates>(
      listener: (context,state){
        if (state is ResetPasswordLoadingState){
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
        else if(state is ResetPasswordSuccessState){

          Navigator.pop(context);   // عشان يخرج من alertDialog
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  HomeView()));
        }
        else if(state is FailedToResetPasswordState){
          showDialog(context: context, builder: (context)=> AlertDialog(
            content: Text("${state.message}", style:const TextStyle(color: Colors.white),textAlign: TextAlign.center),
            backgroundColor: const Color(0xffD45161),
            icon: const Icon(Icons.info , color: Colors.white,),

          ));
        }
      },
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios, color: Color(0xff052659),
                )
            ),
            title: const Text(
              "Reset Password" ,
              style: TextStyle(
                color: Color(0xff5483B3),
                fontWeight: FontWeight.w900,
                fontSize: 30,
                //fontFamily: "Poppins"
              ),
            ),
          ),

          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 90),
              child: Padding(
                padding:const EdgeInsets.all(30),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Enter new password",
                        style: TextStyle(
                          color: Color(0xff5483B3),
                          fontSize: 16,
                          fontWeight: FontWeight.w900,

                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 56.3,
                        child: TextFormField(
                          controller: passwordController,
                          validator: (input){
                            if(passwordController.text.isEmpty){
                              return " * Required ";
                            }
                            else if(passwordController.text.length<8){
                              return " Password Must be at Least 8 character";

                            }
                            else{
                              return null ;
                            }
                          },
                          obscureText: secureText1,
                          decoration: InputDecoration(
                            hintText: "",
                            border:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(17),
                            ),

                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17),
                                borderSide:const BorderSide(
                                  color:  Color(0xff5483B3),
                                )
                            ),

                            suffixIcon: IconButton(
                                onPressed: (){
                                  secureText1 =! secureText1 ;
                                  setState(() { });
                                },

                                icon: secureText1?
                                const Icon(Icons.visibility_off , color: Colors.grey,):
                                const Icon(Icons.visibility, color: Color(0xff5483B3),)
                            ),

                          ),

                        ),
                      ),

                      const SizedBox(height: 15),

                      const Text(
                        "Confirm Password",
                        style: TextStyle(
                          color: Color(0xff5483B3),
                          fontSize: 16,
                          fontWeight: FontWeight.w900,

                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 56.3,
                        child: TextFormField(
                          controller: confirmPasswordController,
                          validator: (input){
                            if(confirmPasswordController.text.isEmpty){
                              return " * Required ";
                            }
                            else if(confirmPasswordController.text.length<8){
                              return " Password Must be at Least 8 character";

                            }
                            else{
                              return null ;
                            }
                          },
                          obscureText: secureText2,
                          decoration: InputDecoration(
                            hintText: "",
                            border:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(17),
                            ),

                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17),
                                borderSide: const BorderSide(
                                  color: Color(0xff5483B3),
                                )
                            ),

                            suffixIcon: IconButton(
                                onPressed: (){
                                  secureText2 =! secureText2 ;
                                  setState(() { });
                                },
                                icon: secureText2?
                                const Icon(Icons.visibility_off , color: Colors.grey,):
                                const Icon(Icons.visibility, color: Color(0xff5483B3),)
                            ),

                          ),

                        ),
                      ),

                      const SizedBox(height:50 ),

                      GestureDetector(
                          onTap: (){
                            if (formKey.currentState!.validate()){
                              BlocProvider.of<AuthCubit>(context).resetPassword(code: widget.code, email: widget.email, password: passwordController.text, confirmPassword: confirmPasswordController.text);

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
                              "Reset",
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
            ),
          ),
        );
      },

    );
  }
}


// class ResetPassword extends StatefulWidget {
//   const ResetPassword({Key? key}) : super(key: key);
//
//   @override
//   State<ResetPassword> createState() => _ResetPasswordState();
// }
//
// class _ResetPasswordState extends State<ResetPassword> {
//   bool secureText1 = true ;
//   bool secureText2 = true ;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         centerTitle: true,
//         leading: IconButton(
//             onPressed: (){
//               Navigator.pop(context);
//             },
//             icon: Icon(Icons.arrow_back_ios, color: Color(0xff052659),
//             )
//         ),
//         title: Text(
//           "Reset Password" ,
//           style: TextStyle(
//             color: Color(0xff5483B3),
//             fontWeight: FontWeight.w900,
//             fontSize: 30,
//             //fontFamily: "Poppins"
//           ),
//         ),
//       ),
//
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.symmetric(vertical: 90),
//           child: Padding(
//             padding: EdgeInsets.all(30),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Enter new password",
//                   style: TextStyle(
//                     color: Color(0xff5483B3),
//                     fontSize: 16,
//                     fontWeight: FontWeight.w900,
//
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Container(
//                   height: 56.3,
//                   child: TextFormField(
//                     obscureText: secureText1,
//                     decoration: InputDecoration(
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
//                       ),
//
//                       suffixIcon: IconButton(
//                           onPressed: (){
//                             secureText1 =! secureText1 ;
//                             setState(() { });
//                           },
//                           icon: Icon(secureText1 ? Icons.visibility_off : Icons.visibility), color:Colors.grey),
//
//                     ),
//
//                   ),
//                 ),
//
//                 SizedBox(height: 15),
//
//                 Text(
//                   "Confirm Password",
//                   style: TextStyle(
//                     color: Color(0xff5483B3),
//                     fontSize: 16,
//                     fontWeight: FontWeight.w900,
//
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Container(
//                   height: 56.3,
//                   child: TextFormField(
//                     obscureText: secureText2,
//                     decoration: InputDecoration(
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
//                       ),
//
//                       suffixIcon: IconButton(
//                           onPressed: (){
//                             secureText2 =! secureText2 ;
//                             setState(() { });
//                           },
//                           icon: Icon(secureText2 ? Icons.visibility_off : Icons.visibility), color:Colors.grey),
//
//                     ),
//
//                   ),
//                 ),
//
//                 SizedBox(height:50 ),
//
//                 GestureDetector(
//                     onTap: (){
//
//                     },
//                     child: Container(
//                       alignment: Alignment.center,
//                       height: 56.3,
//                       decoration: BoxDecoration(
//                           color: Color(0xff052659),
//                           borderRadius: BorderRadius.circular(17)
//                       ),
//                       child: Text(
//                         "Reset",
//                         style: TextStyle(
//                             fontSize: 19,
//                             fontWeight: FontWeight.w900,
//                             color: Colors.white
//                         ),
//                       ),
//                     )
//                 ),
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }