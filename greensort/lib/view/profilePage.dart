import 'package:flutter/material.dart';
import 'package:greensort/widgets/pro5Appbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),

          // Điểm thử thách
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Điểm thử thách:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '+1000',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[700],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Các nút chức năng
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                buildProfileOption(
                  icon: Icons.help_outline,
                  text: 'Giúp đỡ & hỗ trợ',
                  onTap: () {
                    // Xử lý khi nhấn vào
                  },
                ),
                buildProfileOption(
                  icon: Icons.policy_outlined,
                  text: 'Chính sách & bảo mật',
                  onTap: () {
                    // Xử lý khi nhấn vào
                  },
                ),
                buildProfileOption(
                  icon: Icons.history,
                  text: 'Lịch sử phát triển',
                  onTap: () {
                    // Xử lý khi nhấn vào
                  },
                ),
              ],
            ),
          ),

          // Nút đăng xuất
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: GestureDetector(
              onTap: () {
                // Xử lý khi nhấn vào Đăng xuất
              },
              child: const Text(
                'Đăng xuất?',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProfileOption({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.green),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
