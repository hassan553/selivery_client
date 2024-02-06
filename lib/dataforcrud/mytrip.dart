import '../core/class/crud.dart';

import '../core/contants/api.dart';

class MyTripData{
  Crud crud;
  MyTripData(this.crud);
  getData(id)async{
    var response = await crud.getData(getMyTrip(id));
    return response.fold((left) => left, (right) => right);
  }

}