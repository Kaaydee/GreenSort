import 'package:flutter/material.dart';

class NewWidget extends StatefulWidget {
  final int earnedPoints;

  const NewWidget({super.key, required this.earnedPoints});

  @override
  State<NewWidget> createState() => NewWidgetState();
}

class NewWidgetState extends State<NewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 50, // Adjust the size of the circle
            height: 50, // Adjust the size of the circle
            decoration: BoxDecoration(
              color: Colors.white, // White background for the circle
              shape: BoxShape.circle, // Makes it a circle
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(
              Icons.emoji_events,
              color: Colors.orange,
              size: 30, // Icon size inside the circle
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 30)),
          const SizedBox(width: 10),
          Text(
            'Điểm cộng đồng\nĐiểm tích lũy: ${widget.earnedPoints}/100',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
