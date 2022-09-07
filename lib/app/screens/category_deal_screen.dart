import 'package:flutter/material.dart';
import 'package:my_souq/components/declarations.dart';

class CategoryDealScreen extends StatefulWidget {
  const CategoryDealScreen({Key? key, required this.category}) : super(key: key);

  static const String routeName = "/category-deal";
  final String category;

  @override
  State<CategoryDealScreen> createState() => _CategoryDealScreenState();
}

class _CategoryDealScreenState extends State<CategoryDealScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: Declarations.appBarGradient
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.category,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10,),
          SingleChildScrollView(
            child: GridView.builder(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.only(left: 10),
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.4,
                    mainAxisSpacing: 10
                ),
                itemBuilder: (context, index) {
                  return const Text('data');
                }
            ),
          )
        ],
      ),
    );
  }
}

