import 'package:dartz/dartz.dart';
import 'package:movie_app/core/constants/api_url.dart';
import 'package:movie_app/core/netword/dio_client.dart';
import 'package:movie_app/service_locator.dart';
import 'package:dio/dio.dart';

abstract class MovieService {
  Future<Either> getTrendingMovie();

  Future<Either> getNowPlayingMovies();
}

class MovieApiServiceImpl extends MovieService {
  @override
  Future<Either> getTrendingMovie() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.trendingMovies);

      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.nowPlayingMovies);

      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
