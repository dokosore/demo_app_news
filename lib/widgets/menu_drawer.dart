import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuDrawer extends ConsumerWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black38,
                  width: 1.0,
                ),
              ),
            ),
            child: Text(
              "デモアプリ",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          const SizedBox(height: 8),
          const ProfileBox(),
          const SizedBox(height: 4),
          MenuItem(
            onTap: () async {
              Navigator.pop(context);
            },
            icon: FontAwesomeIcons.home,
            title: "demo",
          ),
          const Spacer(),
          BottomMenuItem(
            onTap: () async {},
            title: "ログアウト",
          ),
          BottomMenuItem(
            onTap: () async {},
            title: "アカウント削除",
          ),
          BottomMenuItem(
            onTap: () async {},
            title: "利用規約",
          ),
          BottomMenuItem(
            onTap: () async {},
            title: "プライバシーポリシー",
          ),
        ],
      ),
    );
  }
}

class ProfileBox extends HookConsumerWidget {
  const ProfileBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 48,
              height: 48,
              color: Colors.black12,
              child: const Icon(
                Icons.account_circle_rounded,
                color: Colors.black38,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "斉藤",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Container(
                child: Text(
                  "saikai0011@gmail.com",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: Colors.black38),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MenuItem extends HookConsumerWidget {
  final Future<void> Function() onTap;
  final IconData icon;
  final String title;
  const MenuItem({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        onPrimary: Theme.of(context).primaryColor,
        elevation: 0,
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
      onPressed: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 12),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomMenuItem extends HookConsumerWidget {
  final Future<void> Function() onTap;
  final String title;
  const BottomMenuItem({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        onPrimary: Theme.of(context).primaryColor,
        elevation: 0,
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
      onPressed: onTap,
      child: SizedBox(
        width: double.infinity,
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black54,
              ),
        ),
      ),
    );
  }
}
