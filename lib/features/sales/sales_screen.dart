import 'package:flutter/material.dart';
import 'package:winemonger/utils/theme/theme.dart';
import '../drawer/drawer_section.dart';
import '../widgets/appbar.dart';
import '../widgets/bottom_app_bar.dart';
import '../widgets/floating_action_button.dart';

class SalesScreen extends StatelessWidget {
  const SalesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.backgroundColor,
      appBar: const CustomAppBar(
        title: 'Sales',
      ),
      drawer: DrawerSectionScreen(),
      body: const SafeArea(
        child: SizedBox(
          child: Center(child: Text('Coming soon')),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FloatingActionButtonSection(),
      bottomNavigationBar: const BottomAppBarSection(),
    );
  }
}
