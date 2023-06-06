import 'package:domain/modules/core/response.dart';
import 'package:either_dart/either.dart';
import '../entity/activity_entity.dart';
import '../repository/activity_repository.dart';

class SaveActivityUseCase {
  final ActivityRepository repository;

  SaveActivityUseCase(this.repository);

  Future<Either<Failure, void>> call(ActivityEntity entity) {
    List<ActivityEntity> list = [entity];
    return repository.saveLocalActivityList(list);
  }
}
