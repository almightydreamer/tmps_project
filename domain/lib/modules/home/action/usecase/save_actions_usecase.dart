import 'package:domain/modules/home/action/entity/action_entity.dart';
import 'package:domain/modules/core/response.dart';
import 'package:either_dart/either.dart';
import '../repository/action_repository.dart';

class SaveActionsUseCase {
  final ActionRepository repository;

  SaveActionsUseCase(this.repository);

  Future<Either<Failure, void>> call(List<ActionEntity> list) async {
    return repository.saveLocalActionList(list);
  }
}
