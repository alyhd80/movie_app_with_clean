import 'package:get_it/get_it.dart';
import 'package:movie_app/core/netword/dio_client.dart';
import 'package:movie_app/data/auth/repositories/auth.dart';
import 'package:movie_app/data/auth/sources/auth_api_service.dart';
import 'package:movie_app/domain/repositories/auth.dart';
import 'package:movie_app/domain/use_cases/is_logged_in.dart';
import 'package:movie_app/domain/use_cases/signin.dart';
import 'package:movie_app/domain/use_cases/signup.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  /// services
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());

  ///repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  ///Usecases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());


}
