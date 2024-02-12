
import 'dart:io';


import '../core/class/crud.dart';
import '../core/contants/api.dart';

class AddCarForRentData{
  Crud crud;
  AddCarForRentData(this.crud);

  postData(name,phone,price,
      carname,des,driver,category,File? image)
  async{
    var response = await crud.postDataWithFile(rentcar,
        {
          "name":name,
          "phone":phone,
          "facebook":"f",
          "telegram":"t",
          "price":price,
          "rentRequirements":"re",
          "carName":carname,
          "description":des,
          "withDriver":driver,
          "category":category,
        }, image);
    return response.fold((left) {
    }, (right) => right);
  }

}