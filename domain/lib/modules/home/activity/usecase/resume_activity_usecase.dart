import 'package:domain/modules/core/response.dart';
import 'package:either_dart/either.dart';
import '../entity/activity_entity.dart';
import '../repository/activity_repository.dart';

class GetLastActivityUseCase {
  final ActivityRepository repository;

  GetLastActivityUseCase(this.repository);

  Future<Either<Failure, ActivityEntity>> call() {
    return repository.getLastActivity();
  }
}
