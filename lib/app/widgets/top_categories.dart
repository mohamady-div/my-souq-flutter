import 'package:flutter/material.dart';
import 'package:my_souq/app/screens/category_deal_screen.dart';
import 'package:my_souq/components/declarations.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({Key? key}) : super(key: key);

  void toCategoryPage(BuildContext context, String category) {
    Navigator.pushNamed(context, CategoryDealScreen.routeName, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: Declarations.catImages.length,
          itemExtent: 75,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                toCategoryPage(
                  context,
                  Declarations.catImages[index]['title']!
                );
              },
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image.asset(
                      Declarations.catImages[index]['image']!,
                      fit: BoxFit.cover,
                      height: 40,
                      width: 40,
                    ),
                  ),
                  const SizedBox(height:4,),
                  Text(Declarations.catImages[index]['title']!)
                ],
              ),
            );
          }
      ),
    );
  }
}
