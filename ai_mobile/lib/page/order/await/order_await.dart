import 'package:ai_mobile/provider/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderAwait extends StatefulWidget {
  const OrderAwait({super.key});

  @override
  State<OrderAwait> createState() => _OrderAwaitState();
}

class _OrderAwaitState extends State<OrderAwait> {
  @override
  void initState() {
    // TODO: implement initSt
    context.read<OrderProvider>()..getOrderByStatusAwait();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(
      builder: (context, order, child) {
        if(order.orders.isEmpty){
          return Center(child: CircularProgressIndicator() ,);
        }
        return ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: order.orders.length,
          itemBuilder: (context, index) {
            final data = order.orders;
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
                      color: Colors.amber,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Icon(Icons.info,color: Colors.white,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Container(
                        //   width: 200,
                        //   child: Text(
                        //     data[index]['address'],
                        //     maxLines: 3,
                        //     style: TextStyle(fontSize: 12),
                        //   ),
                        // ),
                        Text(
                          "₭${data[index]['totalPrice'].toString()}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
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
