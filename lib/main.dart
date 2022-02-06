import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:demo_app_news/style/theme.dart';
import 'package:demo_app_news/root.dart';

main() async {
  // Initialization
  WidgetsFlutterBinding.ensureInitialized();

  // RunApp
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "デモアプリ",
      theme: themeData,
      home: const Root(),
    );
  }
}
