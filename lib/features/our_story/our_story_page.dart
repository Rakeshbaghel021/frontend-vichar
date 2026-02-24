import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vichar_frontend/core/app_color.dart';
import 'package:vichar_frontend/features/landing/widgets/footer_section.dart';
import 'package:vichar_frontend/features/landing/widgets/vichar_auth_dialog.dart';

class OurStoryPage extends StatelessWidget {
  const OurStoryPage({super.key});
  void openSignup(BuildContext context) {
    showVicharAuthDialog(
      context,
      config: AuthDialogConfig.signup(() => openSignin(context)),
    );
  }

  void openSignin(BuildContext context) {
    showVicharAuthDialog(
      context,
      config: AuthDialogConfig.signin(() => openSignup(context)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 800;

    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: Column(
        children: [
          _StoryHeader(
            onSignin: () => openSignin(context),
            onSignup: () => openSignup(context),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  width: isMobile ? double.infinity : 760,
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 24 : 0,
                    vertical: 80,
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _HeaderSection(),
                      SizedBox(height: 60),
                      _StorySection(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          FooterSection(),
        ],
      ),
    );
  }
}

class _StoryHeader extends StatelessWidget {
  final VoidCallback onSignin;
  final VoidCallback onSignup;
  const _StoryHeader({required this.onSignin, required this.onSignup});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 700;
    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 90,
        vertical: 18,
      ),
      child: Row(
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => context.go("/"),
              child: const Text(
                "Vichar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.5,
                ),
              ),
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: onSignin,
            child: const Text(
              "Sign In",
              style: TextStyle(color: Colors.white70, fontSize: 15),
            ),
          ),
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: onSignup,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              elevation: 0,
            ),
            child: const Text("Sign Up"),
          ),
        ],
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
