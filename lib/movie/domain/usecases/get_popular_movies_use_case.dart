import 'use_case.dart';

class GetPopularMoviesUseCase extends BaseUsecase<List<Movie>> {
  final BaseMovieRepository popularRepository;

  GetPopularMoviesUseCase({required this.popularRepository});
  @override
  Future<Either<Failure, List<Movie>>> call() async {
    return await popularRepository.getPopularMovies();
  }
}
