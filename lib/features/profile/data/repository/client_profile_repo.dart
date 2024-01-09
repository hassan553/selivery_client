import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../../../../core/services/cache_storage_services.dart';
import '../../../../../core/contants/api.dart';
import '../../../../../core/contants/strings.dart';
import '../../../../../core/errors/failures.dart';
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
        print(result);
        clientProfileModel = ClientProfileModel.fromJson(result['user']);

        print(clientProfileModel);
        return Right(clientProfileModel);
      } else {
        print(result['message']);
        return Left(result['message']);
      }
    } catch (e) {
      print(e.toString());
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
      print('token${CacheStorageServices().token}');
      final response = await http.patch(
        profileUpdateInfoUri,
        body: jsonEncode(
            {'name': name, 'gender': gender, 'phone': phone, 'age': age}),
        headers: authHeadersWithToken(CacheStorageServices().token),
      );
      final result = jsonDecode(response.body);

      if (response.statusCode == 200) {
        clientProfileModel = ClientProfileModel.fromJson(result['user']);
        print(result['message']);
        print(clientProfileModel.age.toString());
        return Right(clientProfileModel);
      } else {
        return Left(result['message']);
      }
    } catch (e) {
      print(e.toString());
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
        print(res['message']);
        return Left(res['message']);
      }
    } catch (e) {
      print(e.toString());
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

  // Future postDataWithFile(File image) async {
  //   CancelToken cancelToken=CancelToken();
  //   try {
  //     var headers = {
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer ${CacheStorageServices().token}',
  //       'Content-Type': 'multipart/form-data',
  //     };

  //     var request = http.MultipartRequest('PATCH', profileUpdateImageUri);
  //     request.headers.addAll(headers);

  //     var fileExtension = image.path;
  //     var length = await image.length();
  //     var stream = http.ByteStream(image.openRead());
  //     var multipartFile =
  //         http.MultipartFile('image', stream, length, filename: image.path);
  //     request.files.add(multipartFile);

  //     var response = await _client.send(request);
  //     var responseString = await http.Response.fromStream(response);

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       print(responseString);
  //     } else {
  //       throw Exception('لقد حدث خطا');
  //     }
  //   } catch (error) {
  //     throw Exception(error.toString());
  //   }
  // }

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
      print(result['message']);
      // var completer = Completer<http.Response>();
      // _client.send(request).then((http.StreamedResponse streamedResponse) {
      //   return streamedResponse.stream.toBytes();
      // }).then((List<int> bytes) {
      //   final String responseString = String.fromCharCodes(bytes);
      //   final http.Response response = http.Response(responseString, 200);
      //   completer.complete(response);
      // });

      // // Wait for the response or cancellation
      // var response = await completer.future;
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("tm");
        print(response.body);
      } else {
        // throw Exception(result['message']);
        throw Exception("لقد حدث خطا");
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
