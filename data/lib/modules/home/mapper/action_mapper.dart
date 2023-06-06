import 'package:data/core/db/db.dart';
import 'package:data/modules/home/dto/action_local_dto.dart';
import 'package:domain/modules/home/action/entity/action_entity.dart';

class ActionMapper {
  ActionEntity mapLocalToEntity(ActionLocalDTO input) {
    return ActionEntity(actionId: input.id, actionName: input.name);
  }

  ActionLocalDTO mapDataToLocal(ActionData data) {
    return ActionLocalDTO(name: data.name, id: data.id);
  }

  ActionCompanion mapEntityToData(ActionEntity entity) {
    return ActionCompanion.insert(name: entity.actionName);
  }
}
