import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:winemonger/mixins/user_state_mixin.dart';

class DrawerSectionController extends GetxController with UserStateMixin {
  final _firstname = "".obs;
  String get firstname => _firstname.value;

  final _lastname = "".obs;
  String get lastname => _lastname.value;

  final _userlevel = "".obs;
  String get userlevel => _userlevel.value;

  @override
  void onInit() {
    super.onInit();
    getuserdetails();
  }

  Future<void> getuserdetails() async {
    var box = await Hive.openBox('myBox');
    _firstname.value = box.get('firstname');
    _lastname.value = box.get('lastname');
    _userlevel.value = box.get('userlevel');
  }
}
