import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nasa_app/constants/urls.dart';
import 'package:nasa_app/models/asteroid.dart';

class AsteroidRepo{
    final client = Dio();

    getAsteroidData() async {
    const  url = Urls.baseUrl;

    try {
      final response = await client.get(url);

      if (response.statusCode == 200) {
        print(response.data);
         Map<String, dynamic>  map = response.data;
        print(map);
        var data = await map['near_earth_objects'];
         
        print(response);
        return data;
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        throw "error in response";
      }
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}