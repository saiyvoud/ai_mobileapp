import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class MenuHomework extends StatefulWidget {
  const MenuHomework({super.key});

  @override
  State<MenuHomework> createState() => _MenuHomeworkState();
}

class _MenuHomeworkState extends State<MenuHomework> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(0),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Icon(
                          LucideIcons.wallet,
                          color: Colors.indigo,
                          size: 30,
                        ),
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "Send",
                        style: TextStyle(fontSize: 16, color: Colors.white54),
                      ),
                    ),
                  ],
                ),
               SizedBox(width: 30),
              ],
            ),
          );
        },
      ),
    );
  }
}
