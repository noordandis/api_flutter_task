import 'package:flutter/material.dart';

import '../../../author/presentation/screens/home_author.dart';
import '../../../constants.dart';
import 'home_book.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  int _currentIndex = 1;

  final List<Widget> _screens = [
    const AuthorsScreen(),
    const BooksScreen(),
    const Center(
      child: Text(
        'الإعدادات',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryNavy,
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xFF334155), width: 1)),
        ),
        child: BottomNavigationBar(
          backgroundColor: cardBg,
          currentIndex: _currentIndex,
          selectedItemColor: accentYellow,
          unselectedItemColor: Colors.grey.shade400,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'المؤلفون',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book),
              label: 'الكتب',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'الإعدادات',
            ),
          ],
        ),
      ),
    );
  }
}
