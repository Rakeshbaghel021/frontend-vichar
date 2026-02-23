import 'package:flutter/material.dart';
import 'package:vichar_frontend/core/app_color.dart';

class OurStoryPage extends StatelessWidget {
  const OurStoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 800;

    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: isMobile ? double.infinity : 760,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 0,
              vertical: 80,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _HeaderSection(),
                SizedBox(height: 60),
                _StorySection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// ================= HEADER =================

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Our Story",
          style: TextStyle(
            fontSize: 52,
            fontWeight: FontWeight.w900,
            letterSpacing: -1,
          ),
        ),
        SizedBox(height: 16),
        Text(
          "Why Vichar exists and what we believe.",
          style: TextStyle(fontSize: 20, color: Colors.black54),
        ),
      ],
    );
  }
}

/// ================= STORY CONTENT =================

class _StorySection extends StatelessWidget {
  const _StorySection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Vichar began with a simple idea — everyone has thoughts worth sharing.",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            height: 1.6,
          ),
        ),

        SizedBox(height: 28),

        Text(
          "In a world filled with short attention spans and endless scrolling, "
          "deep thinking and meaningful storytelling often get lost. "
          "Vichar was created as a space where ideas slow down, stories matter, "
          "and voices are heard.\n\n"
          "We believe writing is not just about publishing content — "
          "it is about expression, reflection, and connection.\n\n"
          "Whether you are sharing personal experiences, technical knowledge, "
          "poetry, or opinions, Vichar gives you a platform to write freely "
          "and read thoughtfully.",
          style: TextStyle(fontSize: 18, height: 1.9, color: Colors.black87),
        ),

        SizedBox(height: 40),

        Text(
          "Our Mission",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),

        SizedBox(height: 16),

        Text(
          "To build a community where ideas grow, stories inspire, "
          "and thoughtful conversations shape the future.",
          style: TextStyle(fontSize: 18, height: 1.8),
        ),
      ],
    );
  }
}
