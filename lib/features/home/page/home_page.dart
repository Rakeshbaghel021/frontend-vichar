import 'package:flutter/material.dart';
import 'package:vichar_frontend/features/home/widgets/article_feed.dart';
import 'package:vichar_frontend/features/home/widgets/category_tabs.dart';
import 'package:vichar_frontend/features/home/widgets/home_header.dart';
import 'package:vichar_frontend/features/home/widgets/right_sidebar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 900;

    return Scaffold(
      body: Column(
        children: [
          const HomeHeader(),
          const CategoryTabs(),
          Expanded(
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1200),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(flex: 7, child: ArticleFeed()),
                    if (!isMobile) ...[
                      const SizedBox(width: 30),
                      const Expanded(flex: 3, child: RightSidebar()),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
