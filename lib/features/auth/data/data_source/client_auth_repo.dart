import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../../../../core/contants/api.dart';
import '../../../../core/helper/notifictions_helper.dart';
import '../../../../core/services/cache_storage_services.dart';

class ClientAuthRepo {
  Future<Either<String, String>> clientLoginRepo(
      String email, String password) async {
    try {

      final response = await http.post(
        clientLogin,
        body: jsonEncode({'email': email, 'password': password,
          "deviceToken":await FirebaseMessagingService.getDeviceToken()}),
        body: jsonEncode(
            {'email': email, 'password': password, 'deviceToken': 'sdsdsd'}),
        headers: authHeaders,
      );
      final result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (result['message'] == 'LoggedIn successfully') {
          CacheStorageServices().setToken(result['token']);
          CacheStorageServices().setId(result['user']['_id']);
          print(CacheStorageServices().token);
        }
        return Right(result['message']);
      } else {
        return Left(result['message']);
      }
    } catch (e) {
      print("error ${e.toString()}");
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> clientRegisterRepo(
      String name, String email, String password) async {
    try {
      final response = await http.post(
        clientRegister,
        body: jsonEncode({'email': email, 'password': password,
          'name': name,
          "gender":"male",
          "age":22,
          "deviceToken":await FirebaseMessagingService.getDeviceToken()}),
        body: jsonEncode({
          'email': email,
          'password': password,
          'name': name,
          'deviceToken': 'sdsdsd'
        }),
        headers: authHeaders,
      );
      final result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return Right(result['message']);
      } else {
        return Left(result['message']);
      }
    } catch (e) {
      print("error ${e.toString()}");
      return Left(e.toString());
    }
  }
}
