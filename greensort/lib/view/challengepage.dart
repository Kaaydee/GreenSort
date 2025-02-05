import 'package:flutter/material.dart';
import 'package:greensort/view/playAndStudy.dart';
import 'package:greensort/view/trashdetail.dart';
import 'package:greensort/widgets/BottomappBar.dart';
import 'package:greensort/widgets/ChallengeAppbar.dart';

class ChallengePage extends StatelessWidget {
  const ChallengePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChallengeAppBar(),
      body: SingleChildScrollView(
        // Wrap the entire body in a SingleChildScrollView
        child: Column(
          children: [
            // Thử thách trong tuần
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Thử thách trong tuần:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildChallengeCard(
                        color: const Color(0xff70841F),
                        icon: Icons.recycling,
                        title: 'Tái chế 10 chai nhựa',
                        status: 'ĐÃ BẮT ĐẦU',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DetailScreen(
                                title: 'Tái chế 10 chai nhựa',
                              ),
                            ),
                          );
                        },
                      ),
                      _buildChallengeCard(
                        color: const Color.fromARGB(255, 209, 49, 158),
                        icon: Icons.broken_image,
                        title: 'Thu thập mảnh vỡ',
                        status: 'ĐÃ BẮT ĐẦU',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DetailScreen(
                                title: 'Thu thập mảnh vỡ',
                              ),
                            ),
                          );
                        },
                      ),
                      _buildChallengeCard(
                        color: const Color.fromARGB(255, 35, 183, 65),
                        icon: Icons.eco,
                        title: 'Trồng 5 cây xanh',
                        status: 'ĐÃ BẮT ĐẦU',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DetailScreen(
                                title: 'Trồng 5 cây xanh',
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(thickness: 2),
            // Thử thách đã hoàn thành
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Trò chơi và thử thách',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildGameCard(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PlayAndLearnScreen()));
                        },
                        color: Colors.red,
                        path: 'assets/tracnghiem.png',
                        title: 'Vừa học vừa chơi',
                      ),
                      _buildGameCard(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PlayAndLearnScreen()));
                        },
                        color: const Color.fromARGB(255, 68, 105, 70),
                        path: 'assets/candycrush.png',
                        title: 'Candy crush',
                      ),
                      _buildGameCard(
                        onTap: () {},
                        color: Colors.blue,
                        path: 'assets/wastesort.png',
                        title: 'Waste sorting',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(thickness: 2),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Phân loại rác nâng cao',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildGameCard(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PlayAndLearnScreen()));
                        },
                        color: Colors.deepPurple,
                        path: 'assets/wasteenhance.png',
                        title: 'Phân loại rác nâng cao',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
                height: 16), // Add some space before the "Mẹo trong ngày"
            // Mẹo trong ngày
            Container(
              margin: const EdgeInsets.only(bottom: 35),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              ),
              child: const Text(
                'Mẹo Trong Ngày: Giảm. Tái sử dụng. Tái chế.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottonappBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: const Icon(Icons.center_focus_strong),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

Widget _buildChallengeCard({
  required Color color,
  required IconData icon,
  required String title,
  required String status,
  required VoidCallback onTap, // Thêm callback
}) {
  return GestureDetector(
    onTap: onTap, // Điều hướng hoặc xử lý sự kiện nhấn
    child: Container(
      width: 100,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 32),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            status,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildGameCard({
  required Color color,
  required String path,
  required String title,
  required VoidCallback onTap,
  // required String completedDate,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 100,
      height: 160,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Container(
            width: 90.0, // Kích thước bao gồm viền
            height: 90.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white, // Màu viền
                width: 3.0, // Độ dày viền
              ),
            ),
            child: CircleAvatar(
              radius: 40.0,
              backgroundColor: Colors.transparent, // Nền trong suốt
              child: ClipOval(
                child: Image.asset(
                  path,
                  width: 70.0, // Kích thước ảnh
                  height: 70.0,
                  fit: BoxFit.cover, // Cắt ảnh để vừa vòng tròn
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    ),
  );
}
