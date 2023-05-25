import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winemonger/features/order/order_controller.dart';
import 'package:winemonger/features/order/orderlist.dart';
import 'package:winemonger/utils/theme/theme.dart';
import '../drawer/drawer_section.dart';
import '../widgets/appbar.dart';
import '../widgets/bottom_app_bar.dart';
import '../widgets/floating_action_button.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersController>(
        init: OrdersController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.backgroundColor,
            appBar: const CustomAppBar(
              title: 'View Orders',
            ),
            drawer: DrawerSectionScreen(),
            body: Obx(
              () => Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        left: 45, right: 45, top: 30, bottom: 0),
                    child: _searchbar(context),
                  ),
                  //controller.count.value == 1 ? Container() : Container(),
                  // const Expanded(
                  //   child: OrderList(),
                  // ),
                   const Expanded(
                    child: SizedBox(),
                  ),
                ],
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: const FloatingActionButtonSection(),
            bottomNavigationBar: const BottomAppBarSection(),
          );
        });
  }

  Widget _searchbar(BuildContext context) {
    final OrdersController _controller = Get.find();
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).colorScheme.viewOrdersearchBackgroundColor,
          border: Border.all(
              color: Theme.of(context)
                  .colorScheme
                  .viewOrdersearchBackgroundColor)),
      child: Row(
        children: [
          // Expanded(
          //   flex: 4,
          //   child: Container(
          //     padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          //     child: Form(
          //       child: TextFormField(
          //         controller: _controller.searchController.value,
          //         decoration: const InputDecoration(
          //           hintText: 'Search Order',
          //           border: InputBorder.none,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Expanded(
          //   flex: 1,
          //   child: Align(
          //     alignment: Alignment.centerRight,
          //     child: IconButton(
          //       icon: const Icon(
          //         Icons.search,
          //         color: Color(0xffd0d0d0),
          //       ),
          //       onPressed: () {
          //         _controller.sendSearchitem();
          //       },
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
