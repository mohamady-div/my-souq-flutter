import 'dart:convert';
import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:my_souq/app/models/order.dart';
import 'package:my_souq/app/models/product.dart';
import 'package:my_souq/components/declarations.dart';
import 'package:my_souq/components/error_handling.dart';
import 'package:my_souq/components/utils.dart';
import 'package:http/http.dart' as http;
import 'package:my_souq/providers/user_provider.dart';
import 'package:provider/provider.dart';

class AdminService {
  void saveProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double qty,
    required String category,
    required List<File> images
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloud = CloudinaryPublic('dhzm49hvj', 'l9wbvtjj');
      List<String> imageUrls = [];
      for (int i = 0; i < images.length; i ++) {
        CloudinaryResponse res = await cloud.uploadFile(
            CloudinaryFile.fromFile(images[i].path, folder: category)
        );
        imageUrls.add(res.secureUrl);
      }
      Product product = Product(name: name,
          description: description,
          price: price,
          qty: qty,
          category: category,
          images: imageUrls);

      http.Response res = await http.post(
        Uri.parse(
            '$myUri01/admin/add-product'
        ),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'my-souq-auth-token': userProvider.user.token
        },
        body: product.toJson(),
      );
      
      httpErrorHandel(response: res, context: context, onSuccess: () {
        showSnackBar(context, 'your product has been added :)');
        Navigator.pop(context);
      });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<List<Product>> getAllProducts(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productsList = [];
    try {
      http.Response res = await http.get(
        Uri.parse('$myUri01/admin/get-products'),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'my-souq-auth-token': userProvider.user.token
        },
      );

     httpErrorHandel(response: res, context: context, onSuccess: () {
        for (int i =0; i < jsonDecode(res.body).length; i ++) {
            productsList.add(
               Product.fromJson(
                jsonEncode(jsonDecode(res.body)[i])
              )
            );
          }
      });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productsList;
  }

  void deleteProduct  ({required BuildContext context, required Product product,
    required VoidCallback onSuccess}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse('$myUri01/admin/delete-products'),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'my-souq-auth-token': userProvider.user.token
        },
        body: jsonEncode(
          {
            'id': product.id
          }
        )
      );
      httpErrorHandel(response: res, context: context, onSuccess: () {
        onSuccess();
      });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<List<Order>> getAllOrders({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Order> orderList = [];

    try {
      http.Response res = await http.get(
        Uri.parse('$myUri01/api/all-orders-admin'),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'my-souq-auth-token': userProvider.user.token
        },
      );
      httpErrorHandel(response: res, context: context, onSuccess: () {
        for (int i = 0; i < jsonDecode(res.body).length; i ++) {
          orderList.add(
              Order.fromJson(
                  jsonEncode(jsonDecode(res.body)[i])
              )
          );
        }
      });
    } catch (e) {
      debugPrint(e.toString());
      showSnackBar(context, e.toString());
    }
    return orderList;
  }

  void changeOrderStatus  ({required BuildContext context, required int status,
    required Order order, required VoidCallback onSuccess}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
          Uri.parse('$myUri01/admin/update-order-status'),
          headers: {
            'Content-Type': 'application/json; charset=utf-8',
            'my-souq-auth-token': userProvider.user.token
          },
          body: jsonEncode(
              {
                'id': order.id,
                'status': status
              }
          )
      );
      httpErrorHandel(response: res, context: context, onSuccess: () {
        onSuccess();
      });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}