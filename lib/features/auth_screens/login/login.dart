import "package:flutter/cupertino.dart";
import"package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:page_transition/page_transition.dart";
import "package:transportation/core/constants.dart";
import "package:transportation/features/Home/presentation/views/home_screen.dart";
import "../auth_cubit/auth_cubit.dart";
import "../auth_cubit/auth_state.dart";
import "../forgot.dart";
import "../register/register.dart";


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool secureText = true ;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  GlobalKey <FormState> formKey = GlobalKey() ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "Login" ,
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
          child: Padding(
            padding:const EdgeInsets.all(30),
            child: Form(
                key: formKey,
                child:BlocConsumer<AuthCubit,AuthStates>(
                  listener: (context,state) {
                    if (state is LoginLoadingState){
                      showDialog(context: context, builder: (context)=>AlertDialog(
                        content: AnimatedContainer(
                          duration: Duration(seconds: 2),
                          curve: Curves.easeIn,
                          child: const Row(
                            children:
                            [
                              CupertinoActivityIndicator(color: mediunColor),
                              SizedBox(width: 12.5,),
                              Text("wait",style: TextStyle(color:darkerColor,fontWeight: FontWeight.w500),),
                            ],
                          ),

                        ),
                      ));
                    }
                    else if(state is LoginSuccessState){

                      Navigator.pop(context);   // عشان يخرج من alertDialog
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  HomeView()));
                    }
                    else if(state is FailedToLoginState){
                      showDialog(context: context, builder: (context)=> AlertDialog(
                        content: Text("${state.message}", style:const TextStyle(color: Colors.white),textAlign: TextAlign.center),
                        backgroundColor: const Color(0xffD45161),
                        icon: const Icon(Icons.info , color: Colors.white,),

                      ));


                    }

                  },
                  builder: (context, state){
                    return  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/logo/logo2.png"),
                        const Text(
                          "Enter your Email",
                          style: TextStyle(
                            color: mediunColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: emailController,
                          validator: (input){
                            if(emailController.text.isEmpty){
                              return " * Required ";
                            }
                            else if(!emailController.text.contains("@gmail.com")){
                              return " Email Must Contain ( @gmail.com )" ;

                            }
                            else{
                              return null ;
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
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

                        const SizedBox(height: 15),

                        const Text(
                          "Enter your Password",
                          style: TextStyle(
                            color: Color(0xff5483B3),
                            fontSize: 16,
                            fontWeight: FontWeight.w900,


                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
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
                          obscureText: secureText,
                          decoration: InputDecoration(
                            contentPadding:const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                            hintText: "",
                            border:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17)
                            ),

                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17),
                                borderSide:const BorderSide(
                                  color: Color(0xff5483B3),
                                )
                            ),


                            suffixIcon: IconButton(
                                onPressed: (){
                                  secureText =! secureText ;
                                  setState(() { });
                                },
                                icon: secureText ?
                                const Icon(Icons.visibility_off , color: Colors.grey,):
                                const Icon(Icons.visibility , color: Color(0xff5483B3),)
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                PageTransition(child:const Forgot(), type: PageTransitionType.rightToLeft,duration: const Duration(milliseconds: 300)),
                              ) ;


                            },
                            child: const Text(
                              "forgot password?",
                              style: TextStyle(
                                  color: Color(0xff5483B3),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500

                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 15),

                        GestureDetector(
                            onTap: (){
                              if (formKey.currentState!.validate()){
                                BlocProvider.of<AuthCubit>(context).login(email: emailController.text, password: passwordController.text);

                              }

                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 56.3,
                              decoration: BoxDecoration(
                                  color: Color(0xff052659),
                                  borderRadius: BorderRadius.circular(17)
                              ),
                              child: Text(
                                state is LoginLoadingState ? "Loading..." : "Login",
                                style: const TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white
                                ),
                              ),
                            )
                        ),

                        const SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              Text("Don’t have an account?",
                                  style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                  )
                              ),
                              const SizedBox(width: 5,),


                              GestureDetector(
                                onTap: (){
                                  // Navigator.push(context, MaterialPageRoute(builder: (context){
                                  //   return Register();
                                  // }));

                                  Navigator.push(
                                    context,
                                    PageTransition(child: Register(), type: PageTransitionType.rightToLeft ,duration: const Duration(milliseconds: 300)),
                                  ) ;
                                },
                                child:const Text("Sign Up",
                                  style: TextStyle(
                                      color: Color(0xff5483B3),
                                      fontWeight: FontWeight.w900, fontSize: 16.4),
                                ),
                              )
                            ]
                        ),

                      ],

                    );
                  },
                )
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}














// import"package:flutter/material.dart";
// import "package:page_transition/page_transition.dart";
// import "../../Home/presentation/views/home_screen.dart";
// import "../forgot.dart";
// import "../register/register.dart";
//
//
// class Login extends StatefulWidget {
//   const Login({Key? key}) : super(key: key);
//
//   @override
//   State<Login> createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//
//   GlobalKey <FormState> formstate = GlobalKey() ;
//
//   String? mobileNumber ;
//   String? password ;
//
//   bool secureText = true ;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         centerTitle: true,
//         title: Text(
//           "Login" ,
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
//           child: Padding(
//             padding: EdgeInsets.all(30),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Image.asset("assets/logo/logo2.png"),
//                 Text(
//                   "Enter your Email",
//                   style: TextStyle(
//                     color: Color(0xff5483B3),
//                     fontWeight: FontWeight.w900,
//                     fontSize: 16,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Container(
//                   height: 56.3,
//                   child: TextFormField(
//                     keyboardType: TextInputType.emailAddress,
//                     decoration: InputDecoration(
//                         hintText: "",
//                         border:OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(17),
//                         ),
//
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(17),
//                             borderSide: BorderSide(
//                               color: Color(0xff5483B3),
//                             )
//                         )
//                     ),
//
//                   ),
//                 ),
//
//                 SizedBox(height: 15),
//
//                 Text(
//                   "Enter your Password",
//                   style: TextStyle(
//                     color: Color(0xff5483B3),
//                     fontSize: 16,
//                     fontWeight: FontWeight.w900,
//
//
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Container(
//                   height: 56.3,
//                   child: TextFormField(
//                     obscureText: secureText,
//                     decoration: InputDecoration(
//                       hintText: "",
//                       border:OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(17)
//                       ),
//
//                       focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(17),
//                           borderSide: BorderSide(
//                             color: Color(0xff5483B3),
//                           )
//                       ),
//
//
//                       suffixIcon: IconButton(
//                           onPressed: (){
//                             secureText =! secureText ;
//                             setState(() { });
//                           },
//                           icon: secureText ?
//                           Icon(Icons.visibility_off , color: Colors.grey,):
//                           Icon(Icons.visibility , color: Color(0xff5483B3),)
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 SizedBox(height: 10),
//
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: GestureDetector(
//                     onTap: (){
//                       Navigator.push(
//                         context,
//                         PageTransition(child: Forgot(), type: PageTransitionType.rightToLeft,duration: Duration(milliseconds: 300)),
//                       ) ;
//
//
//                     },
//                     child: Text(
//                       "forgot password?",
//                       style: TextStyle(
//                           color: Color(0xff5483B3),
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500
//
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 SizedBox(height: 15),
//
//                 GestureDetector(
//                     onTap: (){
//                       Navigator.pushReplacement(
//                         context,
//                         PageTransition(child: HomeView(), type: PageTransitionType.rightToLeft ,duration: Duration(milliseconds: 300)),
//                       ) ;
//                     },
//                     child: Container(
//                       alignment: Alignment.center,
//                       height: 56.3,
//                       decoration: BoxDecoration(
//                           color: Color(0xff052659),
//                           borderRadius: BorderRadius.circular(17)
//                       ),
//                       child: Text(
//                         "Login",
//                         style: TextStyle(
//                             fontSize: 19,
//                             fontWeight: FontWeight.w900,
//                             color: Colors.white
//                         ),
//                       ),
//                     )
//                 ),
//
//                 SizedBox(height: 10),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children:[
//                       Text("Don’t have an account?",
//                           style: TextStyle(
//                               color: Colors.grey[700],
//                               fontSize: 15,
//                               fontWeight: FontWeight.bold
//                           )
//                       ),
//                       SizedBox(width: 5,),
//
//
//                       GestureDetector(
//                         onTap: (){
//                           // Navigator.push(context, MaterialPageRoute(builder: (context){
//                           //   return Register();
//                           // }));
//
//                           Navigator.push(
//                             context,
//                             PageTransition(child: Register(), type: PageTransitionType.rightToLeft ,duration: Duration(milliseconds: 300)),
//                           ) ;
//                         },
//                         child: Text("Sign Up",
//                           style: TextStyle(
//                               color: Color(0xff5483B3),
//                               fontWeight: FontWeight.w900, fontSize: 16.4),
//                         ),
//                       )
//                     ]
//                 ),
//
//               ],
//
//             ),
//           ),
//         ),
//       ),
//       backgroundColor: Colors.white,
//     );
//   }
// }