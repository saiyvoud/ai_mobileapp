import 'package:ai_mobile/page/cart/cart_page.dart';
import 'package:ai_mobile/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class BottomNavigatorWidget extends StatefulWidget {
  const BottomNavigatorWidget({super.key});

  @override
  State<BottomNavigatorWidget> createState() => _BottomNavigatorWidgetState();
}

class _BottomNavigatorWidgetState extends State<BottomNavigatorWidget> {
  int currentIndex = 0;
  List<Widget> children = [
    HomePage(),
    CartPage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];
  onTap(index){
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
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(LucideIcons.house), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.shoppingBag),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.ticketPercent),
            label: 'Order',
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
