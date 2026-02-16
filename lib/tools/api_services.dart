import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:route_practice/tools/product_model.dart';

Future<List<ProductModel>> getProducts() async {
  final url = Uri.parse('https://www.jsonkeeper.com/b/QXODW');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    List data = json.decode(response.body);
    return data.map((item) => ProductModel.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}