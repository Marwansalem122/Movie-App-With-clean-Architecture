import 'use_case.dart';

class GetPopularMoviesUseCase extends BaseUsecase<List<Movie>,NoParameters> {
  final BaseMovieRepository popularRepository;

  GetPopularMoviesUseCase({required this.popularRepository});
  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await popularRepository.getPopularMovies();
  }
}
