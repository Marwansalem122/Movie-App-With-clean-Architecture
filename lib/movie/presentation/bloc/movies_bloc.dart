import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movie/domain/usecases/get_now_playing_movies_use_case.dart';
import 'package:movie_app/movie/domain/usecases/get_popular_movies_use_case.dart';
import 'package:movie_app/movie/domain/usecases/get_top_rated_movies_use_case.dart';
import 'package:movie_app/movie/presentation/bloc/movies_event.dart';
import 'package:movie_app/movie/presentation/bloc/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMovies;
  final GetPopularMoviesUseCase getPopularMovies;
  final GetTopRatedMoviesUseCase getTopRatedMovies;

  MoviesBloc({
    required this.getNowPlayingMovies,
    required this.getPopularMovies,
    required this.getTopRatedMovies,
  }) : super(MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_onGetNowPlayingMovies);
    on<GetPopularMoviesEvent>(_onGetPopularMovies);
    on<GetTopRatedMoviesEvent>(_onGetTopRatedMovies);
  }

  _onGetNowPlayingMovies(
    GetNowPlayingMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getNowPlayingMovies.call();
    result.fold(
      (failure) => emit(
        state.copyWith(
          nowPlayingMessage: failure.message,
          nowPlayingStatus: RequestStatus.error,
        ),
      ),
      (movies) => emit(
        state.copyWith(
          nowPlayingMovies: movies,
          nowPlayingStatus: RequestStatus.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _onGetPopularMovies(
    GetPopularMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getPopularMovies.call();
    result.fold(
      (failure) => emit(
        state.copyWith(
          popularMessage: failure.message,
          popularState: RequestStatus.error,
        ),
      ),
      (movies) => emit(
        state.copyWith(
          popularMovies: movies,
          popularState: RequestStatus.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _onGetTopRatedMovies(
    GetTopRatedMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getTopRatedMovies.call();
    result.fold(
      (failure) => emit(
        state.copyWith(
          topRatedMessage: failure.message,
          topRatedState: RequestStatus.error,
        ),
      ),
      (movies) => emit(
        state.copyWith(
          topRatedMovies: movies,
          topRatedState: RequestStatus.loaded,
        ),
      ),
    );
  }
}
