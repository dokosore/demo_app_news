import 'package:demo_app_news/common/view_functions.dart';
import 'package:demo_app_news/style/theme.dart';
import 'package:demo_app_news/widgets/appbar_content.dart';
import 'package:demo_app_news/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// デモ用
class Article {
  Article({
    required this.title,
    required this.image,
  });
  final String title;
  final String image;
}

final articleList = [
  Article(title: "サッカー日本代表選 W杯をかけた今日のスタメンは...?", image: "soccer"),
  Article(title: "大学共通テストで不正行為か SNSでカンニングの依頼!?", image: "classroom"),
  Article(title: "NASAの衛星が捉えた怪しい光の正体はUFO? 国際宇宙ステーションへ特別インタビュー", image: "nasa"),
  Article(
    title: "バイデン大統領が語る 米連邦議会乱入から1年経った今、トランプ前大統領の支持者に何を思っているのか",
    image: "whitehouse",
  ),
];

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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          _TopNewsList(),
          const SizedBox(height: 16),
          Expanded(child: _FeatureNewsList()),
        ],
      ),
    );
  }
}

class _TopNewsList extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      height: 196,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("トップニュース", style: Theme.of(context).textTheme.bodyText2),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: articleList.length,
              itemBuilder: (context, int i) {
                return _SmallNewsBox(
                  title: articleList[i].title,
                  image: articleList[i].image,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SmallNewsBox extends HookConsumerWidget {
  final String title;
  final String image;
  const _SmallNewsBox({required this.title, required this.image});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleText = ViewFunctions().cuttedText(title, 18);
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: 152,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 88,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                "assets/images/news/$image.jpg",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titleText,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: textColor),
                ),
                const SizedBox(height: 4),
                Text(
                  "1時間前",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureNewsList extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("今日の特集", style: Theme.of(context).textTheme.bodyText2),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(
              children: const [
                _LargeNewsBox(3),
                _LargeNewsBox(2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LargeNewsBox extends HookConsumerWidget {
  final int i;
  const _LargeNewsBox(this.i);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/images/news/${articleList[i].image}.jpg",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ViewFunctions().cuttedText(articleList[i].title, 36),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 4),
                Text(
                  "1時間前",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
