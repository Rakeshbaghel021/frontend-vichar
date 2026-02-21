import 'package:flutter/material.dart';
import 'package:vichar_frontend/features/landing/widgets/hero_section.dart';
import '../widgets/landing_header.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [LandingHeader(), HeroSection()]),
      ),
    );
  }
}
