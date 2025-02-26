import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movie/domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestStatus nowPlayingStatus;
  final String nowPlayingmessage;
  final List<Movie> popularMovies;
  final RequestStatus popularState;
  final String popularMessage;
  final List<Movie> topRatedMovies;
  final RequestStatus topRatedState;
  final String topRatedMessage;
  MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingStatus = RequestStatus.loading,
    this.nowPlayingmessage = '',
    this.popularMovies = const [],
    this.popularState = RequestStatus.loading,
    this.popularMessage = '',
    this.topRatedMovies = const [],
    this.topRatedState = RequestStatus.loading,
    this.topRatedMessage = '',
  });
  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestStatus? nowPlayingStatus,
    String? nowPlayingMessage,
    List<Movie>? popularMovies,
    RequestStatus? popularState,
    String? popularMessage,
    List<Movie>? topRatedMovies,
    RequestStatus? topRatedState,
    String? topRatedMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingStatus: nowPlayingStatus ?? this.nowPlayingStatus,
      nowPlayingmessage: nowPlayingMessage ?? this.nowPlayingmessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }

  @override
  List<Object?> get props => [
    nowPlayingMovies,
    nowPlayingStatus,
    nowPlayingmessage,
    popularMovies,
    popularState,
    popularMessage,
    topRatedMovies,
    topRatedState,
    topRatedMessage,
  ];
}
