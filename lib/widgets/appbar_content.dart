import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppbarContent extends ConsumerWidget implements PreferredSizeWidget {
  final String title;
  const AppbarContent({required this.title, Key? key}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Container(
        margin: const EdgeInsets.only(right: 2),
        height: 24,
        child: Image.asset("assets/images/logo.png"),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 16),
          child: const Icon(FontAwesomeIcons.cog, size: 20),
        ),
      ],
    );
  }
}
