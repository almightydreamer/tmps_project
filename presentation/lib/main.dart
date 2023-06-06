import 'package:domain/modules/home/action/entity/action_entity.dart';
import 'package:domain/modules/home/action/usecase/get_actions_usecase.dart';
import 'package:domain/modules/home/action/usecase/save_actions_usecase.dart';
import 'package:domain/modules/home/activity/usecase/get_activities_usecase.dart';
import 'package:domain/modules/home/activity/usecase/save_activity_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dependency_injection/dependency_injection.dart' as di;
import 'package:get_it/get_it.dart';
import 'package:presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:presentation/pages/home_tab.dart';
import 'package:presentation/pages/statistics/statistic_page.dart';
import 'package:presentation/pages/time_line/time_line_page.dart';


void main() {
  di.init();
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          canvasColor: Colors.transparent,
        ),
        home: const HomeTabPage());
  }
}
