import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winemonger/features/drawer/drawer_section_controller.dart';
import 'package:winemonger/mixins/user_state_mixin.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi_light.dart';
import 'package:iconify_flutter/icons/healthicons.dart';
import 'package:winemonger/utils/theme/theme_constants.dart';

class DrawerSectionScreen extends StatelessWidget with UserStateMixin {
  DrawerSectionScreen({Key? key}) : super(key: key);
  final DrawerSectionController _controller = Get.put(DrawerSectionController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      child: Drawer(
        backgroundColor: Theme.of(context).colorScheme.drawerbackgroundColor,
        child: SingleChildScrollView(
          child: SafeArea(
            child: SizedBox(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        ListTile(
                          title: Obx(
                            () => Text(
                              "${_controller.firstname} ${_controller.lastname}",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context)
                                    .colorScheme
                                    .drawerTextColor1,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          subtitle: Obx(() => Text(
                                _controller.userlevel == "100"
                                    ? "Admin"
                                    : _controller.userlevel == "80"
                                        ? "Manager"
                                        : _controller.userlevel == ""
                                            ? ""
                                            : "Sales Representative",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .drawerTextColor1,
                                  fontSize: 12,
                                ),
                              )),
                          leading: Iconify(
                            Healthicons.ui_user_profile_outline,
                            size: 50,
                            color:
                                Theme.of(context).colorScheme.drawerTextColor1,
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color:
                              Theme.of(context).colorScheme.drawerDividerColor,
                          indent: 20.0,
                          endIndent: 20.0,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        InkWell(
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 20, right: 10, top: 15, bottom: 15),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: SvgPicture.asset(
                                    'assets/svgs/drawer/orders.svg',
                                    color: Theme.of(context)
                                        .colorScheme
                                        .drawerIconColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 11,
                                ),
                                Text(
                                  "Orders",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .drawerTextColor1),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Get.toNamed('/orders');
                          },
                        ),
                        InkWell(
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 20, right: 10, top: 15, bottom: 15),
                            child: Row(
                              children: [
                                SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Iconify(
                                      MdiLight.cart,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .drawerIconColor,
                                    )),
                                const SizedBox(
                                  width: 11,
                                ),
                                Text("Offers",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .drawerTextColor1))
                              ],
                            ),
                          ),
                          onTap: () {},
                        ),
                        InkWell(
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 20, right: 10, top: 15, bottom: 15),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: SvgPicture.asset(
                                    'assets/svgs/drawer/tastings.svg',
                                    color: Theme.of(context)
                                        .colorScheme
                                        .drawerIconColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 11,
                                ),
                                Text(
                                  "Tastings",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .drawerTextColor1),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Get.toNamed('/tastings');
                          },
                        ),
                        InkWell(
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 20, right: 10, top: 15, bottom: 15),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: SvgPicture.asset(
                                    'assets/svgs/drawer/products.svg',
                                    color: Theme.of(context)
                                        .colorScheme
                                        .drawerIconColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 11,
                                ),
                                Text(
                                  "Products",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .drawerTextColor1),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Get.toNamed('/products');
                          },
                        ),
                        InkWell(
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 20, right: 10, top: 15, bottom: 15),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: SvgPicture.asset(
                                    'assets/svgs/drawer/sales.svg',
                                    color: Theme.of(context)
                                        .colorScheme
                                        .drawerIconColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 11,
                                ),
                                Text(
                                  "Sales",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .drawerTextColor1),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Get.toNamed('/sales');
                          },
                        ),
                        InkWell(
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 20, right: 10, top: 15, bottom: 15),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: SvgPicture.asset(
                                    'assets/svgs/drawer/customers.svg',
                                    color: Theme.of(context)
                                        .colorScheme
                                        .drawerIconColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 11,
                                ),
                                Text(
                                  "Customer",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .drawerTextColor1),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Get.toNamed('/customers');
                          },
                        ),
                        InkWell(
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 20, right: 10, top: 15, bottom: 15),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: SvgPicture.asset(
                                    'assets/svgs/drawer/imports.svg',
                                    color: Theme.of(context)
                                        .colorScheme
                                        .drawerIconColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 11,
                                ),
                                Text(
                                  "Imports",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .drawerTextColor1),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Get.toNamed('/imports');
                          },
                        ),
                        InkWell(
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 20, right: 10, top: 15, bottom: 15),
                            child: Row(
                              children: [
                                SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Iconify(
                                      MdiLight.logout,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .drawerIconColor,
                                    )),
                                const SizedBox(
                                  width: 11,
                                ),
                                Text(
                                  "Logout",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .drawerTextColor1),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            logout();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
