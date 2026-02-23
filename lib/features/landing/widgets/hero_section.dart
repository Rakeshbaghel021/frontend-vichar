import 'package:flutter/material.dart';
import 'package:vichar_frontend/core/app_color.dart';
import 'package:vichar_frontend/features/landing/widgets/vichar_auth_dialog.dart';

void openAuthDialog(BuildContext context, bool isSignin) {
  showVicharAuthDialog(
    context,
    config: isSignin
        ? AuthDialogConfig.signin(() => openAuthDialog(context, false))
        : AuthDialogConfig.signup(() => openAuthDialog(context, true)),
  );
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 700;
    final bool isTablet = width >= 700 && width < 1100;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 90,
        vertical: isMobile ? 50 : 150,
      ),
      decoration: BoxDecoration(
        color: AppColor.mainColor,
        border: const Border(
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: isMobile
          ? _mobileLayout(context)
          : _desktopLayout(context, isTablet),
    );
  }

  Widget _desktopLayout(BuildContext context, bool isTablet) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 5, child: _textContent(context, isTablet: isTablet)),
        const SizedBox(width: 40),
        Expanded(
          flex: 6,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Center(
                child: SizedBox(
                  height: constraints.maxHeight * 0.95,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Image.asset("assets/image/hero.png"),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _mobileLayout(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final padding = width < 400 ? 24.0 : 48.0;
    return SizedBox.expand(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: _textContent(context, center: true),
        ),
      ),
    );
  }

  Widget _textContent(
    BuildContext context, {
    bool isTablet = false,
    bool center = false,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double titleSize = screenWidth > 1400
        ? 96.0
        : screenWidth > 1100
        ? 80.0
        : screenWidth > 800
        ? 64.0
        : 68.0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: center
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: center
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: center ? Alignment.center : Alignment.centerLeft,
              child: Text(
                "Vichar",
                textAlign: center ? TextAlign.center : TextAlign.start,
                style: TextStyle(
                  fontSize: titleSize,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1.5,
                  height: 1.0,
                ),
              ),
            ),
            const SizedBox(height: 10),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: center ? Alignment.center : Alignment.centerLeft,
              child: Text(
                "Soch & Kathayen",
                textAlign: center ? TextAlign.center : TextAlign.start,
                style: TextStyle(
                  fontSize: titleSize,
                  fontWeight: FontWeight.w900,
                  height: 1.2,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: RichText(
            textAlign: center ? TextAlign.center : TextAlign.start,
            text: TextSpan(
              style: const TextStyle(
                fontSize: 18,
                height: 1.6,
                color: Colors.black54,
              ),
              children: const [
                TextSpan(text: "A platform "),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Icon(
                      Icons.edit_outlined,
                      size: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
                TextSpan(
                  text:
                      " to read, write and learn. Share your thoughts, "
                      "explore stories, and connect with writers around the world.",
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 35),
        Wrap(
          alignment: center ? WrapAlignment.center : WrapAlignment.start,
          spacing: 16,
          runSpacing: 12,
          children: [
            ElevatedButton(
              onPressed: () => openAuthDialog(context, false),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 18,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                "Start Reading",
                style: TextStyle(color: Colors.white),
              ),
            ),
            OutlinedButton(
              onPressed: () => openAuthDialog(context, false),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 18,
                ),
                side: const BorderSide(color: Colors.black),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text("Start Writing"),
            ),
          ],
        ),
      ],
    );
  }
}
