import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:greensort/widgets/resultAppbar.dart';

class ScanResultPage extends StatelessWidget {
  final Uint8List image;
  final String result;
  final String accur;
  const ScanResultPage(
      {super.key,
      required this.image,
      required this.result,
      required this.accur});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ResultAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.yellow.shade100,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.orange),
                  SizedBox(width: 8),
                  Text(
                    'Điểm cộng đồng: +5',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Image.memory(image, fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),
            Text(
              'Phân loại: $result ',
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Độ tin cậy: $accur',
              style: const TextStyle(fontSize: 20, color: Colors.grey),
            ),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 5);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Đổi màu nền của nút
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0), // Tăng kích thước nút
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0), // Cạnh nút bo tròn
                ),
              ),
              child: const Text(
                "Xong",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
