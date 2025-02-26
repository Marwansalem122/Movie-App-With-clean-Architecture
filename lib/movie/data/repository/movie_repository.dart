import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movie/data/datasourse/movie_remote_data_sourse.dart';
import 'package:movie_app/movie/domain/entities/movie.dart';
import 'package:movie_app/movie/domain/repository/base_movie_repository.dart';

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
}
