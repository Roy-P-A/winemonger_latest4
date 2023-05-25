import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winemonger/utils/theme/theme.dart';


class FloatingActionButtonSection extends StatelessWidget {
  const FloatingActionButtonSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      // isExtended: true,
      backgroundColor:
          Theme.of(context).colorScheme.floatingbuttonbackgroundColor,
      onPressed: () {
        Get.toNamed("/createorders");
      },
      // isExtended: true,
      child:  const Tooltip(
        message: 'create order',
        child: Icon(
          Icons.add,
          size: 49,
        ),
      ),
    );
  }
}