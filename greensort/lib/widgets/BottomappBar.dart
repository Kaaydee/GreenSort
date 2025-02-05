import 'package:flutter/material.dart';
import 'package:greensort/main.dart';
import 'package:greensort/view/challengepage.dart';
import 'package:greensort/view/newspage.dart';
import 'package:greensort/view/profilePage.dart';

class BottonappBar extends StatelessWidget {
  const BottonappBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xff528265),
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            color: Colors.white,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyApp()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EventsPage()),
              );
            },
          ),
          const SizedBox(width: 40), // Space for FAB
          IconButton(
            icon: const Icon(Icons.flash_on),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChallengePage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
