import 'package:equatable/equatable.dart';
import 'package:movie_app/movie/domain/entities/recommendation.dart';
import 'package:movie_app/movie/domain/usecases/use_case.dart';

class GetRecommendationUseCase extends BaseUsecase<List<Recommendation>,RecommendationParameters>{
   final BaseMovieRepository recommendationRepository;
  GetRecommendationUseCase({required this.recommendationRepository});
  
  @override
   Future<Either<Failure, List<Recommendation>>>  call(RecommendationParameters parameters) async {
    return await recommendationRepository.getRecommendation(parameters);
  }
}
class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters({required this.id});

  @override
  List<Object> get props => [id];
}