import 'package:ai_mobile/page/home_page.dart';
import 'package:ai_mobile/page/homework/homework.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class BottomHomeWork extends StatefulWidget {
  const BottomHomeWork({super.key});

  @override
  State<BottomHomeWork> createState() => _BottomHomeWorkState();
}

class _BottomHomeWorkState extends State<BottomHomeWork> {
  int currentIndex = 0;
  List<Widget> children = [
    HomeWork(),
    Container(height: 500, color: Colors.red),
    HomePage(),
    HomePage(),
    HomePage(),
  ];
  onTap(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: children[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(LucideIcons.house), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.shoppingBag),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(color: Colors.indigo,borderRadius: BorderRadius.circular(15)),
              child: Center(child: Icon(Icons.add,color: Colors.white,)),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.heart),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.user),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
