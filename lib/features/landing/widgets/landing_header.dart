import 'package:flutter/material.dart';

class LandingHeader extends StatelessWidget {
  const LandingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 700;
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 247, 246, 242),
        border: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: 18,
      ),
      child: Row(
        children: [
          const Text(
            "Vichar",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.5,
            ),
          ),
          const Spacer(),
          if (!isMobile) ...[
            _menuItem("Our Story"),
            _menuItem("Write"),
            _menuItem("Paid"),
            const SizedBox(width: 20),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Sign In",
                style: TextStyle(color: Colors.black87, fontSize: 15),
              ),
            ),
            const SizedBox(width: 10),
          ],
          ElevatedButton(
            onPressed: () {},
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

  Widget _menuItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: InkWell(
        onTap: () {},
        child: Text(
          title,
          style: const TextStyle(fontSize: 15, color: Colors.black87),
        ),
      ),
    );
  }
}
