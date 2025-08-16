import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageControllerWidget extends StatefulWidget {
  const PageControllerWidget({super.key});

  @override
  State<PageControllerWidget> createState() => _PageControllerWidgetState();
}

class _PageControllerWidgetState extends State<PageControllerWidget> {
  final controller = PageController();
  List<String> data = [
    "https://img.lazcdn.com/us/domino/cd0c7535-1068-43a9-a10a-ac8b910c1bf0_TH-1976-688.jpg_2200x2200q80.jpg_.avif",
    "https://img.lazcdn.com/us/domino/2669e9fe-0435-4b2e-8baf-cf94189401a1_TH-1976-688.jpg_2200x2200q80.jpg_.avif",
    "https://img.lazcdn.com/us/domino/5e194b93-9c6a-4ec0-b1bd-1dbdbf6c8cba_TH-1976-688.jpg_2200x2200q80.jpg_.avif",
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 140,
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            children: data.map((i) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(i)),
              );
            }).toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: SmoothPageIndicator(
            controller: controller,
            
            count: data.length,
            
            effect: ExpandingDotsEffect(activeDotColor: Colors.green,dotHeight: 10,dotWidth: 10),
          ),
        ),
      ],
    );
  }
}
