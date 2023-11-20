
import '../core/class/crud.dart';
import '../core/contants/api.dart';

class CategoriesListForSaleData{
  Crud crud;
  CategoriesListForSaleData(this.crud);

  getData(id)async{
    var response = await crud.getData(CategoriesList(id));
    return response.fold((left) => left, (right) => right);
  }

}