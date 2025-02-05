import 'package:flutter/material.dart';
import 'package:greensort/view/chatpage.dart';
import 'package:greensort/widgets/BottomappBar.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Tin tức',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tabs: Tin tức và W&A
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Tin tức'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChatPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'W&A',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Địa điểm: VIỆT NAM',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),

              // Danh sách bài viết
              Expanded(
                child: ListView(
                  children: [
                    buildNewsCard(
                      context,
                      'Thực hiện phân loại rác tại nguồn từ 1/1/2025\nTrách nhiệm của cá nhân với môi trường',
                      'assets/news1.png',
                    ),
                    const SizedBox(height: 10),
                    buildNewsCard(
                      context,
                      'Khởi động Chương trình Phân loại rác tại nguồn\nKhánh thành Cơ sở thu hồi vật liệu (MRF)...',
                      'assets/news2.png',
                    ),
                    const SizedBox(height: 10),
                    buildNewsCard(
                      context,
                      'Chương trình giáo dục bảo vệ môi trường cho trẻ em\nLời nhắn từ GreenSort',
                      'assets/news3.png',
                    ),
                  ],
                ),
              ),
            ],
          ),
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

  // Widget hiển thị bài viết
  Widget buildNewsCard(BuildContext context, String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        // Mở bài viết hoặc trang chi tiết
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Mở bài viết: $title')),
        );
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
