import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vichar_frontend/core/app_color.dart';
import 'package:vichar_frontend/features/landing/widgets/vichar_auth_dialog.dart';

class LandingHeader extends StatelessWidget {
  const LandingHeader({super.key});

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
    final bool isMobile = width < 700;
    return Container(
      decoration: BoxDecoration(
        color: AppColor.mainColor,
        border: const Border(bottom: BorderSide(color: Colors.grey, width: 1)),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 90,
        vertical: 18,
      ),
      child: Row(
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {},
              child: const Text(
                "Vichar",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.5,
                ),
              ),
            ),
          ),
          const Spacer(),
          if (!isMobile) ...[
            _menuItem(context, "Our Story", () => context.go("/our-story")),
            _menuItem(context, "Write", () => context.go("/write")),
            _menuItem(context, "Free", () {}),
            const SizedBox(width: 20),
            TextButton(
              onPressed: () => openSignin(context),
              child: const Text(
                "Sign In",
                style: TextStyle(color: Colors.black87, fontSize: 15),
              ),
            ),
            const SizedBox(width: 10),
          ],
          ElevatedButton(
            onPressed: () => openSignup(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 16 : 20,
                vertical: 14,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              elevation: 0,
            ),
            child: const Text("Get Started"),
          ),
        ],
      ),
    );
  }

  Widget _menuItem(BuildContext context, String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: InkWell(
          onTap: onTap,
          child: Text(
            title,
            style: const TextStyle(fontSize: 15, color: Colors.black87),
          ),
        ),
      ),
    );
  }
}
