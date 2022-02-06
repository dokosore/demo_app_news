import 'package:demo_app_news/widgets/appbar_content.dart';
import 'package:demo_app_news/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const AppbarContent(title: "News"),
      drawer: const Drawer(child: MenuDrawer()),
      body: _HomePage(),
    );
  }
}

class _HomePage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(child: Text("Flutter APP"));
  }
}
