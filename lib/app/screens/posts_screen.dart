import 'package:flutter/material.dart';
import 'package:my_souq/app/models/product.dart';
import 'package:my_souq/app/screens/add_products.dart';
import 'package:my_souq/app/services/admin_service.dart';
import 'package:my_souq/app/widgets/loader.dart';
import 'package:my_souq/components/utils.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final AdminService adminService = AdminService();
  List<Product>? products;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllProducts();
  }

  getAllProducts() async {
    products = await adminService.getAllProducts(context);
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loader()
        : Scaffold(
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
