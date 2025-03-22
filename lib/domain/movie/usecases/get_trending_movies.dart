import 'package:movie_app/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/movie/repositories/movie.dart';
import 'package:movie_app/service_locator.dart';

class GetTrendingMoviesUseCase extends UseCase<Either, dynamic> {


  @override
  Future<Either> call({ params}) async {
    return await sl<MovieRepository>().getTrendingMovies();
  }
}
