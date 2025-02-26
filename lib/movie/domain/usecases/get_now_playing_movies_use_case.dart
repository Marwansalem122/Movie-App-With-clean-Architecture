import 'use_case.dart';

class GetNowPlayingMoviesUseCase extends BaseUsecase<List<Movie>> {
  final BaseMovieRepository NowPlayingmovieRepository;

  GetNowPlayingMoviesUseCase({required this.NowPlayingmovieRepository});
  @override
  Future<Either<Failure, List<Movie>>> call() async {
    return await NowPlayingmovieRepository.getNowPlayingMovies();
  }
}
