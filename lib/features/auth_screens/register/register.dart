import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../auth_cubit/auth_cubit.dart';
import '../auth_cubit/auth_state.dart';
import '../login/login.dart';
import '../verify.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  String countryCode = "+2";

  bool secureText1 = true ;
  bool secureText2 = true ;

  bool registerScreen = true ;

  final nameController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final reEnteringPasswordController = TextEditingController();

  GlobalKey <FormState> formKey = GlobalKey() ;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthStates>(
      listener: (context, state)async{
        if (state is RegisterLoadingState){
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
        else if(state is RegisterSuccessState){

          Navigator.pop(context);   // عشان يخرج من alertDialog
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  Verify(mobileNumberInVerify: countryCode+mobileNumberController.text , emailInVerify: emailController.text , screens: registerScreen)));
        }
        else if(state is FailedToRegisterState){
          showDialog(context: context, builder: (context)=> AlertDialog(
            content: Text("${state.message}", style:const TextStyle(color: Colors.white),textAlign: TextAlign.center),
            backgroundColor: const Color(0xffD45161),
            icon: const Icon(Icons.info , color: Colors.white,),

          ));


        }
      },
      builder: (context, state){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon:const Icon(Icons.arrow_back_ios, color: Color(0xff052659),
                )
            ),
            centerTitle: true,
            title: const Text(
              "Register" ,
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
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Enter your Name",
                      style: TextStyle(
                        color: Color(0xff5483B3),
                        fontSize: 16,
                        fontWeight: FontWeight.w900,

                      ),
                    ),
                    const SizedBox(height: 7),
                    TextFormField(
                      controller: nameController,
                      validator: (input){
                        if(nameController.text.isEmpty){
                          return " * Required ";
                        }
                        else{
                          return null ;
                        }
                      },
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
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
                      "Enter your Mobile Number",
                      style: TextStyle(
                        color: Color(0xff5483B3),
                        fontSize: 16,
                        fontWeight: FontWeight.w900,

                      ),
                    ),
                    const SizedBox(height: 7),
                    TextFormField(
                      controller: mobileNumberController,
                      validator: (input){
                        if(mobileNumberController.text.isEmpty){
                          return " * Required ";
                        }
                        else{
                          return null ;
                        }
                      },
                      keyboardType: TextInputType.number,
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
                      "Enter your Email",
                      style: TextStyle(
                        color: Color(0xff5483B3),
                        fontSize: 16,
                        fontWeight: FontWeight.w900,

                      ),
                    ),
                    const SizedBox(height: 7),
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
                          //hintText: "   your email must contain (@gmail.com)",
                          hintStyle: const TextStyle(fontSize: 14,),
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
                    const SizedBox(height: 7),
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
                      obscureText: secureText1,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
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
                              secureText1 =! secureText1 ;
                              setState(() { });
                            },
                            icon: secureText1?
                            const Icon(Icons.visibility_off , color: Colors.grey,):
                            const Icon(Icons.visibility, color: Color(0xff5483B3),)

                        ),

                      ),
                    ),

                    const SizedBox(height: 15),

                    const Text(
                      "Re-Enter your password",
                      style: TextStyle(
                        color: Color(0xff5483B3),
                        fontSize: 16,
                        fontWeight: FontWeight.w900,

                      ),
                    ),
                    const SizedBox(height: 7),
                    TextFormField(
                      controller:reEnteringPasswordController,
                      validator: (input){
                        if(reEnteringPasswordController.text.isEmpty){
                          return " * Required ";
                        }
                        else if(reEnteringPasswordController.text.length<8){
                          return " Password Must be at Least 8 character";

                        }
                        else{
                          return null ;
                        }
                      },
                      obscureText: secureText2,
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

                    const SizedBox(height: 30),

                    InkWell(

                        onTap: (){
                          if (formKey.currentState!.validate()){
                            //Register
                            BlocProvider.of<AuthCubit>(context).register( email: emailController.text, name: nameController.text,phoneNumber:countryCode+mobileNumberController.text, password: passwordController.text, confirmPassword: reEnteringPasswordController.text);
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 56.3,
                          decoration: BoxDecoration(
                              color: const Color(0xff052659),
                              borderRadius: BorderRadius.circular(17)
                          ),
                          child: Text(
                            state is RegisterLoadingState ? "Loading..." : "Sign Up",
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
                          Text("Already have an account?",
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                              )
                          ),
                          const SizedBox(width: 5,),


                          InkWell(
                            onTap: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                return Login();
                              }));

                            },
                            child:const Text("Login",
                              style: TextStyle(
                                  color: Color(0xff5483B3),
                                  fontWeight: FontWeight.w900, fontSize: 16.4),
                            ),
                          )
                        ]
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },

    );
  }
}














// import 'package:flutter/material.dart';
// import 'package:page_transition/page_transition.dart';
// import '../../Home/presentation/views/home_screen.dart';
// import '../login/login.dart';
// // import '../login_screen/login.dart';
// class Register extends StatefulWidget {
//   const Register({Key? key}) : super(key: key);
//
//   @override
//   State<Register> createState() => _RegisterState();
// }
//
// class _RegisterState extends State<Register> {
//   bool secureText1 = true ;
//   bool secureText2 = true ;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         leading: IconButton(
//             onPressed: (){
//               Navigator.pop(context);
//             },
//             icon: Icon(Icons.arrow_back_ios, color: Color(0xff052659),
//             )
//         ),
//         centerTitle: true,
//         title: Text(
//           "Register" ,
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
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Enter your Mobile Number",
//                 style: TextStyle(
//                   color: Color(0xff5483B3),
//                   fontSize: 16,
//                   fontWeight: FontWeight.w900,
//
//                 ),
//               ),
//               SizedBox(height: 10),
//               Container(
//                 height: 56.3,
//                 child: TextFormField(
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
//
//                   ),
//
//                 ),
//               ),
//
//               SizedBox(height: 15),
//
//               Text(
//                 "Enter your Email",
//                 style: TextStyle(
//                   color: Color(0xff5483B3),
//                   fontSize: 16,
//                   fontWeight: FontWeight.w900,
//
//                 ),
//               ),
//               SizedBox(height: 10),
//               Container(
//                 height: 56.3,
//                 child: TextFormField(
//                   keyboardType: TextInputType.emailAddress,
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
//
//                   ),
//
//                 ),
//               ),
//
//               SizedBox(height: 15),
//
//               Text(
//                 "Enter your Password",
//                 style: TextStyle(
//                   color: Color(0xff5483B3),
//                   fontSize: 16,
//                   fontWeight: FontWeight.w900,
//
//                 ),
//               ),
//               SizedBox(height: 10),
//               Container(
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
//                           icon: secureText1?
//                           Icon(Icons.visibility_off , color: Colors.grey,):
//                           Icon(Icons.visibility, color: Color(0xff5483B3),)
//
//                       ),
//
//                     ),
//                   )
//               ),
//
//               SizedBox(height: 15),
//
//               Text(
//                 "Re-Enter your password",
//                 style: TextStyle(
//                   color: Color(0xff5483B3),
//                   fontSize: 16,
//                   fontWeight: FontWeight.w900,
//
//                 ),
//               ),
//               SizedBox(height: 10),
//               Container(
//                 height: 56.3,
//                 child: TextFormField(
//                   obscureText: secureText2,
//                   decoration: InputDecoration(
//                     hintText: "",
//                     border:OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(17),
//                     ),
//
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(17),
//                         borderSide: BorderSide(
//                           color: Color(0xff5483B3),
//                         )
//                     ),
//
//                     suffixIcon: IconButton(
//                         onPressed: (){
//                           secureText2 =! secureText2 ;
//                           setState(() { });
//                         },
//                         icon: secureText2?
//                         Icon(Icons.visibility_off , color: Colors.grey,):
//                         Icon(Icons.visibility, color: Color(0xff5483B3),)
//
//                     ),
//                   ),
//
//                 ),
//               ),
//
//               SizedBox(height: 40),
//
//               GestureDetector(
//                   onTap: (){
//                     Navigator.pushReplacement(
//                       context,
//                       PageTransition(child: HomeView(), type: PageTransitionType.fade ,duration: Duration(milliseconds: 300)),
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
//                       "Sign Up",
//                       style: TextStyle(
//                           fontSize: 19,
//                           fontWeight: FontWeight.w900,
//                           color: Colors.white
//                       ),
//                     ),
//                   )
//               ),
//               SizedBox(height: 10),
//               Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children:[
//                     Text("Already have an account?",
//                         style: TextStyle(
//                             color: Colors.grey[700],
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold
//                         )
//                     ),
//                     SizedBox(width: 5,),
//
//
//                     GestureDetector(
//                       onTap: (){
//                         Navigator.push(context, MaterialPageRoute(builder: (context){
//                           return Login();
//                         }));
//                       },
//                       child: Text("Login",
//                         style: TextStyle(
//                             color: Color(0xff5483B3),
//                             fontWeight: FontWeight.w900, fontSize: 16.4),
//                       ),
//                     )
//                   ]
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }