import 'package:flutter/material.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// TEXT
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Design",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),

              SizedBox(height: 6),

              Text(
                "Best Practice To Make UI Design Look Attractive",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 6),

              Text(
                "Short description of article preview goes here...",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              SizedBox(height: 10),

              Text(
                "6 min read • 1 day ago",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),

        const SizedBox(width: 16),

        /// IMAGE
        Container(width: 110, height: 80, color: Colors.grey.shade300),
      ],
    );
  }
}
