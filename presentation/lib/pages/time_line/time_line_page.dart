import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:presentation/pages/home/controllers/home_controller.dart';
import 'package:presentation/resources/custom_colors.dart';

import '../../resources/text_styles.dart';
import 'controllers/time_line_controller.dart';

class TimeLinePage extends StatefulWidget {
  const TimeLinePage({Key? key}) : super(key: key);

  @override
  State<TimeLinePage> createState() => _TimeLinePageState();
}

class _TimeLinePageState extends State<TimeLinePage> {
  final List actions = ["Running", "Jumping", "Smoking"];

  final List<String> list = <String>[
    "${int.parse(DateFormat('d').format(DateTime.now()))} ${(DateFormat('yMMMM').format(DateTime.now()))}",
    "${int.parse(DateFormat('d').format(DateTime.now())) - 1} ${(DateFormat('yMMMM').format(DateTime.now()))}",
    "${int.parse(DateFormat('d').format(DateTime.now())) - 2} ${(DateFormat('yMMMM').format(DateTime.now()))}",
  ];
  late

  final bool isLast = false;

  @override
  void initState() {
    Get.put(TimeLineController());
    Get.put(HomeController());
    TimeLineController timeLineController = Get.find();
    HomeController homeController = Get.find();
    timeLineController.dropdownValue.value = timeLineController.dayStringList.first;
    timeLineController.getActivities(DateTime.now().day);
    homeController.getActions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TimeLineController timeLineController = Get.find();
    HomeController homeController = Get.find();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        color: CustomColor.darkGreen,
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 56,
              ),
              Text(
                "This is your timeline",
                style: TextStyles.robotoCondensed15w400.copyWith(height: 1.71, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Text(
                    "Select Date: ",
                    style: TextStyles.robotoCondensed15w400.copyWith(height: 1.71, fontWeight: FontWeight.w600),
                  ),
          DropdownButton<String>(
            value: timeLineController.dropdownValue.value,
            elevation: 16,
            dropdownColor: CustomColor.white,
            onChanged: (String? value) {
              timeLineController.dropdownValue.value = value!;
              switch (value) {
                case 'Today':
                  {
                    timeLineController.getActivities(DateTime.now().day);
                  }
                  break;

                case 'Yesterday':
                  {
                    timeLineController.getActivities(DateTime.now().day - 1);
                  }
                  break;

                case 'Two days ago':
                  {
                    timeLineController.getActivities(DateTime.now().day - 2);
                  }
                  break;
              }
            },
            items: timeLineController.dayStringList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 2,
                            ),
                            Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                color: Colors.lightGreen,
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              DateFormat.jm().format(timeLineController.activities[index].startOfActivity),
                              style:
                                  TextStyles.robotoCondensed22w400.copyWith(height: 1.71, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              width: 50,
                              height: 3,
                              color: Colors.lightGreen,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              timeLineController.activities[index].actionName,
                              style:
                                  TextStyles.robotoCondensed22w400.copyWith(height: 1.71, fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 14.0),
                          child: (timeLineController.activities.length != index + 1)
                              ? Container(
                                  width: 3,
                                  height: 40,
                                  color: Colors.lightGreen,
                                )
                              : Container(),
                        ),
                      ],
                    );
                  },
                  itemCount: timeLineController.activities.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
