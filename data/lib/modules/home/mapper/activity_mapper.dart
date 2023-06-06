import 'package:data/core/db/db.dart';
import 'package:data/modules/home/dto/action_local_dto.dart';
import 'package:data/modules/home/dto/activity_local_dto.dart';
import 'package:domain/modules/home/activity/entity/activity_entity.dart';
import 'package:drift/drift.dart';

class ActivityMapper {
  ActivityEntity mapLocalToEntity(ActivityLocalDTO activity, ActionLocalDTO action) {
    return ActivityEntity(
        actionId: activity.actionId,
        day: activity.day,
        actionName: action.name,
        endOfActivity: activity.endOfActivity,
        startOfActivity: activity.startOfActivity);
  }

  ActivityLocalDTO mapDataToLocal(ActivityData data) {
    return ActivityLocalDTO(
      day: data.dayId,
      endOfActivity: data.endTime,
      startOfActivity: data.startTime,
      actionId: data.actionId,
    );
  }

  ActivityCompanion mapEntityToData(ActivityEntity entity) {
    return ActivityCompanion.insert(
      dayId: entity.day,
      actionId: entity.actionId!,
      startTime: entity.startOfActivity,
      endTime: Value(entity.endOfActivity),
    );
  }

//MovieLocalDTO mapDataToLocal(MovieData input) {}

//MovieEntity mapLocalToEntity(MovieLocalDTO input) {}

//MovieLocalDTO mapEntityToLocal(MovieEntity input) {}
}
