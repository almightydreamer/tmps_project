import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:presentation/pages/statistics/controllers/statistic_controller.dart';

import '../../resources/custom_colors.dart';
import '../../resources/text_styles.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({Key? key}) : super(key: key);

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  final List actions = ["Running", "Jumping", "Smoking"];

  final List<String> list = <String>[
    "${int.parse(DateFormat('d').format(DateTime.now()))} ${(DateFormat('yMMMM').format(DateTime.now()))}",
    "${int.parse(DateFormat('d').format(DateTime.now())) - 1} ${(DateFormat('yMMMM').format(DateTime.now()))}",
    "${int.parse(DateFormat('d').format(DateTime.now())) - 2} ${(DateFormat('yMMMM').format(DateTime.now()))}",
  ];
  late String dropdownValue;

  final bool isLast = false;

  @override
  void initState() {
    dropdownValue = list.first;
    Get.put(StatisticController());
    StatisticController controller = Get.find();
    controller.dropdownValue.value = controller.dayStringList.first;
    controller.getActivities(DateTime.now().day);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(StatisticController());
    StatisticController controller = Get.find();
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
                "Heres is your statistics",
                style: TextStyles.robotoCondensed22w400
                    .copyWith(height: 1.71, fontWeight: FontWeight.w600, color: CustomColor.white),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Text(
                    "Select Date:   ",
                    style: TextStyles.robotoCondensed22w400
                        .copyWith(height: 1.71, fontWeight: FontWeight.w600, color: CustomColor.white),
                  ),
                  DropdownButton<String>(
                    value: controller.dropdownValue.value,
                    elevation: 16,
                    dropdownColor: CustomColor.white,
                    onChanged: (String? value) {
                      controller.dropdownValue.value = value!;
                      switch (value) {
                        case 'Today':
                          {
                            controller.getActivities(DateTime.now().day);
                          }
                          break;

                        case 'Yesterday':
                          {
                            controller.getActivities(DateTime.now().day - 1);
                          }
                          break;

                        case 'Two days ago':
                          {
                            controller.getActivities(DateTime.now().day - 2);
                          }
                          break;
                      }
                    },
                    items: controller.dayStringList.map<DropdownMenuItem<String>>((String value) {
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
              Text(
                "Your total activity for ${controller.dropdownValue}",
                style: TextStyles.robotoCondensed22w400
                    .copyWith(height: 1.71, fontWeight: FontWeight.w600, color: CustomColor.white),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: const BorderRadius.all(Radius.circular(30)),
                            color: CustomColor.lightGreen,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      controller.activities.keys.toList()[index],
                                      style: TextStyles.robotoCondensed22w400
                                          .copyWith(height: 1.71, fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    Text(
                                      "${controller.activities.values.toList()[index].seconds.inHours} hours "
                                      "${controller.activities.values.toList()[index].seconds.inMinutes - controller.activities.values.toList()[index].seconds.inHours * 60} minutes",
                                      style: TextStyles.robotoCondensed15w400
                                          .copyWith(height: 1.71, fontWeight: FontWeight.w700, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10)
                      ],
                    );
                  },
                  itemCount: controller.activities.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
