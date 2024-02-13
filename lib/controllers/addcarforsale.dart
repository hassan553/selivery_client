import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../core/class/statusrequst.dart';
import '../dataforcrud/addcarforsale.dart';

import '../core/functions/handlingdata.dart';

class AddCarForSaleController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  AddCarForSaleData addCarForSaleData = AddCarForSaleData(Get.find());

  File? file;

  Future uploadimage() async {
    final myfile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (myfile != null) {
      return File(myfile.path);
    } else {
    }
    
  }

  uploadfile() async {
    file = await uploadimage();
    update();
  }

  addCarData(name, phone, price, carname, des, category) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addCarForSaleData.postData(
        name, phone, price, carname, des, category, file);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      Get.defaultDialog(title: "Success",
          middleText: "تم اضافة السيارة بنجاح",onConfirm: (){
            Get.back();
          });
   
    } else {
      Get.defaultDialog(title: "تنبية",
          middleText: "تاكد من البيانات بشكل صحيح",onConfirm: (){
            Get.back();
          });
      
      statusRequest = StatusRequest.failure;
    }
    update();
  }

}
