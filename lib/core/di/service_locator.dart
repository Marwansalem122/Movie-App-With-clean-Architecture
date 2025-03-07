import 'package:get_it/get_it.dart';
import 'package:movie_app/movie/data/datasourse/movie_remote_data_sourse.dart';
import 'package:movie_app/movie/data/repository/movie_repository.dart';
import 'package:movie_app/movie/domain/repository/base_movie_repository.dart';
import 'package:movie_app/movie/domain/usecases/get_movie_details_use_case.dart';
import 'package:movie_app/movie/domain/usecases/get_now_playing_movies_use_case.dart';
import 'package:movie_app/movie/domain/usecases/get_popular_movies_use_case.dart';
import 'package:movie_app/movie/domain/usecases/get_recommendation_use_case.dart';
import 'package:movie_app/movie/domain/usecases/get_top_rated_movies_use_case.dart';
import 'package:movie_app/movie/presentation/bloc/movie_details_bloc.dart';
import 'package:movie_app/movie/presentation/bloc/movies_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    //Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSourse>(
      () => MovieRemoteDataSourse(),
    );

    // Repository
    sl.registerLazySingleton<BaseMovieRepository>(
      () => MovieRepository(baseMovieRemoteDataSourse: sl()),
    );

    // Use Cases
    sl.registerLazySingleton(
      () => GetNowPlayingMoviesUseCase(
        NowPlayingmovieRepository: sl<BaseMovieRepository>(),
      ),
    );
    sl.registerLazySingleton(
      () =>
          GetPopularMoviesUseCase(popularRepository: sl<BaseMovieRepository>()),
    );
    sl.registerLazySingleton(
      () => GetTopRatedMoviesUseCase(
        topRatedRepository: sl<BaseMovieRepository>(),
      ),
    );
    sl.registerLazySingleton(
      () => GetMovieDetailsUseCase(
        baseMovieRepository: sl<BaseMovieRepository>(),
      ),
    );
    sl.registerLazySingleton(
      () => GetRecommendationUseCase(
        recommendationRepository: sl<BaseMovieRepository>(),
      ),
    );

    //Blocs

    sl.registerFactory<MoviesBloc>(
      () => MoviesBloc(
        getNowPlayingMovies: sl<GetNowPlayingMoviesUseCase>(),
        getPopularMovies: sl<GetPopularMoviesUseCase>(),
        getTopRatedMovies: sl<GetTopRatedMoviesUseCase>(),
      ),
    );
    sl.registerFactory<MovieDetailsBloc>(
      () => MovieDetailsBloc(
        getMovieDetailsUseCase: sl<GetMovieDetailsUseCase>(),
        getRecommendedRecommendization: sl<GetRecommendationUseCase>(),
      ),
    );
  }
}
