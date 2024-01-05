
import 'dart:io';

import 'package:get/get.dart';

import '../core/class/crud.dart';
import '../core/contants/api.dart';

class AddCarForRentData{
  Crud crud;
  AddCarForRentData(this.crud);

  postData(name,phone,face,tel,price,requirments,
      carname,des,driver,category,File? image)
  async{
    var response = await crud.postDataWithFile(rentcar,
        {
          "name":name,
          "phone":phone,
          "facebook":face,
          "telegram":tel,
          "price":price,
          "rentRequirements":requirments,
          "carName":carname,
          "description":des,
          "withDriver":driver,
          "category":category,
        }, image);
    return response.fold((left) {
    }, (right) => right);
  }

}