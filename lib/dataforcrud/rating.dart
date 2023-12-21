import '../core/class/crud.dart';

import '../core/contants/api.dart';

class RatingData{
  Crud crud;
  RatingData(this.crud);
  postData(tripid,rate)async{
    var response = await crud.postData(rating(tripid),{
      "rating":rate
    });
    return response.fold((left) => left, (right) => right);
  }

}