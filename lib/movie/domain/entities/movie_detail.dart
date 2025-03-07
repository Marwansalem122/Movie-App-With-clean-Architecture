import 'package:equatable/equatable.dart';
import 'package:movie_app/movie/domain/entities/genres.dart';

class MovieDetail extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final String overview;
  final String releaseDate;
  final int runtime;
  final double voteAverage;
  final List<Genres> genres;
  const MovieDetail({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.voteAverage,
    required this.genres,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    backdropPath,
    overview,
    releaseDate,
    runtime,
    voteAverage,
  ];
}
