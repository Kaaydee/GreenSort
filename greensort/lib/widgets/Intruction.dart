import 'package:flutter/material.dart';
import 'package:greensort/view/trashdetail.dart';
import 'package:greensort/widgets/WasteCategory.dart';

class WasteCategoryScreen extends StatelessWidget {
  const WasteCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xfff6dff7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Hướng dẫn phân loại rác',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Inter',
              color: Color(0xff630657),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          buildWasteCategory(
            Colors.green,
            'Rác thải hữu cơ',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const DetailScreen(title: 'Rác thải hữu cơ'),
                ),
              );
            },
          ),
          buildWasteCategory(
            Colors.blue,
            'Rác thải tái chế',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const DetailScreen(title: 'Rác thải tái chế'),
                ),
              );
            },
          ),
          buildWasteCategory(
            Colors.red,
            'Các rác thải khác',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const DetailScreen(title: 'Các rác thải khác'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
