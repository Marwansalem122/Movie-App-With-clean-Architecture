import 'package:movie_app/core/error/api_constant.dart';
import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/core/network/error_message_mode.dart';
import 'package:movie_app/movie/data/models/movie_mode.dart';
import 'package:dio/dio.dart';

abstract class BaseMovieRemoteDataSourse {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
}

class MovieRemoteDataSourse implements BaseMovieRemoteDataSourse {
  Dio dio = Dio();

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await dio.get(ApiConstant.NOWPLAYINGPATH);
    // debugPrint(response.data.toString());
    if (response.statusCode == 200) {
      final List<MovieModel> movies = [];
      for (var item in response.data['results']) {
        movies.add(MovieModel.fromJson(item));
      }
      return movies;
    } else {
      throw ServiceException(
        errorMessageMode: ErrorMessageMode.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await dio.get(ApiConstant.POPULARPATH);
    if (response.statusCode == 200) {
      final List<MovieModel> movies = [];
      for (var item in response.data['results']) {
        movies.add(MovieModel.fromJson(item));
      }
      return movies;
    } else {
      throw ServiceException(
        errorMessageMode: ErrorMessageMode.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await dio.get(ApiConstant.TOPRATEDPATH);
    if (response.statusCode == 200) {
      final List<MovieModel> movies = [];
      for (var item in response.data['results']) {
        movies.add(MovieModel.fromJson(item));
      }
      return movies;
    } else {
      throw ServiceException(
        errorMessageMode: ErrorMessageMode.fromJson(response.data),
      );
    }
  }
}
