import 'package:get_it/get_it.dart';
import 'package:movie_app/core/netword/dio_client.dart';
import 'package:movie_app/data/auth/repositories/auth.dart';
import 'package:movie_app/data/auth/sources/auth_api_service.dart';
import 'package:movie_app/data/movie/repositories/movie.dart';
import 'package:movie_app/data/movie/sources/movie.dart';
import 'package:movie_app/data/tv/repositories/tv.dart';
import 'package:movie_app/data/tv/sources/tv.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';
import 'package:movie_app/domain/auth/use_cases/is_logged_in.dart';
import 'package:movie_app/domain/auth/use_cases/signin.dart';
import 'package:movie_app/domain/auth/use_cases/signup.dart';
import 'package:movie_app/domain/movie/repositories/movie.dart';
import 'package:movie_app/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:movie_app/domain/movie/usecases/get_trending_movies.dart';
import 'package:movie_app/domain/tv/repositories/tv.dart';
import 'package:movie_app/domain/tv/use_cases/get_popular_tv.dart';


final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  /// services
  sl.registerSingleton<AuthService>(AuthApiServiceImpl());
  sl.registerSingleton<MovieService>(MovieApiServiceImpl());
  sl.registerSingleton<TVService>(TVApiServiceImpl());

  ///repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());
  sl.registerSingleton<TVRepository>(TVRepositoryImpl());

  ///Usecases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetTrendingMoviesUseCase>(GetTrendingMoviesUseCase());
  sl.registerSingleton<GetNowPlayingMoviesUseCase>(GetNowPlayingMoviesUseCase());
  sl.registerSingleton<GetPopularTvUseCase>(GetPopularTvUseCase());

}
