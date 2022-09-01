import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:la_vie/models/all_forums_model/all_forums.dart';
import 'package:la_vie/models/all_forums_model/all_forums_model.dart';
import 'package:la_vie/services/dio_client.dart';
import 'package:la_vie/utils/constants.dart';

class AllForumsProvider with ChangeNotifier {
  List<AllForums> _allForums = [];

  List<AllForums> get allForums => _allForums;

  Future<List<AllForums?>> getAllForums() async {
    _allForums.clear();
    try {
      var response = await DioClient.dio.get(
          "${DioClient.url}/api/v1/forums/{forumId}",
          options: Options(headers: ({'Authorization': 'Bearer $token'})));
      AllForumsModel res = AllForumsModel.fromJson(response.data);
      _allForums = res.data ?? [];
      notifyListeners();
    } on DioError catch (e) {
      throw (e.response?.data['message']);
      // if (e.response != null) {
      //   print('Dio error!');
      //   print('STATUS: ${e.response?.statusCode}');
      //   print('DATA: ${e.response?.data}');
      //   print('HEADERS: ${e.response?.headers}');
      // } else {
      //   print('Error sending request!');
      //   print(e.message);
      // }
    }
    return _allForums;
  }
}
