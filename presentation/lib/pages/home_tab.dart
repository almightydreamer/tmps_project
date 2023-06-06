import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/home/controllers/cache_controller.dart';
import 'package:presentation/pages/statistics/statistic_page.dart';
import 'package:presentation/pages/time_line/time_line_page.dart';

import '../resources/custom_colors.dart';
import '../resources/text_styles.dart';
import 'home/home_page.dart';

class HomeTabPage extends StatefulWidget {
  const HomeTabPage({Key? key}) : super(key: key);

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  int _selectedIndex = 0;
  bool visible = true;

  @override
  void initState() {
    Get.put(CacheController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(index: _selectedIndex, children: [
          HomePage(),
          TimeLinePage(),
          StatisticPage(),
        ]),
        bottomNavigationBar: AnimatedContainer(
          color: CustomColor.greenSheen,
          duration: const Duration(microseconds: 500),
          curve: Curves.fastLinearToSlowEaseIn,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: SizedBox(
              height: 66,
              child: Wrap(
                children: [
                  BottomNavigationBar(
                    elevation: 0,
                    selectedItemColor: CustomColor.lightGreen,
                    showSelectedLabels: true,
                    showUnselectedLabels: false,
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Container(
                          child: Column(
                            children: [
                              Text(
                                "Home",
                                style: TextStyles.robotoCondensed22w400.copyWith(color: CustomColor.darkGreen, height: 1.33, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        label: '•',
                      ),
                      BottomNavigationBarItem(
                        icon: SizedBox(
                          child: Text(
                            "TimeLine",
                            style: TextStyles.robotoCondensed22w400.copyWith(color: CustomColor.darkGreen, height: 1.33, fontWeight: FontWeight.w700),
                          ),
                        ),
                        label: '•',
                      ),
                      BottomNavigationBarItem(
                        icon: SizedBox(
                          child: Text(
                            "Statistics",
                            style: TextStyles.robotoCondensed22w400.copyWith(color: CustomColor.darkGreen, height: 1.33, fontWeight: FontWeight.w700),
                          ),
                        ),
                        label: '•',
                      ),
                    ],
                    currentIndex: _selectedIndex,
                    //New
                    onTap: _onItemTapped,
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
