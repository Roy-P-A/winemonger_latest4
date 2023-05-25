import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'utils/routes.dart';
import 'utils/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initialize();
  runApp(const MyApp());
}

void initialize() {}

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
