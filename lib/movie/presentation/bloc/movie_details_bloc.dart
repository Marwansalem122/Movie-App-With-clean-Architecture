import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movie/domain/entities/movie_detail.dart';
import 'package:movie_app/movie/domain/entities/recommendation.dart';
import 'package:movie_app/movie/domain/usecases/get_movie_details_use_case.dart';
import 'package:movie_app/movie/domain/usecases/get_recommendation_use_case.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendedRecommendization;
  MovieDetailsBloc({
    required this.getMovieDetailsUseCase,
    required this.getRecommendedRecommendization,
  }) : super(MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }

  FutureOr<void> _getMovieDetails(
    GetMovieDetailsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    final result = await getMovieDetailsUseCase(
      MovieDetailsParameters(movieId: event.movieId),
    );
    result.fold(
      (l) => emit(state.copyWith(
        movieDetailsState: RequestStatus.error,
        movieDetailsMessage: l.message,
      )),
      (r) => emit(
        state.copyWith(
          movieDetail: r,
          movieDetailsState: RequestStatus.loaded,
        ),
      ),
    );
  }
  FutureOr<void> _getRecommendation(
    GetMovieRecommendationEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    final result = await getRecommendedRecommendization(
      RecommendationParameters(id: event.movieId),
    );
     result.fold(
      (l) => emit(state.copyWith(
        recommendationState: RequestStatus.error,
        recommendationMessage: l.message,
      )),
      (r) => emit(
        state.copyWith(
          recommendation: r,
          recommendationState: RequestStatus.loaded,
        ),
      ),
    );
  }
}