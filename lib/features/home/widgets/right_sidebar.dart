import 'package:flutter/material.dart';

class RightSidebar extends StatelessWidget {
  const RightSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Text(
          "Top Writers",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),

        _writer("Chance Vetrov"),
        _writer("James Culhane"),
        _writer("Alfredo Bergson"),

        const SizedBox(height: 30),

        const Text(
          "Recommended Topics",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: const [
            Chip(label: Text("Technology")),
            Chip(label: Text("Design")),
            Chip(label: Text("Business")),
          ],
        ),
      ],
    );
  }

  Widget _writer(String name) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const CircleAvatar(),
      title: Text(name),
      trailing: const Text("Follow"),
    );
  }
}
