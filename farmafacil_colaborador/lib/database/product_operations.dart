import 'dart:convert';

import 'package:farmafacil_colaborador/database/database_config.dart';
import 'package:farmafacil_colaborador/models/product.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ProductOperations {
  Future<List<Product>> getAll() async {
    final response = await http.get(
      Uri.parse('${DatabaseConfig.baseUrl}/products'),
    );

    return compute(parsePictures, response.body);
  }

  Future<List<Product>> getLastTwo() async {
    final response = await http.get(
      Uri.parse('${DatabaseConfig.baseUrl}/products/lasttwo'),
    );

    return compute(parsePictures, response.body);
  }

  List<Product> parsePictures(String responseBody) {
    final parsed =
        (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

    List<Product> result =
        parsed.map<Product>((json) => Product.fromJson(json)).toList();
    return result;
  }
}
