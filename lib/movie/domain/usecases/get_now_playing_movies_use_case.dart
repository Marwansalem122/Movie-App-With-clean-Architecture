import 'use_case.dart';

class GetNowPlayingMoviesUseCase
    extends BaseUsecase<List<Movie>, NoParameters> {
  final BaseMovieRepository NowPlayingmovieRepository;

  GetNowPlayingMoviesUseCase({required this.NowPlayingmovieRepository});
  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await NowPlayingmovieRepository.getNowPlayingMovies();
  }
}
