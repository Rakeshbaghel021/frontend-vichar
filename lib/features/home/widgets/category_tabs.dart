import 'dart:ui';

import 'package:flutter/material.dart';

class CategoryTabs extends StatelessWidget {
  const CategoryTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = [
      "For you",
      "Following",
      "All",
      "Business",
      "Gaming",
      "Design",
      "Technology",
      "Art",
      "Development",
      "Nature",
      "Box Office",
      "God",
      "News",
    ];

    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ScrollConfiguration(
        behavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
            PointerDeviceKind.trackpad,
          },
        ),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: tabs.length,
          itemBuilder: (context, i) {
            return Center(
              child: Text(
                tabs[i],
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            );
          },

          separatorBuilder: (_, __) => const SizedBox(width: 24),
        ),
      ),
    );
  }
}
