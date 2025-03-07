import 'package:movie_app/core/error/api_constant.dart';
import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/core/network/error_message_mode.dart';
import 'package:movie_app/movie/data/models/movie_detail_model.dart';
import 'package:movie_app/movie/data/models/movie_mode.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/movie/data/models/recommendation_mode.dart';
import 'package:movie_app/movie/domain/usecases/get_movie_details_use_case.dart';
import 'package:movie_app/movie/domain/usecases/get_recommendation_use_case.dart';

abstract class BaseMovieRemoteDataSourse {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);
  Future<List<RecommendationModel>> getRecommendation(
    RecommendationParameters parameters,
  );
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

  @override
  Future<MovieDetailsModel> getMovieDetails(
    MovieDetailsParameters parameters,
  ) async {
    final response = await dio.get(
      ApiConstant.movieDetailsPath(parameters.movieId),
    );
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServiceException(
        errorMessageMode: ErrorMessageMode.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(
    RecommendationParameters parameters,
  ) async {
    final response = await dio.get(
      ApiConstant.recommendationPath(parameters.id),
    );
    if (response.statusCode == 200) {
      final List<RecommendationModel> recommendations = [];
      for (var item in response.data['results']) {
        recommendations.add(RecommendationModel.fromJson(item));
      }
      return recommendations;
    } else {
      throw ServiceException(
        errorMessageMode: ErrorMessageMode.fromJson(response.data),
      );
      
    }
  }
}
