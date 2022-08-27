import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:my_souq/components/utils.dart';

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
     try {
       final cloud = CloudinaryPublic('dhzm49hvj', 'l9wbvtjj');
       List<String> imageUrls = [];
       for (int i =0; i < images.length; i ++) {
         CloudinaryResponse res = await cloud.uploadFile(
             CloudinaryFile.fromFile(images[i].path, folder: category)
         );
         imageUrls.add(res.secureUrl);
       }

     } catch(e) {
       showSnackBar(context, e.toString());
     }
  }
}