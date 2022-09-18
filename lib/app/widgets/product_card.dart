import 'package:flutter/material.dart';
import 'package:my_souq/app/models/product.dart';
import 'package:my_souq/app/screens/product_details_screen.dart';
import 'package:my_souq/components/utils.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({Key? key, required this.product, required this.isLiked}) : super(key: key);

  final Product product;
  final bool isLiked;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isLiked = false ;

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow> [
          BoxShadow(color: Colors.black12, blurRadius: 15, spreadRadius: 10),
        ]
      ),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ProductDetailScreen.routeName, arguments: widget.product);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.amberAccent,
                          ),
                          Image.network(widget.product.images[0])
                        ],
                      )
                  ),
                  Text(
                      widget.product.name,
                     style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Best Sale',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  Text(
                    '${widget.product.price} \$',
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo),
                  ),
                ],
              ),
            ),
            Positioned(
                left: 0,
                top: 0,
                child: IconButton(
                  icon: Icon (
                    _isLiked ? Icons.favorite : Icons.favorite_border,
                    color:  Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      _isLiked = !_isLiked;
                    });
                  },
                )
            ),
          ],
        ),
      ),

    );
  }
}
