import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class StrickyFlutter extends StatefulWidget {
  const StrickyFlutter({super.key});

  @override
  State<StrickyFlutter> createState() => _StrickyFlutterState();
}

class _StrickyFlutterState extends State<StrickyFlutter> {
  List<dynamic> category = [
    {
      "image":
          "https://cdn.xsd.cz/resize/52964782b0023f22a558fec2a9282953_resize=398,372_.jpg?hash=7499d620137c8e88a678cece350094e8",
      "name": "Nike",
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1dtlrN5hP1x-m9AwA-NqGuUv2rwyehMoIkg&s",
      "name": "Adidas",
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNOhHZ-0c3De3DFuwuosHkDnJRDwhDb-tLdw&s",
      "name": "Pume",
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQj24ZRJv_ivbQCwbQVkCk7-jKiwQLsWDA12A&s",
      "name": "Zara",
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyazDF2yf6IK3-FP2XGM6s83oX8nEalGFnhg&s",
      "name": "The North Face",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return 
    SliverStickyHeader(
      header: Container(
        height:   120,
        //decoration: BoxDecoration(color: Colors.red),
        child: Row(
          children: category.map((data) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(data['image'], fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: SizedBox(
                    width: 80,
                    child: Center(
                      child: Text(
                        data['name'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
      
     
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) => ListTile(
            leading: CircleAvatar(child: Text('0')),
            title: Text('List tile #$i'),
          ),
          childCount: 4,
        ),
      ),
    );
 
  }
}
