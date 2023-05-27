import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winemonger/repository/repository.dart';
import 'controllers/app_controller.dart';
import 'managers/hive/hive.dart';
import 'utils/routes.dart';
import 'utils/theme/app_theme.dart';
import 'utils/theme/theme.dart';
import 'utils/theme/theme_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initialize();
  runApp(const MyApp());
}

void initialize() {
  Get.put<ApiRepository>(ApiRepositoryImpl(), permanent: true);
  Get.put(HiveHelper(), permanent: true);
  Get.put(AppController(), permanent: true);
  Get.put(ThemeController(), permanent: true);
  Get.put(ColorController(), permanent: true);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Winemonger',
        theme: AppTheme.lightTheme,
        //navigatorObservers: [NavigatorObserverWithOrientation()],
        initialRoute: '/',
        getPages: routes(),
        );
  }
}
