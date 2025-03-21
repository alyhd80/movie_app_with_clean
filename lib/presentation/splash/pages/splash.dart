import 'package:flutter/material.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/core/config/asssets/app_imagess.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/auth/pages/signin.dart';
import 'package:movie_app/presentation/home/pages/home.dart';
import 'package:movie_app/presentation/splash/bloc/splash_cubit.dart';
import 'package:movie_app/presentation/splash/bloc/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
         print("-----------state");
          print(state);
          if (state is UnAuthenticated) {
            print("-------UnAuthenticated");

            AppNavigator.pushReplacement(context, const SignInPage());
          }

          if (state is Authenticated) {
            print("-------Authenticated");
            AppNavigator.pushReplacement(context, const HomePage());
          }
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImages.splashBackground))),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color(0xff1A1B20).withValues(alpha: 0),
                    Color(0xff1A1B20)
                  ])),
            )
          ],
        ),
      ),
    );
  }
}
