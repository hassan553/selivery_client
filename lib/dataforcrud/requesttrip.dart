


import '../core/class/crud.dart';
import '../core/contants/api.dart';

class RequestTripData{
  Crud crud;
  RequestTripData(this.crud);
  postData(driverid,lan,log,lat2,long2)
  async{
    var response = await crud.postData(requestDriver,{
        "driverId":driverid.toString(),
        "pickupLatitude":lan,
        "pickupLongitude":log,
        "destinationLatitude":lat2,
        "destinationLongitude":long2,
        "price":225
    });
    return response.fold((left) {
    }, (right) => right);
  }

}