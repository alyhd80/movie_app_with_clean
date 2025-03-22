import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/helper/message/display_message.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/core/config/theme/app_colors.dart';
import 'package:movie_app/data/auth/models/signup_req_params.dart';
import 'package:movie_app/domain/auth/use_cases/signup.dart';
import 'package:movie_app/presentation/home/pages/home.dart';
import 'package:movie_app/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          minimum: EdgeInsets.only(top: 100, right: 16, left: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _SignUpText(),
              const SizedBox(
                height: 30,
              ),
              _emailField(),
              const SizedBox(
                height: 20,
              ),
              _passwordField(),
              const SizedBox(
                height: 60,
              ),
              _signInButton(context),
              const SizedBox(
                height: 20,
              ),
              _signInText(context)
            ],
          )),
    );
  }

  Widget _SignUpText() {
    return Text(
      'Sign Up',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailController,
      decoration: const InputDecoration(hintText: "Email"),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: _password,
      decoration: const InputDecoration(hintText: "Password"),
    );
  }

  Widget _signInButton(BuildContext context) {
    return ReactiveButton(
        title: "Sign In",
        activeColor: AppColors.primary,
        onPressed: () async {
          sl<SignupUseCase>()
              .call(
            params: SignupReqParams(
              email: _emailController.text,
              password: _password.text,
            ),
          )
              .then((result) {
            result.fold(
              (error) {
                DisplayMessage.errorMessage(error, context);
              },
              (data) {
                print('Success: $data');
                AppNavigator.pushAndRemove(context, const HomePage());
              },
            );
          });
        },
        onSuccess: () {},
        onFailure: (error) {});
  }

  Widget _signInText(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(text: "Do you have account?"),
      TextSpan(
          text: " Sign In",
          style: TextStyle(color: Colors.blue),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.of(context).pop();
            }),
    ]));
  }
}
