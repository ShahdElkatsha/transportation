import"package:flutter/material.dart";
import "package:page_transition/page_transition.dart";

import "../../main_page/home_screen.dart";
import "../forgot.dart";
import "../register/register.dart";
// import "../register_screen/register.dart";


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  GlobalKey <FormState> formstate = GlobalKey() ;

  String? mobileNumber ;
  String? password ;

  bool secureText = true ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
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
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/logo/logo2.png"),
                Text(
                  "Enter your Email",
                  style: TextStyle(
                    color: Color(0xff5483B3),
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 56.3,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: "",
                        border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(17),
                        ),

                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17),
                            borderSide: BorderSide(
                              color: Color(0xff5483B3),
                            )
                        )
                    ),

                  ),
                ),

                SizedBox(height: 15),

                Text(
                  "Enter your Password",
                  style: TextStyle(
                    color: Color(0xff5483B3),
                    fontSize: 16,
                    fontWeight: FontWeight.w900,


                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 56.3,
                  child: TextFormField(
                    obscureText: secureText,
                    decoration: InputDecoration(
                      hintText: "",
                      border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(17)
                      ),

                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(17),
                          borderSide: BorderSide(
                            color: Color(0xff5483B3),
                          )
                      ),


                      suffixIcon: IconButton(
                          onPressed: (){
                            secureText =! secureText ;
                            setState(() { });
                          },
                          icon: secureText ?
                          Icon(Icons.visibility_off , color: Colors.grey,):
                          Icon(Icons.visibility , color: Color(0xff5483B3),)
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        PageTransition(child: Forgot(), type: PageTransitionType.rightToLeft,duration: Duration(milliseconds: 300)),
                      ) ;


                    },
                    child: Text(
                      "forgot password?",
                      style: TextStyle(
                          color: Color(0xff5483B3),
                          fontSize: 14,
                          fontWeight: FontWeight.w500

                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15),

                GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(
                        context,
                        PageTransition(child: HomeView(), type: PageTransitionType.rightToLeft ,duration: Duration(milliseconds: 300)),
                      ) ;
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 56.3,
                      decoration: BoxDecoration(
                          color: Color(0xff052659),
                          borderRadius: BorderRadius.circular(17)
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w900,
                            color: Colors.white
                        ),
                      ),
                    )
                ),

                SizedBox(height: 10),
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
                      SizedBox(width: 5,),


                      GestureDetector(
                        onTap: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context){
                          //   return Register();
                          // }));

                          Navigator.push(
                            context,
                            PageTransition(child: Register(), type: PageTransitionType.rightToLeft ,duration: Duration(milliseconds: 300)),
                          ) ;
                        },
                        child: Text("Sign Up",
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
      backgroundColor: Colors.white,
    );
  }
}