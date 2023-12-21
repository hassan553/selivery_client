import '../core/class/crud.dart';

import '../core/contants/api.dart';

class StartTripData{
  Crud crud;
  StartTripData(this.crud);
  getData(tripid)async{
    var response = await crud.getData(starttrip(tripid));
    return response.fold((left) => left, (right) => right);
  }

}