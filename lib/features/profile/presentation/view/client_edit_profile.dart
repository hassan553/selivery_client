import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/widgets/custom_appBar.dart';
import '../../../../../core/rescourcs/app_colors.dart';

import '../../../../core/widgets/custom_loading_widget.dart';
import '../../../../core/widgets/custom_sized_box.dart';
import '../../controller/client_profile_controller.dart';
import '../../data/repository/client_profile_repo.dart';
import '../widgets/change_password_widget.dart';

class ClientEditProfileView extends StatefulWidget {
  const ClientEditProfileView({super.key});

  @override
  State<ClientEditProfileView> createState() => _ClientEditProfileViewState();
}

class _ClientEditProfileViewState extends State<ClientEditProfileView> {
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<ClientProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: ListView(
        children: [
          Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(.7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: GetBuilder<ClientProfileController>(builder: (controller) {
                controller.setControllers();
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            // ClipRRect(
                            //     borderRadius: BorderRadius.circular(60),
                            //     child: CustomNetworkImage(
                            //       imagePath:
                            //           "http://192.168.1.122:8000/${controller.clientProfileModel?.image}",
                            //       width: 120,
                            //       boxFit: BoxFit.fill,
                            //     )),
                            InkWell(
                              onTap: () {
                                ClientProfileRepo().pickClientImage();
                              },
                              child: Icon(
                                Icons.edit,
                                color: AppColors.black.withOpacity(.7),
                              ),
                            ),
                          ],
                        ),
                        const CustomSizedBox(value: .04),
                        editTextFiled('الاسم', controller.name),
                        const SizedBox(height: 15),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const MyDialog();
                              },
                            );
                          },
                          child: editTextFiled(
                              'كلمة المرور', controller.password, false),
                        ),
                        const SizedBox(height: 15),
                        editTextFiled('رقم الموبايل', controller.phone),
                        const SizedBox(height: 15),
                        editTextFiled('السن', controller.age),
                        const SizedBox(height: 15),
                        editTextFiled('النوع', controller.gander),
                        const CustomSizedBox(value: .01),
                      ],
                    ),
                  ),
                );
              })),
          const SizedBox(height: 20),
          GetBuilder<ClientProfileController>(
            builder: (controller) {
              return controller.updateProfileLoading
                  ? const CustomLoadingWidget()
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: MaterialButton(
                        onPressed: () {
                          controller.updateProfile(
                              context: context,
                              age: controller.age?.text??'',
                              gender: controller.gander?.text??'',
                              name: controller.name?.text??'',
                              phone: controller.phone?.text??'');
                          // ClientProfileCubit.get(co?ntext)
                          //     .updateClientProfileInfo(
                          //         phone: cubit.phone.text,
                          //         name: cubit.name.text,
                          //         gender: cubit.gander.text,
                          //         age: int.parse(cubit.age.text));
                        },
                        height: 50,
                        minWidth: 80,
                        color: AppColors.primaryColor,
                        child: const Text(
                          'تحديث',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }

  Widget editTextFiled(String prefix, TextEditingController? controller,
      [bool? isEnable]) {
    return TextFormField(
      controller: controller,
      onChanged: (value) {
        setState(() {
          controller?.text = value;
          print(controller?.text);
        });
      },
      onTapOutside: (value) {
        FocusScope.of(context).unfocus();
      },
      textDirection: TextDirection.ltr,
      cursorColor: AppColors.black,
      decoration: InputDecoration(
        enabled: isEnable ?? true,
        prefixText: prefix,
        prefixStyle: const TextStyle(color: AppColors.black),
        prefixIcon: Icon(
          Icons.edit,
          size: 20,
          color: AppColors.black.withOpacity(.7),
        ),
        disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.black)),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.black)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.black)),
      ),
    );
  }
}
