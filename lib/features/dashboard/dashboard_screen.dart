import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:winemonger/utils/theme/theme.dart';
import '../drawer/drawer_section.dart';
import '../widgets/appbar.dart';
import '../widgets/bottom_app_bar.dart';
import '../widgets/floating_action_button.dart';
import 'dashboard_list.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.backgroundColor,
      appBar: const CustomAppBar(
        title: 'Dashboard',
      ),
      drawer: DrawerSectionScreen(),
      body: SafeArea(
        child: Container(
          padding:
              const EdgeInsets.only(left: 38, right: 38, top: 27, bottom: 0),
          child: GridView.builder(
            itemCount: DashboardList().dashboardList.length,
            itemBuilder: (BuildContext ctx, index) {
              return InkWell(
                onTap: () {
                  Get.toNamed(
                      '${DashboardList().dashboardList[index].linkToPage}');
                },
                child: Card(
                  color: Theme.of(context).colorScheme.cardbackgroundColor,
                  elevation: 4,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Theme.of(context).colorScheme.cardbackgroundColor,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: SvgPicture.asset(
                                '${DashboardList().dashboardList[index].icon}',
                                color: Theme.of(context)
                                    .colorScheme
                                    .drawerIconColor),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            "${DashboardList().dashboardList[index].title}",
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .drawerTextColor1,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          (DashboardList().dashboardList[index].image == null)
                              ? Container()
                              : Container(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 4, bottom: 4),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .newBackgroundColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Text(
                                    "New",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1 / 1,
                crossAxisSpacing: 7,
                mainAxisSpacing: 7),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FloatingActionButtonSection(),
      bottomNavigationBar: const BottomAppBarSection(),
    );
  }
}
