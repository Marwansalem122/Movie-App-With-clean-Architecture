import 'use_case.dart';

class GetTopRatedMoviesUseCase extends BaseUsecase<List<Movie>> {
  final BaseMovieRepository topRatedRepository;

  GetTopRatedMoviesUseCase({required this.topRatedRepository});

  @override
  Future<Either<Failure, List<Movie>>> call() async {
    return await topRatedRepository.getTopRatedMovies();
  }
}
