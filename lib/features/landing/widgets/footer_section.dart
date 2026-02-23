import 'package:flutter/material.dart';
import 'package:vichar_frontend/core/app_color.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 700;
    final bgColor = isMobile ? Colors.black : AppColor.mainColor;
    final textColor = isMobile ? Colors.white70 : Colors.black54;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 22 : 30,
        horizontal: isMobile ? 16 : 60,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        border: isMobile
            ? null
            : const Border(top: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: isMobile ? 18 : 28,
          runSpacing: 10,
          children: [
            _navItem("Explore", textColor),
            _navItem("Write", textColor),
            _navItem("About", textColor),
            _navItem("Privacy", textColor),
            _navItem("Terms", textColor),
            _navItem("Contact", textColor),
          ],
        ),
      ),
    );
  }

  Widget _navItem(String title, Color color) {
    return InkWell(
      onTap: () {},
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
