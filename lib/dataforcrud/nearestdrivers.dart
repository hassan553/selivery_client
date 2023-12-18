
import 'dart:io';

import 'package:get/get.dart';

import '../core/class/crud.dart';
import '../core/contants/api.dart';

class NearestDriversData{
  Crud crud;
  NearestDriversData(this.crud);
  postData(lan,log)
  async{
    var response = await crud.getData(getdrivers(lan,log));
    return response.fold((left) {
    }, (right) => right);
  }

}