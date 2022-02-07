import 'package:demo_app_news/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:demo_app_news/common/tabs_state.dart';
import 'package:demo_app_news/pages/home/home_page.dart';

class Root extends HookConsumerWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Layout();
  }
}

class Layout extends HookConsumerWidget {
  const Layout({Key? key}) : super(key: key);

  Widget setWidget(t) {
    if (t == 1) {
      return const HomePage();
    } else if (t == 2) {
      return const HomePage();
    } else if (t == 3) {
      return const HomePage();
    } else {
      return const HomePage();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _currentBottomNavigation = ref.watch(currentBottomNavigation);
    final navigationItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(FontAwesomeIcons.home),
        label: "ホーム",
      ),
      const BottomNavigationBarItem(
        icon: Icon(FontAwesomeIcons.home),
        label: "ホーム",
      ),
      const BottomNavigationBarItem(
        icon: Icon(FontAwesomeIcons.home),
        label: "ホーム",
      ),
      const BottomNavigationBarItem(
        icon: Icon(FontAwesomeIcons.home),
        label: "ホーム",
      ),
    ];

    Widget bottomNavigationBar = SizedBox(
      height: bottomNavigationBarHeight,
      child: BottomNavigationBar(
        items: navigationItems,
        currentIndex: _currentBottomNavigation,
        onTap: (int index) {
          ref.read(currentBottomNavigation.notifier).setCurrentIndex(index);
        },
      ),
    );

    return Container(
      color: bgColor,
      child: SafeArea(
        child: Scaffold(
          body: setWidget(_currentBottomNavigation),
          bottomNavigationBar: bottomNavigationBar,
        ),
      ),
    );
  }
}
