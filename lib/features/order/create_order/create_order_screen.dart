import 'package:flutter/material.dart';
import 'package:winemonger/features/order/create_order/create_order_list.dart';
import 'package:winemonger/utils/theme/theme_constants.dart';
import '../../drawer/drawer_section.dart';
import '../../widgets/appbar.dart';
import '../../widgets/bottom_app_bar.dart';
import '../../widgets/floating_action_button.dart';

class CreateOrderScreen extends StatelessWidget {
  const CreateOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.backgroundColor,
      appBar: const CustomAppBar(
        title: 'Create a new order',
      ),
      drawer: DrawerSectionScreen(),
      //body: CreateOrderList(),
      body: SizedBox(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FloatingActionButtonSection(),
      bottomNavigationBar: const BottomAppBarSection(),
    );
  }
}
