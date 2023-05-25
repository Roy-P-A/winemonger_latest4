import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/uiw.dart';
import 'package:winemonger/utils/theme/theme.dart';
import 'package:badges/badges.dart' as badges;


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.appbarbackgroundColor,
      title: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.appbarTextColor,
          fontWeight: FontWeight.w600,
          fontSize: 17,
        ),
      ),
      centerTitle: true,
      leading: Builder(builder: (context) {
        return title == "Dashboard" ? IconButton(
          icon: Icon(
            Icons.menu,
            color: Theme.of(context).colorScheme.appbarTextColor,
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ):IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.appbarTextColor,
          ),
          onPressed: () => Get.back(),
        );
      }),
      actions: [
        badges.Badge(
          position: badges.BadgePosition.topEnd(top: 14, end: 12),
          child: IconButton(
            icon: Iconify(
              Uiw.bell,
              color: Theme.of(context).colorScheme.appbarTextColor,
            ),
            onPressed: () {},
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(3.0),
        child: Container(
          color: Theme.of(context).colorScheme.appbarBorderColor,
          height: 3.0,
        ),
      ),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
