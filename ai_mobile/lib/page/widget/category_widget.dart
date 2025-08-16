import 'package:ai_mobile/page/widget/stricky_flutter.dart';
import 'package:ai_mobile/provider/category_provider.dart';
import 'package:ai_mobile/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  int currentIndex = 0;
  onTap(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, categoryProvider, child) {
        return SliverStickyHeader(
          sticky: true,
          header: Container(
           
            margin: EdgeInsets.symmetric(vertical: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoryProvider.categories.map((data) {
                  final index = categoryProvider.categories.indexOf(data);
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Consumer<ProductProvider>(
                      builder: (context,product,child) {
                        return GestureDetector(
                          onTap: (){
                            onTap(index);
                            product.getProductBy(categoryId: data['_id'] );
                          },
                          child: Container(
                            width: 80,
                            padding: EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              color: currentIndex == index ?  Colors.green : Colors.transparent,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              data['title'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: currentIndex == index ? Colors.white : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          sliver: SliverToBoxAdapter(
            // <-- ໃສ່ໄປເພື່ອໃຫ້ເປັນ sliver ທີ່ຖືກຕ້ອງ
            child: SizedBox.shrink(), // ຫຼືໃສ່ content ເພີ່ມໄດ້
          ),
        );
      },
    );
  }
}
