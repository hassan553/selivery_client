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
      print("no image");
    }
    // FilePickerResult? result = await FilePicker.platform.pickFiles(
    //   allowMultiple: false,
    //   type: FileType.any,
    //  // allowedExtensions: ["jpg","png","JPG","PNG"],
    // );
    // //print(result!.files.single.path);
    // if(result == null){
    //   print("nnnnnnnnnnnnnn");
    // }else{
    //   print("nooooo");
    //   return File(result.files.single.path!);
  }

  uploadfile() async {
    file = await uploadimage();
    update();
  }
//final dio = Dio();

// Future<void> sendImageAndDataToApi() async {
//
//   FormData formData = FormData.fromMap({
//     "file":
//     await MultipartFile.fromFile(file.path, filename:fileName),
//   });
//
//   var filee = File(file!.path);
//   formData.files.add(MapEntry('image',
//       MultipartFile.fromFileSync(filee)));
//
//   formData.fields['name'] = 'John Doe';
//
//   var response = await dio.post('https://example.com/api/upload',
//       data: formData);
//
//   if (response.statusCode == 200) {
//     // Success!
//   } else {
//     // Error!
//   }
// }
  addCarData(name, phone, price, carname, des, category) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addCarForSaleData.postData(
        name, phone, price, carname, des, category, file);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      Get.defaultDialog(title: "Success",
          middleText: "تم اضافة السيارة بنجاح",onConfirm: (){
            // navigateOff(MainView());
            Get.back();
          });
      //navigateff(MainView());
      //Get.offAll(MaterialPageRoute(builder: (BuildContext context) => MainView()));
    } else {
      Get.defaultDialog(title: "تنبية",
          middleText: "تاكد من البيانات بشكل صحيح",onConfirm: (){
            // navigateOff(MainView());
            Get.back();
          });
      print("someerror");
      // print(response.statuscode);
      statusRequest = StatusRequest.failure;
    }
    update();
  }

// _uploadImage(String title, File file) async {
//   try {
//     var request = http.MultipartRequest('PATCH', profileUpdateImageUri);
//     request.fields["images"] = title;
//     request.files.add(http.MultipartFile.fromBytes(
//         'image', File(file!.path).readAsBytesSync(),
//         filename: file!.path));
//     request.headers['Authorization'] = 'Bearer $getClientToken';
//     request.headers['Content-Type'] = 'multipart/form-data';
//     var res = await request.send();
//     print('response ${res.toString()}');
//     print('image upload success');
//   } catch (error) {
//     print(error.toString());
//   }
// }
}
