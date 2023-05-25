import 'package:flutter/material.dart';
import 'package:winemonger/utils/theme/theme.dart';
import '../drawer/drawer_section.dart';
import '../widgets/appbar.dart';
import '../widgets/bottom_app_bar.dart';
import '../widgets/floating_action_button.dart';

class ManufacturersScreen extends StatelessWidget {
  const ManufacturersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.backgroundColor,
        appBar: const CustomAppBar(
          title: 'Manufacturers',
        ),
        drawer: DrawerSectionScreen(),
        body: const SafeArea(
          child: SizedBox(
            child: Center(child: Text('Coming soon')),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const FloatingActionButtonSection(),
        bottomNavigationBar: const BottomAppBarSection());
  }
}
