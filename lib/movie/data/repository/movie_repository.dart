import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movie/data/datasourse/movie_remote_data_sourse.dart';
import 'package:movie_app/movie/domain/entities/movie.dart';
import 'package:movie_app/movie/domain/entities/movie_detail.dart';
import 'package:movie_app/movie/domain/entities/recommendation.dart';
import 'package:movie_app/movie/domain/repository/base_movie_repository.dart';
import 'package:movie_app/movie/domain/usecases/get_movie_details_use_case.dart';
import 'package:movie_app/movie/domain/usecases/get_recommendation_use_case.dart';

class MovieRepository implements BaseMovieRepository {
  final BaseMovieRemoteDataSourse baseMovieRemoteDataSourse;
  MovieRepository({required this.baseMovieRemoteDataSourse});
  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    try {
      final movies = await baseMovieRemoteDataSourse.getNowPlayingMovies();
      return Right(movies);
    } on ServiceException catch (e) {
      return Left(ServerFailure(message: e.errorMessageMode.message));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    try {
      final movies = await baseMovieRemoteDataSourse.getPopularMovies();
      return Right(movies);
    } on ServiceException catch (e) {
      return Left(ServerFailure(message: e.errorMessageMode.message));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    try {
      final movies = await baseMovieRemoteDataSourse.getTopRatedMovies();
      return Right(movies);
    } on ServiceException catch (e) {
      return Left(ServerFailure(message: e.errorMessageMode.message));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetail(MovieDetailsParameters parameters) async{
    try {
      final movieDetail = await baseMovieRemoteDataSourse.getMovieDetails(parameters);
      return Right(movieDetail);
    } on ServiceException catch (e) {
      return Left(ServerFailure(message: e.errorMessageMode.message));
    }
  
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters parameters)async {
    try {
      final recommendation = await baseMovieRemoteDataSourse.getRecommendation(parameters);
      return Right(recommendation);
    } on ServiceException catch (e) {
      return Left(ServerFailure(message: e.errorMessageMode.message));
    }
  
  }
}
