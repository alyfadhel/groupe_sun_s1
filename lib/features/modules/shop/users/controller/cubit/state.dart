import 'package:group_sun_s1/features/modules/shop/users/data/models/login_model.dart';

abstract class LoginStates{}

class LoginInitialState extends LoginStates{}

class LoginChangeVisibilityIconState extends LoginStates{}

class LoginGetDataLoadingState extends LoginStates{}
class LoginGetDataSuccessState extends LoginStates{
  final LoginModel loginModel;

  LoginGetDataSuccessState(this.loginModel);
}
class LoginGetDataErrorState extends LoginStates{
  final String error;

  LoginGetDataErrorState(this.error);
}