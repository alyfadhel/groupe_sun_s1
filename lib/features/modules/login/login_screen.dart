import 'package:flutter/material.dart';
import 'package:group_sun_s1/core/share/widgets/my_button.dart';
import 'package:group_sun_s1/core/share/widgets/my_text_button.dart';
import 'package:group_sun_s1/core/share/widgets/my_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool isPassword = true;
var emailController = TextEditingController();
var passwordController = TextEditingController();
var formKey = GlobalKey<FormState>();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          20.0,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  const Text(
                    'Login to browse hot offers',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  MyTextFormField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    text: 'email',
                    prefix: Icons.email,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email must not be empty';
                      }
                      return null;
                    },
                    radius: 15.0,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  MyTextFormField(
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    text: 'password',
                    prefix: Icons.lock,
                    suffix: isPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password must not be empty';
                      }
                      return null;
                    },
                    radius: 15.0,
                    isPassword: isPassword,
                    onPressed: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    onFieldSubmitted: (value)
                    {
                      if(formKey.currentState!.validate()){
                        print(emailController.text);
                        print(passwordController.text);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  MyButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        print(emailController.text);
                        print(passwordController.text);
                      }
                    },
                    text: 'login',
                    style: Theme.of(context).textTheme.titleLarge,
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
                      MyTextButton(onPressed: (){}, text: 'register', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.blue, fontSize: 25),),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
