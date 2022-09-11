import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/services/dio_client.dart';
import 'package:la_vie/utils/constants.dart';

import '../models/blogs_model/blogs_model.dart';

class Blog with ChangeNotifier {
  List<dynamic> _allBlogs = [];

  List<dynamic> get allBlogs => _allBlogs;

  Future<List<dynamic>> getAllBlogs() async {
    _allBlogs.clear();
    try {
      var response = await DioClient.dio.get("${DioClient.url}/api/v1/blogs",
          options: Options(headers: ({'Authorization': 'Bearer $token'})));

      BlogsModel res = BlogsModel.fromJson(response.data);
      _allBlogs = [
        ...?res.data!.plants,
        ...?res.data!.seeds,
        ...?res.data!.tools,
      ];
      notifyListeners();
    } on DioError catch (e) {
      throw (e.response?.data['message']);
    }
    return _allBlogs;
  }
}
