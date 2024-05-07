import 'package:flutter/material.dart';


class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool secureText1 = true ;
  bool secureText2 = true ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: Color(0xff052659),
            )
        ),
        title: Text(
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
          padding: EdgeInsets.symmetric(vertical: 90),
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter new password",
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
                          icon: Icon(secureText1 ? Icons.visibility_off : Icons.visibility), color:Colors.grey),

                    ),

                  ),
                ),

                SizedBox(height: 15),

                Text(
                  "Confirm Password",
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
                          icon: Icon(secureText2 ? Icons.visibility_off : Icons.visibility), color:Colors.grey),

                    ),

                  ),
                ),

                SizedBox(height:50 ),

                GestureDetector(
                    onTap: (){

                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 56.3,
                      decoration: BoxDecoration(
                          color: Color(0xff052659),
                          borderRadius: BorderRadius.circular(17)
                      ),
                      child: Text(
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
    );
  }
}