
import 'package:flutter/material.dart';
import '../../../../controllers/addcarforsale.dart';
import '../../../../core/functions/global_function.dart';
import '../../../../core/rescourcs/app_colors.dart';
import '../../../../core/widgets/custom_appBar.dart';
 import 'package:get/get.dart';

import '../../../../core/widgets/custom_image.dart';
import '../../../../core/widgets/responsive_text.dart';
import '../../widgets/rental_buy_car_add_image.dart';
import '../../widgets/rental_buy_car_form_widget.dart';
import 'package:http/http.dart' as http;


class SaleCarFormView extends StatefulWidget {
  final String catId;

  const  SaleCarFormView({super.key, required this.catId});

  @override
  State<SaleCarFormView> createState() => _SaleCarFormViewState(catId);
}

class _SaleCarFormViewState extends State<SaleCarFormView> {
  TextEditingController nameController = TextEditingController();

  TextEditingController ageController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController faceLinkController = TextEditingController();

  TextEditingController telController = TextEditingController();

  TextEditingController typeController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  TextEditingController descController = TextEditingController();
  TextEditingController CarNameController = TextEditingController();
  final String catId;

  _SaleCarFormViewState(this.catId);

  // File? file;
  //
  // String? filename;
  //
  // Future uploadimage() async {
  //   // final myfile =await ImagePicker().
  //   // pickImage(source: ImageSource.gallery,imageQuality: 50);
  //   // if(myfile != null){
  //   //   return File(myfile.path);
  //   // }else{
  //   //   print("no image");
  //   // }
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //       allowMultiple: false
  //   );
  //   //print(result!.files.single.path);
  //   if (result == null) {
  //     print("nnnnnnnnnnnnnn");
  //   } else {
  //     print("nooooo");
  //     //Uint8List? file = result.files.first.bytes;
  //     filename = result.files.first.name;
  //     print(filename);
  //     print(file);
  //     return File(result.files.single.path!);
  //
  //     // }
  //   }
  // }
  //
  //   uploadfile() async {
  //     file = await uploadimage();
  //     setState(() {
  //
  //     });
  //   }
  //   Dio dio = new Dio();
  //
  //   addd(name, phone, face, tel, price, carname, desc) async {
  //     FormData formData = FormData.fromMap({
  //       "images":
  //       await MultipartFile.fromFile(file!.path,
  //           filename: filename),
  //       "name": name,
  //       "phone": phone,
  //       "facebook": face,
  //       "telegram": tel,
  //       "price": price,
  //       "carName": carname,
  //       "description": desc,
  //       "category": catId,
  //     });
  //     dio.options.headers['Authorization'] = 'Bearer $getDriverToken';
  //     dio.options.headers['Content-Type'] = 'multipart/form-data';
  //     //var filee = File(file!.path);
  //     formData.files.add(MapEntry('images',
  //         MultipartFile.fromFileSync(file!.path)));
  //
  //     var response = await dio.post(addCarForSale,
  //         data: formData);
  //
  //     if (response.statusCode == 200|| response.statusCode==201) {
  //       print("success");
  //       print(response.data);
  //       print(response.statusCode);
  //     } else {
  //       // Error!
  //       print(response.data);
  //       print(response.statusCode);
  //       print("errrrroororoor");
  //     }
  //   }

    // Future pickImage()async{
    //   final myfile = await ImagePicker().
    //   pickImage(source: ImageSource.gallery);
    //   if(myfile != null){
    //     setState(() {
    //       _file = File(myfile.path);
    //     });
    //   }else{
    //     print("no image");
    //   }
    //   // if(_file== null) {
    //   //   print("null");
    //   // }
    //   // String base64 = base64Encode(_file!.readAsBytesSync());
    //   setState(() {
    //     imagename=_file!.path.split("/").last;
    //   });
    //     print(imagename);
    //    // print(base64);
    // }

    // Future upload()async{
    //   if(_file==null) return ;
    //   String base64 = base64Encode(_file!.readAsBytesSync());
    //   String imagename=_file!.path.split("/").last;
    //
    // }

    // Future  sendData(name,phone,face,tel,price,type,
    //       des,cat,File image)async{
    //    try {
    //     // var headers = authHeadersWithTokenIm(getDriverToken!);
    //     //  var headers = {
    //     //    "Authorization":"Bearer $getDriverToken",
    //     //  };
    //      var headers = {
    //        'Authorization': 'Bearer $getDriverToken'
    //      };
    //      var request = http.MultipartRequest('POST',
    //          Uri.parse('http://192.168.1.10:8000/vehicles/sale'));
    //      request.fields.addAll({
    //        'name': name,
    //        'phone': phone,
    //        'facebook': face,
    //        'telegram': tel,
    //        'price': price,
    //        'carName': type,
    //        'description': des,
    //        'category': cat
    //      });
    //      request.files.add(await http.MultipartFile.
    //      fromPath('images', image.path));
    //      request.headers.addAll(headers);
    //      http.StreamedResponse response = await request.send();
    //      print("responde${response.statusCode}");
    //      print("responde${response}");
    //      if (response.statusCode == 200 || response.statusCode == 201) {
    //        print(await response.stream.bytesToString());
    //      }
    //      else {
    //        print("no");
    //        print(response);
    //        print(response.reasonPhrase);
    //      }
    //    }catch(e){
    //      print(e.toString());
    //    }
    //   }
    @override
    Widget build(BuildContext context) {
      AddCarForSaleController controller=   Get.put(AddCarForSaleController());
      print("id$catId");
      return Scaffold(
        appBar: customAppBar(context),
        body: Container(
            width: screenSize(context).width,
            height: screenSize(context).height,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  AppColors.white.withOpacity(.5),
                  AppColors.primaryColor,
                  AppColors.primaryColor,
                ],
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  BuyRentalCarFormWidget(title: 'الاسم',
                    controller: nameController,),
                  //SizedBox(height: 10),
                  //BuyRentalCarFormWidget(title: 'السن',controller: ageController,),
                  SizedBox(height: 10),
                  BuyRentalCarFormWidget(title: 'رقم الموبايل',
                    controller: phoneController,),
                  SizedBox(height: 10),
                  BuyRentalCarFormWidget(title: 'لينك الفيس بوك',
                    controller: faceLinkController,),
                  SizedBox(height: 10),
                  BuyRentalCarFormWidget(title: 'لينك التليجرام',
                    controller: telController,),
                  // SizedBox(height: 10),
                  // BuyRentalCarFormWidget(title: 'نوع السياره',
                  //   controller: typeController,),
                  SizedBox(height: 10),
                  BuyRentalCarFormWidget(title: 'سعر السياره',
                    controller: priceController,),
                  SizedBox(height: 10),
                  BuyRentalCarFormWidget(title: 'اسم السيارة',
                    controller: CarNameController,),
                  SizedBox(height: 10),
                  BuyRentalCarFormWidget(title: 'تفاصيل السياره',
                    controller: descController,),
                  SizedBox(height: 10),
                  //RentalBuyCarAddImageWidget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FittedBox(
                        child: ResponsiveText(
                          text: 'صور السياره',
                          scaleFactor: .05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () async {
                          await controller.uploadfile();
                        },
                        child: Container(
                          width: screenSize(context).width * .6,
                          height: screenSize(context).height * .12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child:
                          GetBuilder<AddCarForSaleController>
                            (builder: (controller)=>controller.file
                              == null ?
                          CustomAssetsImage(path:'assets/add_image.png')
                              : Image.file(controller.file!),),)
                      ),

                    ],
                  ),
                  SizedBox(height: 10),
                  // GetBuilder<AddCarForSaleController>(builder:
                  //     (controller)=>Container(
                  //   child: MaterialButton(
                  //     onPressed: () {
                  //    controller.
                  //    addCarData(nameController.text, phoneController.text,
                  //        faceLinkController.text, telController.text,
                  //        priceController.text,
                  //        CarNameController.text, descController.text,
                  //        catId, imagename!);
                  //   // print(imagename);
                  //     },
                  //     child: Text("Add"),
                  //   ),
                  // )),
                  MaterialButton(
                    onPressed: () {
                        controller.
                        addCarData(nameController.text, phoneController.text,
                            faceLinkController.text, telController.text,
                            priceController.text,
                            CarNameController.text,descController.text,
                            catId);
                      print("file${controller.file}");
                      print("id   ${catId}");
                      //   sendData(nameController.text,
                      //       phoneController.text,
                      //       faceLinkController.text,
                      //       telController.text,
                      //       priceController.text,
                      //       typeController.text,
                      //       descController.text, catId, _file!);
                      // addd(nameController.text,
                      //     phoneController.text,
                      //     faceLinkController.text,
                      //     telController.text,
                      //     priceController.text,
                      //     CarNameController.text,
                      //     descController.text);
                    },
                    child: Text("Add"),
                  ),
                ],
              ),
            )
        ),
      );
    }
  }


