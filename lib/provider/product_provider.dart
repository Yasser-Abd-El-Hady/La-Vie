import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:la_vie/models/products_model/products.dart';

import '../models/products_model/products_model.dart';
import '../services/dio_client.dart';

class Product extends ChangeNotifier {
  List<Products> _allProducts = [];

  List<Products> get allProducts => _allProducts;
  Future<List<Products?>> getAllProducts() async {
    _allProducts.clear();
    try {
      var response = await DioClient.dio.get("${DioClient.url}/api/v1/products",
          options: Options(
              headers: ({
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJiMjhlNmRmMC02NDE2LTRkNWUtODI1Ny1kOTM5MTI3OGQxMGEiLCJpYXQiOjE2NjEyNDgwMDYsImV4cCI6MTY2MTQyMDgwNn0.mH0iju21SaFaFn8yT2bL-gQQvQDoGvjark2et6xGBI0'
          })));

      ProductsModel res = ProductsModel.fromJson(response.data);
      _allProducts = res.data!;
      print(res.data);
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
    return _allProducts;
  }
}