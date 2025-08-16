import 'package:ai_mobile/provider/banner_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  // List<String> data = [
  //   "https://img.lazcdn.com/us/domino/cd0c7535-1068-43a9-a10a-ac8b910c1bf0_TH-1976-688.jpg_2200x2200q80.jpg_.avif",
  //   "https://img.lazcdn.com/us/domino/2669e9fe-0435-4b2e-8baf-cf94189401a1_TH-1976-688.jpg_2200x2200q80.jpg_.avif",
  //   "https://img.lazcdn.com/us/domino/5e194b93-9c6a-4ec0-b1bd-1dbdbf6c8cba_TH-1976-688.jpg_2200x2200q80.jpg_.avif",
  // ];
  int currentIndex = 0;
  final controller = PageController();
  final carController = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return Consumer<BannerProvider>(
      builder: (context,banner,child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  height: 140,
                  viewportFraction: 1,
                  onPageChanged: (index, reson) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
                items: banner.banners.map((i) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    //decoration: BoxDecoration(color: Colors.amber),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(i['image'], fit: BoxFit.cover),
                    ),
                  );
                }).toList(),
              ),
          
              // CarouselSlider.builder(
              //   itemCount: data.length,
              //   carouselController: carController,
              //   itemBuilder: (context, index, i) {
              //     return Column(
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: ClipRRect(
              //             borderRadius: BorderRadius.circular(10),
              //             child: Image.network(data[index]),
              //           ),
              //         ),
              //       ],
              //     );
              //   },
              //   options: CarouselOptions(
              //     height: 160,
          
              //     autoPlay: true,
              //     viewportFraction: 1,
              //     onPageChanged: (index, reson) {
              //       setState(() {
              //         currentIndex = index;
              //       });
              //     },
              //   ),
              // ),
              Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    
                    mainAxisAlignment: MainAxisAlignment.center,
                    
                    children: banner.banners.map((e) {
                      final index = banner.banners.indexOf(e);
                      return Row(
                        children: [
                          Container(
                            height: currentIndex == index ? 8 : 5,
                            width: currentIndex == index ? 10 : 5,
                            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            decoration: BoxDecoration(
                              color: currentIndex == index ? Colors.green : Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
           
            ],
          ),
        );
      }
    );
  }
}
