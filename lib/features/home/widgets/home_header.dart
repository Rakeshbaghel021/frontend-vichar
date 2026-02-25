import 'package:flutter/material.dart';
import 'package:vichar_frontend/core/app_color.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final double searchWidth = width > 1400
        ? 520
        : width > 1000
        ? 420
        : double.infinity;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 14),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.black12)),
      ),
      child: Row(
        children: [
          const Text(
            "Vichar",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: searchWidth),
                child: Container(
                  height: 42,
                  decoration: BoxDecoration(
                    color: AppColor.mainColor,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.black12, width: 0.6),
                  ),
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      hintText: "Search articles",
                      hintStyle: TextStyle(color: Colors.black54),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 20,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
          const SizedBox(width: 8),
          const CircleAvatar(radius: 16),
        ],
      ),
    );
  }
}
