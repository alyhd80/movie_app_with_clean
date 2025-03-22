import 'package:movie_app/domain/auth/use_cases/is_logged_in.dart';
import 'package:movie_app/presentation/splash/bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/service_locator.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  Future<void> appStarted() async {
    print("---------come heree");
    await Future.delayed(Duration(seconds: 2));

    var isLoggedIn = await sl<IsLoggedInUseCase>().call();
    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}
