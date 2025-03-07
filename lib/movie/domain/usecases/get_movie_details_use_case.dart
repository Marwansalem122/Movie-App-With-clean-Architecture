import 'package:equatable/equatable.dart';
import 'package:movie_app/movie/domain/entities/movie_detail.dart';
import 'package:movie_app/movie/domain/usecases/use_case.dart';

class GetMovieDetailsUseCase
    extends BaseUsecase<MovieDetail, MovieDetailsParameters> {
  final BaseMovieRepository baseMovieRepository;
  GetMovieDetailsUseCase({required this.baseMovieRepository});

  @override
  Future<Either<Failure, MovieDetail>> call(
    MovieDetailsParameters parameters,
  ) async {
    return await baseMovieRepository.getMovieDetail(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
