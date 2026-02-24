import 'package:flutter/material.dart';
import 'package:vichar_frontend/core/app_color.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 54, vertical: 14),
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
          const SizedBox(width: 20),
          Expanded(
            child: Container(
              height: 42,
              decoration: BoxDecoration(
                color: AppColor.mainColor,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.black12, width: .5),
              ),
              child: TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: "Search articles",
                  hintStyle: const TextStyle(color: Colors.black54),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.black54,
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
