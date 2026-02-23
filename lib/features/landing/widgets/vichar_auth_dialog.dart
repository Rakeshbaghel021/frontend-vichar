import 'package:flutter/material.dart';

class AuthDialogConfig {
  final String title;
  final String subtitle;
  final String bottomText;
  final String actionText;
  final VoidCallback? onSwitch;

  const AuthDialogConfig({
    required this.title,
    required this.subtitle,
    required this.bottomText,
    required this.actionText,
    this.onSwitch,
  });

  factory AuthDialogConfig.signup(VoidCallback onSwitch) {
    return AuthDialogConfig(
      title: "Join Vichar",
      subtitle: "Read, write & share your ideas",
      bottomText: "Already have an account? ",
      actionText: "Sign In",
      onSwitch: onSwitch,
    );
  }

  factory AuthDialogConfig.signin(VoidCallback onSwitch) {
    return AuthDialogConfig(
      title: "Welcome Back",
      subtitle: "Sign in to continue your journey",
      bottomText: "Don't have an account? ",
      actionText: "Sign Up",
      onSwitch: onSwitch,
    );
  }
}

void showVicharAuthDialog(
  BuildContext context, {
  required AuthDialogConfig config,
}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black.withValues(alpha: 0.4),
    builder: (_) => VicharAuthDialog(config: config),
  );
}

class VicharAuthDialog extends StatelessWidget {
  final AuthDialogConfig config;

  const VicharAuthDialog({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 600;

    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: isMobile ? double.infinity : 620,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 40,
                      color: Colors.black26,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: _dialogContent(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _dialogContent(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 6),
              Text(
                config.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                config.subtitle,
                style: const TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 28),
              Center(
                child: _socialButton(
                  icon: Icons.g_mobiledata,
                  text: "Continue with Google",
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: _socialButton(
                  icon: Icons.facebook,
                  text: "Continue with Facebook",
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: _socialButton(
                  icon: Icons.email_outlined,
                  text: "Continue with Email",
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(config.bottomText),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        config.onSwitch?.call();
                      },
                      child: Text(
                        config.actionText,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                "By signing up, you agree to our Terms of Service and Privacy Policy.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ],
          ),
        ),
        Positioned(
          right: 8,
          top: 8,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ],
    );
  }

  static Widget _socialButton({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(25),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 320),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(25),
          ),
          child: SizedBox(
            height: 48,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(alignment: Alignment.centerLeft, child: Icon(icon)),
                Center(
                  child: Text(
                    text,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
