import 'dart:io';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:winemonger/models/user_model.dart';

class HiveHelper extends GetxController {
  static HiveHelper get to => Get.find();

  hiveHelper() async {
    Directory directory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    if (!Hive.isAdapterRegistered(UserModelAdapter().typeId)) {
      Hive.registerAdapter(UserModelAdapter());
    }

    await Hive.openBox('myBox');
  }

  Future<bool> isAppAlreadyRun() async {
    await hiveHelper();
    var settingsBox = await Hive.openBox('myBox');

    final isAlreadyRun = settingsBox.get('apikey');
    if (isAlreadyRun != null) {
      return true;
    }
    return false;
  }

  clearData() async {
    Box apiKeyBox = await Hive.openBox('myBox');
    await apiKeyBox.clear();
  }
}
