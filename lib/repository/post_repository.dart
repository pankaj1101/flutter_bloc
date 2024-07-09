import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:sample/model/post_model.dart';

class PostRepository {
  Future<List<PostModel>> fetchPost() async {
    try {
      http.Response response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        return jsonData.map((e) => PostModel.fromJson(e)).toList();
      }
      throw Exception('Error while fetching data');
    } on SocketException {
      throw Exception('Error while fetching data');
    } on TimeoutException {
      throw Exception('Error while fetching data');
    }
  }
}
