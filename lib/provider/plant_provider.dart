import 'package:flutter/material.dart';
import 'package:la_vie/models/plants_model/plants_model.dart';
import 'package:dio/dio.dart';
import 'package:la_vie/services/dio_client.dart';
import '../models/plants_model/plants.dart';

class Plant with ChangeNotifier {
  List<Plants> _allPlants = [];

  List<Plants> get allPlants => _allPlants;

  Future<List<Plants?>> getAllPlants() async {
    _allPlants.clear();
    try {
      var response = await DioClient.dio.get("${DioClient.url}/api/v1/plants",
          options: Options(
              headers: ({
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJiMjhlNmRmMC02NDE2LTRkNWUtODI1Ny1kOTM5MTI3OGQxMGEiLCJpYXQiOjE2NjEyNDgwMDYsImV4cCI6MTY2MTQyMDgwNn0.mH0iju21SaFaFn8yT2bL-gQQvQDoGvjark2et6xGBI0'
          })));
      PlantsModel res = PlantsModel.fromJson(response.data);
      _allPlants = res.data!;
      notifyListeners();
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('Error sending request!');
        print(e.message);
      }
    }
    return _allPlants;
  }
}
