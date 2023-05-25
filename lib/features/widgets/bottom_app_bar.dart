
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:flutter_svg/flutter_svg.dart';
import 'package:winemonger/utils/theme/theme.dart';


class BottomAppBarSection extends StatelessWidget {
  const BottomAppBarSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 20,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      notchMargin: 8,
      shape: const CircularNotchedRectangle(),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            color: Theme.of(context).colorScheme.bottombackgroundColor,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Tooltip(
                  message: 'Dashboard',
                  child: InkWell(
                      child: SizedBox(
                        child: SvgPicture.asset(
                          'assets/svgs/home.svg',
                          color: Theme.of(context).colorScheme.bottomTextColor,
                        ),
                      ),
                      onTap: () {
                        Get.offAllNamed('/dashboard');
                      }),
                ),
                Tooltip(
                  message: 'view orders',
                  child: InkWell(
                      child: SizedBox(
                        child: SvgPicture.asset(
                          'assets/svgs/view.svg',
                          color: Theme.of(context).colorScheme.bottomTextColor,
                        ),
                      ),
                      onTap: () {
                        Get.toNamed('/orders');
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
