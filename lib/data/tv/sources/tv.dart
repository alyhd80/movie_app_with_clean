import 'package:dartz/dartz.dart';
import 'package:movie_app/core/constants/api_url.dart';
import 'package:movie_app/core/netword/dio_client.dart';
import 'package:movie_app/service_locator.dart';
import 'package:dio/dio.dart';

abstract class TVService {
  Future<Either> getPopularTV();
}

class TVApiServiceImpl extends TVService {
  @override
  Future<Either> getPopularTV() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.popularTV);

      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
