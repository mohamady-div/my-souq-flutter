import 'dart:convert';

class Product {

  final String name;
  final String description;
  final double price;
  final double qty;
  final String category;
  final List<String> images;
  String? id;
  String? userId;

  Product({required this.name,required this.description,required this.price,required this.qty,required this.category,
    required this.images, this.id, this.userId});

  factory Product.getNewEmpty() {
    return Product(
      name:  '',
      description:  '',
      price:  0.00,
      qty:  0.00,
      category:  '',
      images: [],
      id: '',
      userId: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "description": description,
      "price": price,
      "qty": qty,
      "category": category,
      "images": images,
      "id": id,
      "userId": userId
    };
  }

  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? 0.00,
      qty: json['qty'] ?? 0.00,
      category: json['category'] ?? '',
      images: List<String>.from(json['images']),
      id: json['_id'] ?? '',
      userId: json['userId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));
}