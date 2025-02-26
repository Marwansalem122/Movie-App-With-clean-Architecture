import 'package:movie_app/movie/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.backdropPath,
    required super.genreIds,
    required super.overview,
    required super.releaseDate,
    required super.title,
    required super.voteAverage,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        backdropPath: json['backdrop_path'],
        genreIds: List<int>.from(json['genre_ids']).map((e) => e).toList(),
        overview: json['overview'],
        releaseDate: json['release_date'],
        title: json['title'],
        voteAverage: json['vote_average'].toDouble(),
      );
  
}
