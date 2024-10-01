import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_sun_s1/core/share/const/const.dart';
import 'package:group_sun_s1/core/share/network/remote/dio_helper.dart';
import 'package:group_sun_s1/features/modules/shop/users/controller/cubit/state.dart';
import 'package:group_sun_s1/features/modules/shop/users/data/models/login_model.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;

  void changeVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginChangeVisibilityIconState());
  }

  LoginModel? loginModel;

  void getDataUse({
    required String email,
    required String password,
  }) {
    emit(LoginGetDataLoadingState());

    DioHelper.postData(
      url: loginEndPoint,
      data: {
        'email': email,
        'password': password,
      },
    )
        .then(
          (value) {
            loginModel = LoginModel.fromJson(value.data);
            print(value.data.toString());
            emit(LoginGetDataSuccessState(loginModel!));
          },
        )
        .catchError(
          (error) {
            emit(LoginGetDataErrorState(error.toString()));
                print(error.toString());
          },
        );
  }
}
