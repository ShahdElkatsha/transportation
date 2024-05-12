import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../main_page/home_screen.dart';
import '../login/login.dart';
// import '../login_screen/login.dart';
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool secureText1 = true ;
  bool secureText2 = true ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: Color(0xff052659),
            )
        ),
        centerTitle: true,
        title: Text(
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
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter your Mobile Number",
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
                  keyboardType: TextInputType.number,
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
                "Enter your Email",
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
                    obscureText: secureText1,
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
                      ),

                      suffixIcon: IconButton(
                          onPressed: (){
                            secureText1 =! secureText1 ;
                            setState(() { });
                          },
                          icon: secureText1?
                          Icon(Icons.visibility_off , color: Colors.grey,):
                          Icon(Icons.visibility, color: Color(0xff5483B3),)

                      ),

                    ),
                  )
              ),

              SizedBox(height: 15),

              Text(
                "Re-Enter your password",
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
                  obscureText: secureText2,
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
                    ),

                    suffixIcon: IconButton(
                        onPressed: (){
                          secureText2 =! secureText2 ;
                          setState(() { });
                        },
                        icon: secureText2?
                        Icon(Icons.visibility_off , color: Colors.grey,):
                        Icon(Icons.visibility, color: Color(0xff5483B3),)

                    ),
                  ),

                ),
              ),

              SizedBox(height: 40),

              GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(
                      context,
                      PageTransition(child: HomeView(), type: PageTransitionType.fade ,duration: Duration(milliseconds: 300)),
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
                      "Sign Up",
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
                    Text("Already have an account?",
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    SizedBox(width: 5,),


                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return Login();
                        }));
                      },
                      child: Text("Login",
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
    );
  }
}