import 'package:flutter/material.dart';

class ArticleCard extends StatefulWidget {
  const ArticleCard({super.key});

  @override
  State<ArticleCard> createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
        decoration: BoxDecoration(
          color: isHovering
              ? Colors.grey.withValues(alpha: .05)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      CircleAvatar(radius: 10),
                      SizedBox(width: 8),
                      Text(
                        "Rakesh Kumar",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 6),
                      Text(
                        "in Design",
                        style: TextStyle(fontSize: 13, color: Colors.black54),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Best Practices to Make UI Design Look Attractive",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Learn modern UI principles, spacing systems, typography rules and layout tricks that make your design instantly professional.",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: const [
                      Text(
                        "6 min read • 1 day ago",
                        style: TextStyle(fontSize: 13, color: Colors.black54),
                      ),
                      Spacer(),
                      Icon(Icons.bookmark_border, size: 20),
                      SizedBox(width: 12),
                      Icon(Icons.more_horiz, size: 20),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 18),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 130,
                height: 95,
                color: Colors.grey.shade300,
                child: const Icon(Icons.image, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
