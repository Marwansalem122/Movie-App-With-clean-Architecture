import 'package:movie_app/movie/domain/usecases/use_case.dart';

abstract class BaseUsecase <T>{
  Future<Either<Failure, T>> call();
}
