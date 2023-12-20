import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Urls {
  static const String baseUrl = "https://dev.shopsavvy.co.zw/api/v2/";

}




getHeadersAuth() async {

   String key = await getKey();

  Map<String, dynamic> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $key'
  };
  Options options = Options(headers: headers);



  return options;
}

getKey() async {

  const storage = FlutterSecureStorage();

  return await storage.read(key: 'token');

}


Future<bool> isAuthenticated() async {
  const storage = FlutterSecureStorage();
  String? token = await storage.read(key: 'token');

  // Check if the token exists and is not null
  return token != null;
}

getHeaders() async {


  Map<String, dynamic> headers = {
    'Content-Type': 'application/json',
  };
  Options options = Options(headers: headers);



  return options;
}