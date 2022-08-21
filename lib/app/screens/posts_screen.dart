import 'package:flutter/material.dart';
import 'package:my_souq/app/screens/add_products.dart';
import 'package:my_souq/components/declarations.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Posts Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddProduct.routeName);
        },
        tooltip: 'add product',
        child: const Icon(Icons.add),
      ),
    );
  }
}
