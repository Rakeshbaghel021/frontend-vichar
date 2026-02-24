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
    final size = MediaQuery.of(context).size;
    final bool isMobile = size.width < 700;
    final bool isTablet = size.width >= 700 && size.width < 1100;
    return Container(
      width: double.infinity,
      height: size.height,
      decoration: BoxDecoration(
        color: AppColor.mainColor,
        border: const Border(
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 90,
            vertical: isMobile ? 40 : 80,
          ),
          child: isMobile
              ? _mobileLayout(context)
              : _desktopLayout(context, isTablet),
        ),
      ),
    );
  }

  Widget _desktopLayout(BuildContext context, bool isTablet) {
    return Row(
      children: [
        Expanded(flex: 5, child: Center(child: _textContent(context))),
        const SizedBox(width: 40),
        Expanded(
          flex: 6,
          child: Center(
            child: Image.asset("assets/image/hero.png", fit: BoxFit.contain),
          ),
        ),
      ],
    );
  }

  Widget _mobileLayout(BuildContext context) {
    return Center(
      child: SingleChildScrollView(child: _textContent(context, center: true)),
    );
  }

  Widget _textContent(BuildContext context, {bool center = false}) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double titleSize = screenWidth > 1400
        ? 96
        : screenWidth > 1100
        ? 80
        : screenWidth > 800
        ? 64
        : 48;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: center
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: center
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "Vichar",
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.visible,
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
              child: Text(
                "Soch & Kathayen",
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.visible,
                textAlign: center ? TextAlign.center : TextAlign.start,
                style: TextStyle(
                  fontSize: titleSize * 0.9,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: RichText(
            textAlign: center ? TextAlign.center : TextAlign.start,
            text: const TextSpan(
              style: TextStyle(
                fontSize: 18,
                height: 1.6,
                color: Colors.black54,
              ),
              children: [
                TextSpan(text: "A platform "),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Icon(
                      Icons.edit_outlined,
                      size: 16,
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
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: center
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            Flexible(
              child: ElevatedButton(
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
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Flexible(
              child: OutlinedButton(
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
                child: const Text(
                  "Start Writing",
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
