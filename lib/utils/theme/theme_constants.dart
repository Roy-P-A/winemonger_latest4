import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'theme_controller.dart';


final ThemeController _controller = Get.put(ThemeController());

class ColorController extends GetxController {
  var backcolor =
      (_controller.isdark.value ? Color(0xfff8f8f8) : Color(0xfff8f8f8)).obs;
}

extension ColorSchemeExtension on ColorScheme {
  Color get backgroundColor => brightness == Brightness.light
      ? const Color(0xfff8f8f8)
      : const Color(0xff242424);

  Color get buttonBackgroundColor => const Color(0xffcae3a8);

  /* --------Login screen ------------*/

  Color get successMessageColor => Colors.green.shade400;
  Color get errorMessageColor => Colors.red.shade400;

  /* ------Appbar-----*/

  Color get appbarbackgroundColor =>
      brightness == Brightness.light ? Colors.white : const Color(0xff494949);

  Color get appbarTextColor => brightness == Brightness.light
      ? const Color(0xff000000)
      : const Color(0xffffffff);

  Color get appbarBorderColor => const Color(0xffcae3a8);

  /* ------drawer-----*/

  Color get drawerbackgroundColor =>
      brightness == Brightness.light ? Colors.white : const Color(0xff272726);
  Color get drawerTextColor1 => brightness == Brightness.light
      ? const Color(0xff000000)
      : const Color(0xffffffff);
  Color get drawerIconColor => brightness == Brightness.light
      ? const Color(0xff000000)
      : const Color(0xffcae3a8);

  Color get drawerDividerColor => brightness == Brightness.light
      ? const Color(0xff999999)
      : const Color(0xffffffff);

  /* -------floating action -------*/

  Color get floatingbuttonbackgroundColor => brightness == Brightness.light
      ? const Color(0xff717f5e)
      : const Color(0xffcae3a8);

  /* ------botombar-----*/

  Color get bottombackgroundColor =>
      brightness == Brightness.light ? Colors.white : const Color(0xff494949);

  Color get bottomTextColor => brightness == Brightness.light
      ? const Color(0xff000000)
      : const Color(0xffffffff);

  /*--------dashboard---------*/
  Color get dashboardbackgroundColor => brightness == Brightness.light
      ? const Color(0xfff8f8f8)
      : const Color(0xff242424);
  Color get cardbackgroundColor => brightness == Brightness.light
      ? const Color(0xfff8f8f8)
      : const Color(0xff494949);

  Color get newBackgroundColor => brightness == Brightness.light
      ? const Color(0xFF28a745)
      : const Color.fromARGB(255, 218, 9, 9);

  /*--------view order----------*/

  Color get viewOrdersearchBackgroundColor =>
      brightness == Brightness.light ? Colors.white : const Color(0xff494949);
  Color get viewOrderThroughborderColor => brightness == Brightness.light
      ? const Color(0xfff8f8f8)
      : const Color(0xff272726);
  Color get viewOrderboxshadowColor => brightness == Brightness.light
      ? Colors.grey.withOpacity(0.2)
      : const Color(0xff272726);

  /*--- create orderpage--*/
  Color get createOrderBorderColor => brightness == Brightness.light
      ? const Color.fromARGB(255, 51, 50, 50)
      : const Color(0xfff8f8f8);
  Color get createOrderHintColor =>
      brightness == Brightness.light ? Colors.black : const Color(0xfff8f8f8);
}
