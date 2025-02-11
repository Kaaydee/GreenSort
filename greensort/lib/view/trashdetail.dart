import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title;

  const DetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          'Nội dung chi tiết cho $title',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
