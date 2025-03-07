import 'use_case.dart';

class GetTopRatedMoviesUseCase extends BaseUsecase<List<Movie>,NoParameters> {
  final BaseMovieRepository topRatedRepository;

  GetTopRatedMoviesUseCase({required this.topRatedRepository});

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await topRatedRepository.getTopRatedMovies();
  }
}
