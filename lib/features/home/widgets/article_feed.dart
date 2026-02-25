import 'package:flutter/material.dart';
import 'article_card.dart';

class ArticleFeed extends StatelessWidget {
  const ArticleFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 20),
      itemCount: 6,
      separatorBuilder: (_, _) => const Divider(),
      itemBuilder: (_, i) => const ArticleCard(),
    );
  }
}
