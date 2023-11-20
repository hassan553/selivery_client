

import '../core/contants/api.dart';

import '../core/class/crud.dart';

class CarWithDriverData{
  Crud crud;
  CarWithDriverData(this.crud);

  getData(id)async{
    var response = await crud.getData(carsWithDriver(id));
    return response.fold((left) => left, (right) => right);
  }
}