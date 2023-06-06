import 'dart:async';
import 'package:domain/modules/home/activity/entity/activity_entity.dart';
import 'package:get/get.dart';

class CacheController extends GetxController {
  ///
  /// TMPS project
  ///
  /// This is an example of Memento pattern
  ///

  ActivityEntity? _previousActivity;

  RxBool hasCached = false.obs;

  void setPreviousActivity(ActivityEntity activityEntity, Function onReset) {
    print(activityEntity.actionName);
    _previousActivity = activityEntity;
    hasCached.value = true;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (hasCached.value) {
        if (timer.tick > 5) {
          timer.cancel();
          _previousActivity = null;
          hasCached.value = false;
          onReset.call();
        }
      } else {
        _previousActivity = null;
        hasCached.value = false;
        timer.cancel();
      }
    });
  }

  ActivityEntity get getPreviousActivity {
    hasCached.value = false;
    return _previousActivity!;
  }
}
