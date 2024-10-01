import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_sun_s1/core/share/network/local/cache_helper.dart';
import 'package:group_sun_s1/core/share/themes/cubit/cubit.dart';
import 'package:group_sun_s1/core/share/widgets/my_button.dart';
import 'package:group_sun_s1/core/share/widgets/my_text_button.dart';
import 'package:group_sun_s1/core/share/widgets/my_text_form_field.dart';
import 'package:group_sun_s1/core/share/widgets/toast.dart';
import 'package:group_sun_s1/core/shop_layout/shop_layout.dart';
import 'package:group_sun_s1/features/modules/shop/users/controller/cubit/cubit.dart';
import 'package:group_sun_s1/features/modules/shop/users/controller/cubit/state.dart';
import 'package:group_sun_s1/main.dart';

class ShopLoginScreen extends StatelessWidget {
  const ShopLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginGetDataSuccessState) {
            if (state.loginModel.status) {
              showToast(
                msg: state.loginModel.message,
                state: ToastState.success,
              );
              CacheHelper.setData(
                key: 'token',
                value: state.loginModel.data!.token,
              ).then(
                (value) {
                  if (context.mounted) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShopLayout(),
                        //     MyApp(
                        //   startWidget: const ShopLayout(),
                        //   isDark: ThemeCubit.get(context).isDark,
                        // ),
                      ),
                    );
                  }
                },
              );
            } else {
              showToast(
                msg: state.loginModel.message,
                state: ToastState.error,
              );
            }
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(
                20.0,
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        Text(
                          'Login to browse hot offers',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 20.0, color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        MyTextFormField(
                          controller: cubit.emailController,
                          type: TextInputType.emailAddress,
                          text: 'email address',
                          prefix: Icons.email_outlined,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email must be not empty';
                            }
                            return null;
                          },
                          radius: 10.0,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        MyTextFormField(
                          controller: cubit.passwordController,
                          type: TextInputType.visiblePassword,
                          text: 'password',
                          prefix: Icons.lock_outline,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'password must be not empty';
                            }
                            return null;
                          },
                          radius: 10.0,
                          isPassword: cubit.isPassword,
                          suffix: cubit.suffix,
                          onPressed: () {
                            cubit.changeVisibility();
                          },
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! LoginGetDataLoadingState,
                          builder: (context) => MyButton(
                            onPressed: () {
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.getDataUse(
                                  email: cubit.emailController.text,
                                  password: cubit.passwordController.text,
                                );
                              }
                            },
                            text: 'login',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                ),
                          ),
                          fallback: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account ?!',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            MyTextButton(
                              onPressed: () {},
                              text: 'register',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: Colors.red,
                                    fontSize: 25,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
