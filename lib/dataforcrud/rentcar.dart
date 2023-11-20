import '../core/class/crud.dart';

import '../core/contants/api.dart';

class CategoriesRentData{
  Crud crud;
  CategoriesRentData(this.crud);

  getData()async{
    var response = await crud.getData(rentcar);
    return response.fold((left) => left, (right) => right);
  }

}