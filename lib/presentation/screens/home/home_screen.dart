import 'package:exe_test/presentation/layout/side_bar_layout.dart';
import 'package:exe_test/presentation/screens/customer/customer_screen.dart';
import 'package:exe_test/presentation/screens/home/home_widget/home_sidebar_widget.dart';
import 'package:exe_test/presentation/screens/home/provider/home_content_index_provider.dart';
import 'package:exe_test/presentation/screens/pipe_line/piple_line_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  static const routeName = 'home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SideBarLayout(
      sizebar: const Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        child: HomeSideBarWidget(),
      ),
      child: IndexedStack(
        index: ref.watch(homeContentIndexProvider),
        children: [
          Container(),
          Container(),
          const CustomerScreen(),
          Container(),
          const PipeLineScreen(),
          Container(),
        ],
      ),
    );
  }
}
