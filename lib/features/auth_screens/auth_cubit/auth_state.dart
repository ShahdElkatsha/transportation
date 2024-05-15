abstract class AuthStates{}


class AuthInitialState extends AuthStates{}

class RegisterLoadingState extends AuthStates{}
class RegisterSuccessState extends AuthStates{}
class FailedToRegisterState extends AuthStates{
  String? message ;
  FailedToRegisterState({required this.message});
}

class LoginLoadingState extends AuthStates{}
class LoginSuccessState extends AuthStates{}
class FailedToLoginState extends AuthStates{
  String? message ;
  FailedToLoginState({required this.message});
}

class VerifyFromRegisterLoadingState extends AuthStates{}
class VerifyFromRegisterSuccessState extends AuthStates{}
class FailedToVerifyFromRegisterState extends AuthStates{
  String? message ;
  FailedToVerifyFromRegisterState({required this.message});
}

class ForgotLoadingState extends AuthStates{}
class ForgotSuccessState extends AuthStates{
  String? code ;
  ForgotSuccessState({required this.code});
}
class FailedToForgotState extends AuthStates{
  String? message ;
  FailedToForgotState({required this.message});
}

class ResetPasswordLoadingState extends AuthStates{}
class ResetPasswordSuccessState extends AuthStates{}
class FailedToResetPasswordState extends AuthStates{
  String? message ;
  FailedToResetPasswordState({required this.message});
}