// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
//
// part 'auth_state.dart';
//
// class AuthCubit extends Cubit<AuthState> {
//   AuthCubit() : super(AuthInitial());



import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../../../core/network/local_network.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthStates>{
  AuthCubit () :super(AuthInitialState());


  //register
  Future<void> register({ required String email, required String name, required String phoneNumber, required String password, required String confirmPassword}) async {
    emit(RegisterLoadingState());

    try{
      Response response = await http.post(
          Uri.parse("http://10.0.2.2:5086/api/User/sign-up"),
          //Uri.parse("https://transportationsystem.runasp.net/api/User/sign-up"),
          //Uri.parse("http://localhost:5086/api/User/sign-up"),

          //headers: {HttpHeaders.authorizationHeader: "...", "Accept": "application/json"},
          headers: {
            'Content-Type': 'application/json'
          },

          body: json.encode({
            "email": email,
            "name": name,
            "phoneNumber": phoneNumber,
            "password": password,
            "confirmPassword": confirmPassword
          })
      );

      var responseBody = jsonDecode(response.body);

      if (responseBody["statusCode"]==200){
        debugPrint("User Registration success and his data ia : $responseBody ");
        emit(RegisterSuccessState());
      }
      else{
        debugPrint("Failed to Register, the reason is : ${responseBody["message"]}");
        emit(FailedToRegisterState(message: responseBody["message"]));
      }


    }
    catch(e){
      debugPrint("Failed To Register, The reason is : $e ");
      emit(FailedToRegisterState(message: e.toString()));
    }



  }

//***************************************************************************************************************

  void login({required String email , required String password}) async{
    emit(LoginLoadingState());

    try{
      Response response = await http.post(
          Uri.parse("http://10.0.2.2:5086/api/User/sign-in"),

          headers: {
            'Content-Type': 'application/json'
          },

          body: json.encode(
              {
                "email": email,
                "password": password
              }
          )

      );

      var responseBody = jsonDecode(response.body);

      if (responseBody["statusCode"]==200){
        debugPrint("User login success and his data is : $responseBody ");
        await CacheNetwork.insertToCache(key: "token", value: responseBody["body"]["token"]);
        emit(LoginSuccessState());
      }
      else if (responseBody["statusCode"] == 400){
        debugPrint("Failed to login, the reason is : ${responseBody["message"]}");
        emit(FailedToLoginState(message: responseBody["message"]));
      }


    }
    catch(e){
      emit(FailedToLoginState(message: e.toString()));

    }
  }

  //*************************************************************************************************

  void verifyFromRegister ({required String phoneNumber , required String email , required String verificationCode}) async{
    emit(VerifyFromRegisterLoadingState());

    try{
      Response response = await http.post(
          Uri.parse("http://10.0.2.2:5086/api/User/confirm-account"),

          headers: {
            'Content-Type': 'application/json'
          },

          body: json.encode(
              {
                "phoneNumber":phoneNumber,
                "email": email,
                "verificationCode":verificationCode
              }
          )

      );

      var responseBody = jsonDecode(response.body);

      if (responseBody["statusCode"]==200){
        debugPrint("User verify success and the response is : $responseBody ");
        emit(VerifyFromRegisterSuccessState());
      }
      else if (responseBody["statusCode"] == 400){
        debugPrint("Failed to verify, the reason is : ${responseBody["message"]}");
        emit(FailedToVerifyFromRegisterState(message: responseBody["message"]));
      }


    }
    catch(e){
      emit(FailedToVerifyFromRegisterState(message: e.toString()));

    }
  }

  //*********************************************************************************************

  void forgot({required String email}) async{
    emit(ForgotLoadingState());

    try{
      Response response = await http.post(
          Uri.parse("http://10.0.2.2:5086/api/User/forget-password"),

          headers: {
            'Content-Type': 'application/json'
          },

          body: json.encode(
              {
                "email": email,
              }
          )

      );

      var responseBody = jsonDecode(response.body);

      if (responseBody["statusCode"]==200){
        debugPrint("User forgot password success, the response is : $responseBody ");
        emit(ForgotSuccessState(code: responseBody["body"]));
      }
      else if (responseBody["statusCode"] == 400){
        debugPrint("Failed to forgot, the reason is : ${responseBody["message"]}");
        emit(FailedToForgotState(message: responseBody["message"]));
      }


    }
    catch(e){
      emit(FailedToForgotState(message: e.toString()));

    }
  }

  //**********************************************************************************************

  void resetPassword({required String code , required String email , required String password , required String confirmPassword}) async{
    emit(ResetPasswordLoadingState());

    try{
      Response response = await http.post(
          Uri.parse("http://10.0.2.2:5086/api/User/reset-Password"),

          headers: {
            'Content-Type': 'application/json'
          },

          body: json.encode(
              {
                "code": code,
                "email": email,
                "password": password,
                "confirmPassword": confirmPassword
              }
          )

      );

      var responseBody = jsonDecode(response.body);

      if (responseBody["statusCode"]==200){
        debugPrint("User Reset Password success and his data ia : $responseBody ");
        emit(ResetPasswordSuccessState());
      }
      else if (responseBody["statusCode"] == 400){
        debugPrint("Failed to ResetPassword, the reason is : ${responseBody["message"]}");
        emit(FailedToResetPasswordState(message: responseBody["message"]));
      }


    }
    catch(e){
      emit(FailedToResetPasswordState(message: e.toString()));

    }
  }




}
