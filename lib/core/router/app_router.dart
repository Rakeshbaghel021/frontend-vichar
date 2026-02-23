import 'package:go_router/go_router.dart';
import 'package:vichar_frontend/features/landing/pages/landing_page.dart';
import 'package:vichar_frontend/features/our_story/our_story_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(path: "/", builder: (context, state) => const LandingPage()),
      GoRoute(
        path: "/our-story",
        builder: (context, state) => const OurStoryPage(),
      ),
    ],
  );
}
