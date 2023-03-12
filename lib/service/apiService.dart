import 'dart:convert';
import 'package:assignment_3/Data/Model/data.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ApiServiceProvider {
  Future<List?> fetchItem() async {
    final response = await http.get(
      Uri.parse('https://fakestoreapi.com/products'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return Item.itemList(json.decode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }
}
