import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../../../core/services/cache_storage_services.dart';
import '../../../../../core/contants/api.dart';

import '../../../../../core/widgets/image_picker.dart';

import '../model/client_profile_model.dart';

class ClientProfileRepo {
  Future<Either<String, ClientProfileModel>> getClientProfile() async {
    try {
      ClientProfileModel clientProfileModel;
      final response = await http.get(
        Uri.parse(profileUri),
        headers: authHeadersWithToken(CacheStorageServices().token),
      );
      final result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        clientProfileModel = ClientProfileModel.fromJson(result['user']);

        return Right(clientProfileModel);
      } else {
        return Left(result['message']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, ClientProfileModel>> updateClientProfileInfo({
    String? name,
    String? gender,
    String? phone,
    int? age,
  }) async {
    try {
      ClientProfileModel clientProfileModel;
      final response = await http.patch(
        profileUpdateInfoUri,
        body: jsonEncode(
            {'name': name, 'gender': gender, 'phone': phone, 'age': age}),
        headers: authHeadersWithToken(CacheStorageServices().token),
      );
      final result = jsonDecode(response.body);

      if (response.statusCode == 200) {
        clientProfileModel = ClientProfileModel.fromJson(result['user']);
        
        return Right(clientProfileModel);
      } else {
        return Left(result['message']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> updateClientPassword(
      {required String newPassword, required String oldPassword}) async {
    try {
      final response = await http.patch(
        profileClientUpdatePassword,
        body: jsonEncode(
            {'newPassword': newPassword, 'oldPassword': oldPassword}),
        headers: authHeadersWithToken(CacheStorageServices().token),
      );
      final res = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return const Right('لقد تم تغير كلمة السر بنجاح');
      } else {
        return Left(res['message']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  File? carImage;

  Future pickClientImage() async {
    carImage = await PickImage().pickImage();
    if (carImage != null) {
      await postDataWithFile(carImage!);
    }
  }

  http.Client _client = http.Client();
  cancelClient() {
    _client.close();
  }


  Future postDataWithFile(File image) async {
    try {
      var headers = {
        'Accept': 'application/json',
        "Authorization": 'Bearer ${CacheStorageServices().token}',
        "Content-Type": 'multipart/form-data',
      };

      var request = http.MultipartRequest("PATCH", profileUpdateImageUri);
      request.headers.addAll(headers);
      var fileExtension = image.path;

      var length = await image.length();
      var stream = http.ByteStream(image.openRead());

      var multipartFile =
          http.MultipartFile("image", stream, length, filename: image.path);
      request.files.add(multipartFile);

      var myrequest = await request.send();
      var response = await http.Response.fromStream(myrequest);
      final result = jsonDecode(response.body);
     
      if (response.statusCode == 200 || response.statusCode == 201) {
     
      } else {
        throw Exception("لقد حدث خطا");
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
