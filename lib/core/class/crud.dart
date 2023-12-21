import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:selivery_client/core/services/cache_storage_services.dart';
import 'statusrequst.dart';

import '../contants/api.dart';
import '../functions/checkinternet.dart';
import 'package:http/http.dart' as http;

import '../functions/get_token.dart';
import 'package:path/path.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkurl),
            body: jsonEncode(data),
            headers: authHeadersWithToken(CacheStorageServices().token));
           print(response.body);
        if (response.statusCode == 200 || response.statusCode == 201) {
          print(response.statusCode);
          print(response.body);
          //Map reponseBody = jsonDecode(response.body);
          return Right(jsonDecode(response.body));
        } else {
          print(response.statusCode);
          print(response.body);
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      print("error is ${e.toString()}");
      return const Left(StatusRequest.serverFailure);
    }
  }

  Future<Either<StatusRequest, Map>> getData(linkurl) async {
    try {
      if (await checkInternet()) {
        var response = await http.get(Uri.parse(linkurl),
            headers: authHeadersWithToken(CacheStorageServices().token));
        print(response.statusCode);
        print(response.body);
        if (response.statusCode == 200 || response.statusCode == 201) {
          // Map reponseBody = jsonDecode(response.body);
          print("responsennnn ${response.body}");
          print("responsennnn ${response.statusCode}");
          return Right(jsonDecode(response.body));
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      print(e.toString());
      return const Left(StatusRequest.serverFailure);
    }
  }

  Future<Either<StatusRequest, Map>> updateData(linkurl, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.put(Uri.parse(linkurl),
            headers: authHeadersWithToken(CacheStorageServices().token),
            body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          // Map reponseBody = jsonDecode(response.body);
          print("responsennnn ${response.body}");
          return Right(jsonDecode(response.body));
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverFailure);
    }
  }

  postDataWithFile(String linkurl, Map data, File? image) async {
    var headers = {
      'Accept': 'application/json',
      "Authorization": 'Bearer ${CacheStorageServices().token}',
      "Content-Type": 'multipart/form-data',
    };
    Uri uri = Uri.parse(linkurl);
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(headers);
    var fileExtension = image!.path;

    var length = await image.length();
    var stream = http.ByteStream(image.openRead());
    //stream.cast();
    var multipartFile =
        http.MultipartFile("images", stream, length, filename: image.path);
    request.files.add(multipartFile);

    // add Data to request
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    // add Data to request
    // Send Request
    var myrequest = await request.send();
    // For get Response Body
    var response = await http.Response.fromStream(myrequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("tm");
      print(response.body);
      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } else {
      print("no hazem");
      print(response.body);
      print(response.statusCode);
      return const Left(StatusRequest.serverFailure);
    }
  }
}

Future<Either<StatusRequest, Map>> addRequestWithImageOne(
    url, data, File? image,
    [String? namerequest]) async {
  if (namerequest == null) {
    namerequest = "files";
  }
 var headers = {
      'Accept': 'application/json',
      "Authorization": 'Bearer ${CacheStorageServices().token}',
      "Content-Type": 'multipart/form-data',
    };
  var uri = Uri.parse(url);
  var request = http.MultipartRequest("POST", uri);
  request.headers.addAll(headers);

  if (image != null) {
    var length = await image.length();
    var stream = http.ByteStream(image.openRead());
    stream.cast();
    var multipartFile = http.MultipartFile(namerequest, stream, length,
        filename: basename(image.path));
    request.files.add(multipartFile);
  }

  // add Data to request
  data.forEach((key, value) {
    request.fields[key] = value;
  });
  // add Data to request
  // Send Request
  var myrequest = await request.send();
  // For get Response Body
  var response = await http.Response.fromStream(myrequest);
  if (response.statusCode == 200 || response.statusCode == 201) {
    print(response.body);
    Map responsebody = jsonDecode(response.body);
    return Right(responsebody);
  } else {
    return const Left(StatusRequest.serverFailure);
  }
}

_uploadImage(String title, File file) async {
  try {
    var request = http.MultipartRequest('PATCH', profileUpdateImageUri);
    request.fields["images"] = title;
    request.files.add(http.MultipartFile.fromBytes(
        'image', File(file!.path).readAsBytesSync(),
        filename: file!.path));
    request.headers['Authorization'] = 'Bearer ${CacheStorageServices().token}';
    request.headers['Content-Type'] = 'multipart/form-data';
    var res = await request.send();
    print('response ${res.toString()}');
    print('image upload success');
  } catch (error) {
    print(error.toString());
  }
}
