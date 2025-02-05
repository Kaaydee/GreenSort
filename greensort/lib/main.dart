import 'package:flutter/material.dart';
import 'package:greensort/view/Startpage.dart';
import 'package:greensort/view/scanpage.dart';
// import 'package:greensort/view/challengepage.dart';
import 'package:greensort/widgets/BottomappBar.dart';
import 'package:greensort/widgets/CustomAppBar.dart';
import 'package:greensort/widgets/Impact.dart';
import 'package:greensort/widgets/Intruction.dart';
import 'package:greensort/widgets/mark.dart';
import 'package:provider/provider.dart';
import 'package:greensort/widgets/pointsprovider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PointsProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StartPage(),
      ),
    ),
  );
}

////Lam bieng tach Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 35, 16, 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hiển thị điểm từ Provider
            Consumer<PointsProvider>(
              builder: (context, pointsProvider, child) {
                return NewWidget(earnedPoints: pointsProvider.points);
              },
            ),
            const SizedBox(height: 30),
            const Impact(),
            const SizedBox(height: 40),
            const WasteCategoryScreen(),
          ],
        ),
      ),
      bottomNavigationBar: const BottonappBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Mở ScanPage và nhận lại điểm
          final int? result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ScanPage()),
          );

          // Cộng điểm vào Provider
          if (result != null) {
            Provider.of<PointsProvider>(context, listen: false)
                .addPoints(result);
          }
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.center_focus_strong),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
