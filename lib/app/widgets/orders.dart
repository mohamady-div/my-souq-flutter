import 'package:flutter/material.dart';
import 'package:my_souq/app/widgets/single_product.dart';
import 'package:my_souq/components/declarations.dart';


class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  List list = [
    'https://via.placeholder.com/150/0000FF/808080%20?Text=Digital.com',
    'https://via.placeholder.com/150/FF0000/FFFFFF?Text=Down.com',
    'https://via.placeholder.com/150/FFFF00/000000?Text=WebsiteBuilders.com',
    'https://via.placeholder.com/150/000000/FFFFFF/?text=IPaddress.net'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: const Text(
                'My Orders',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                'View All',
                style: TextStyle(
                    fontSize: 15,
                    color: Declarations.selectedNavBarColor
                ),
              ),
            )
          ],
        ),
        Container(
          height: 170,
          padding: const EdgeInsets.only(left: 10, right: 5, top: 20),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length, itemBuilder: ((context, index) {
             return SingleProduct(image: list[index]);
          }),
          ),
        )
      ],
    );
  }
}
