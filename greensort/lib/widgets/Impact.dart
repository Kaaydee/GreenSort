import 'package:flutter/material.dart';

class Impact extends StatelessWidget {
  const Impact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Ô 1 - Rác đã phân loại
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Column(
              children: [
                Icon(Icons.delete, color: Color(0xff003881), size: 30),
                SizedBox(height: 5),
                Text(
                  'Rác đã phân loại',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Inter',
                      color: Color(0xff003881),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '42 kg tuần này',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Inter',
                      color: Color(0xff003881),
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        // Ô 2 - Tác động môi trường
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.orange[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Column(
              children: [
                Icon(Icons.warning, color: Color(0xffFE9E18), size: 30),
                SizedBox(height: 5),
                Text(
                  'Tác động môi trường',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xffFE9E18),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Giảm 120 kg CO2',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xffFE9E18),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
