import 'package:ai_mobile/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cart, child) {
        return ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: cart.carts.length,
          itemBuilder: (context, index) {
            final data = cart.carts;
            return Padding(
              padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(data[index]['image']),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          child: Text(
                            data[index]['name'],
                            maxLines: 3,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Text(
                          "₭${data[index]['price']}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                        width: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (){
                                cart.removeCart(cart: data[index],index: index);
                              },
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Center(
                                  child: Icon(Icons.remove, size: 20),
                                ),
                              ),
                            ),
                            Text(data[index]['qty'].toString()),
                            GestureDetector(
                              onTap: (){
                                cart.saveCart(cart: data[index], index: index);
                              },
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.green,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
         
          },
        );
      },
    );
  }
}
