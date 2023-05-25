import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winemonger/utils/theme/theme.dart';
import 'splash_controller.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor:
                Theme.of(context).colorScheme.dashboardbackgroundColor,
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: 'splash',
                      child: Image.asset(
                        'assets/images/winemongerlogoimage.gif',
                        height: 279,
                        width: 279,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
