import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigatorPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const NavigatorPage(this.navigationShell, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: '친구',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: '채팅',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '설정',
          ),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (value) => navigationShell.goBranch(value),
      ),
    );
  }
}
