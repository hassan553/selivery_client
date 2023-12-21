import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../../../core/contants/api.dart';

import '../../../../core/services/cache_storage_services.dart';

class VerifyEmailAddressRepo {
  Future<Either<String, String>> clientVerifyEmailCode(
      String email, String verificationCode) async {
    try {
      final response = await http.post(
        verifyClientEmailCodeUrl,
        body:
            jsonEncode({'email': email, 'verificationCode': verificationCode}),
        headers: authHeaders,
      );
      final result = jsonDecode(response.body);
<<<<<<< HEAD
      CacheStorageServices().setToken(result['token']);
      CacheStorageServices().setId(result['user']['_id']);
=======
>>>>>>> e75399400b10bf81a5d06800a8e1111972736177
      if (response.statusCode == 200) {
        CacheStorageServices().setToken(result['token']);
        return Right(result['message']);
      } else {
        return Left(result['message']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> clientResendEmailCode(String email) async {
    try {
      final response = await http.post(
        verifyClientResendEmailCodeUrl,
        body: jsonEncode({'email': email}),
        headers: authHeaders,
      );
      final result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return Right(result['message']);
      } else {
        return Left(result['message']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
