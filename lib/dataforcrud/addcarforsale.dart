
import 'dart:io';

import 'package:get/get.dart';

import '../core/class/crud.dart';
import '../core/contants/api.dart';

class AddCarForSaleData{
  Crud crud;
  AddCarForSaleData(this.crud);

  postData(name,phone,face,tel,price,carname,des,category,File? image)
  async{
    var response = await crud.postDataWithFile(addCarForSale,
       {
         "name":name,
         "phone":phone,
         "facebook":face,
         "telegram":tel,
         "price":price,
         "carName":carname,
         "description":des,
         "category":category,
       }, image);
    return response.fold((left) {
    }, (right) => right);
  }

}