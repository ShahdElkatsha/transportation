import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:transportation/features/auth_screens/reset_password.dart';

class Verify extends StatefulWidget {
  Verify({Key? key,
    required this.mobileNumberInVerify
  }) : super(key: key);

  String mobileNumberInVerify  ;


  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xff052659),),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text(
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
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/img_7.png",
                width: 400,
                height: 255,
                //alignment: Alignment.center,
              ),
              SizedBox(height: 40),

              Text(
                "Enter OTP",
                style: TextStyle(
                    color: Color(0xff5483B3),
                    fontWeight: FontWeight.w900,
                    fontSize: 26.3
                ),
              ),

              SizedBox(height: 8),

              Text(
                "An 4 digit OTP has been sent to",
                style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 8),

              Text(
                "${widget.mobileNumberInVerify}",
                style: TextStyle(fontSize: 16.4, fontWeight: FontWeight.bold , color: Color(0xff5483B3)
                ),
              ),
              SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 51,
                    width: 42,
                    child: TextFormField(
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
                              borderSide: BorderSide(
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
                              borderSide: BorderSide(
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
                              borderSide: BorderSide(
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
                              borderSide: BorderSide(
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
                              borderSide: BorderSide(
                                color: Color(0xff5483B3),
                              )
                          )
                      ),

                    ),
                  ),
                ],
              ),

              SizedBox(height: 25),

              GestureDetector(
                  onTap: (){
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPassword()));

                    Navigator.push(
                      context,
                      PageTransition(child: ResetPassword(), type: PageTransitionType.rightToLeft,duration: Duration(milliseconds: 300)),
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
                      "Verify",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w900,
                          color: Colors.white
                      ),
                    ),
                  )
              ),

              SizedBox(height: 20),

              Row(
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
  }
}