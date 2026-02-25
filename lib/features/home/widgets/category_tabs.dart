import 'dart:ui';
import 'package:flutter/material.dart';

class CategoryTabs extends StatefulWidget {
  const CategoryTabs({super.key});

  @override
  State<CategoryTabs> createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<CategoryTabs> {
  final List<String> tabs = [
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

  int activeIndex = 0;

  final ScrollController _scrollController = ScrollController();

  final List<GlobalKey> _tabKeys = [];

  @override
  void initState() {
    super.initState();
    _tabKeys.addAll(List.generate(tabs.length, (_) => GlobalKey()));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth < 700 ? 20.0 : 65.0;

    return Container(
      height: 56,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12)),
      ),
      child: ScrollConfiguration(
        behavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
            PointerDeviceKind.trackpad,
          },
        ),

        child: ListView.separated(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: tabs.length,
          separatorBuilder: (_, _) => const SizedBox(width: 24),
          itemBuilder: (context, i) {
            final bool isActive = i == activeIndex;
            return GestureDetector(
              onTap: () {
                setState(() => activeIndex = i);
                final ctx = _tabKeys[i].currentContext;
                if (ctx != null) {
                  Scrollable.ensureVisible(
                    ctx,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    alignment: 0.3,
                  );
                }
              },
              child: Container(
                key: _tabKeys[i],
                alignment: Alignment.center,
                child: Builder(
                  builder: (context) {
                    final textStyle = TextStyle(
                      fontSize: 15,
                      fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                      color: isActive ? Colors.black : Colors.black54,
                    );
                    final underlineWidth = _textWidth(tabs[i], textStyle);
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(tabs[i], style: textStyle),
                        const SizedBox(height: 6),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeOut,
                          height: 2,
                          width: isActive ? underlineWidth : 0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

double _textWidth(String text, TextStyle style) {
  final textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    maxLines: 1,
    textDirection: TextDirection.ltr,
  )..layout();

  return textPainter.size.width;
}
