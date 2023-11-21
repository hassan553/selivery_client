import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selivery_client/core/widgets/custom_button.dart';

import '../../../../../core/widgets/custom_appBar.dart';
import '../../../../../core/rescourcs/app_colors.dart';

import '../../../../core/widgets/custom_image.dart';
import '../../../../core/widgets/custom_sized_box.dart';
import '../../controller/client_profile_controller.dart';
import '../../data/repository/client_profile_repo.dart';

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
          CustomButton(
            function: () {
              ClientProfileRepo().updateClientPassword('12345678', '12345678');
            },
            title: 'update',
            color: Colors.amber,
          ),
          Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(.7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Builder(builder: (context) {
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
                            ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: CustomNetworkImage(
                                  imagePath:
                                      "http://192.168.1.122:8000${controller.clientProfileModel?.image}",
                                  width: 120,
                                  boxFit: BoxFit.fill,
                                )),
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
                        // editTextFiled('رقم الموبايل', 'cubit.phone'),
                        // editTextFiled(
                        //   'السن',
                        //   ' cubit.age',
                        // ),
                        // editTextFiled('النوع', 'cubit.gander'),
                        const CustomSizedBox(value: .01),
                      ],
                    ),
                  ),
                );
              })),
          Row(
            children: [
              // Container(
              //   width: screenSize(context).width * .6,
              //   margin: const EdgeInsets.all(8),
              //   padding: const EdgeInsets.all(8),
              //   decoration: BoxDecoration(
              //     color: AppColors.primaryColor.withOpacity(.7),
              //     borderRadius: BorderRadius.circular(8),
              //   ),
              //   child: TextFormField(
              //     controller: ClientProfileCubit.get(context).password,
              //     onChanged: (value) {
              //       setState(() {
              //         ClientProfileCubit.get(context).password.text = value;
              //       });
              //     },
              //     onFieldSubmitted: (value) {
              //       FocusScope.of(context).unfocus();
              //     },
              //     textDirection: TextDirection.ltr,
              //     cursorColor: AppColors.black,
              //     decoration: InputDecoration(
              //       //prefixText: 'prefix',
              //       prefix: Text('hassan'),
              //       prefixIcon: Icon(
              //         Icons.edit,
              //         size: 20,
              //         color: AppColors.black.withOpacity(.7),
              //       ),
              //       focusedBorder: const UnderlineInputBorder(
              //           borderSide: BorderSide(color: AppColors.black)),
              //     ),
              //   ),
              // ),
            ],
          ),
          // BlocConsumer<ClientProfileCubit, ClientProfileState>(
          //   listener: (context, state) {
          //     if (state is ClientUpdateProfileError) {
          //       showSnackBarWidget(
          //           context: context,
          //           message: 'لقد حدث خطا ',
          //           requestStates: RequestStates.error);
          //     } else if (state is ClientUpdateProfileSuccess) {
          //       showSnackBarWidget(
          //           context: context,
          //           message: 'لقد تم التغير بنجاح',
          //           requestStates: RequestStates.success);
          //     }
          //   },
          //   builder: (context, state) {
          //     var cubit = ClientProfileCubit.get(context);
          //     return state is ClientUpdateProfileLoading
          //         ? const CustomLoadingWidget()
          //         : Padding(
          //             padding: const EdgeInsets.symmetric(horizontal: 50),
          //             child: MaterialButton(
          //               onPressed: () {
          //                 ClientProfileCubit.get(context)
          //                     .updateClientProfileInfo(
          //                         phone: cubit.phone.text,
          //                         name: cubit.name.text,
          //                         gender: cubit.gander.text,
          //                         age: int.parse(cubit.age.text));
          //               },
          //               height: 50,
          //               minWidth: 80,
          //               color: AppColors.primaryColor,
          //               child: const Text(
          //                 'تحديث',
          //                 style: TextStyle(
          //                     fontSize: 16, fontWeight: FontWeight.bold),
          //               ),
          //             ),
          //           );
          //   },
          // ),
        ],
      ),
    );
  }

  Widget editTextFiled(String prefix, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      onChanged: (value) {
        setState(() {
          controller.text = value;
        });
      },
      onTapOutside: (value) {
        FocusScope.of(context).unfocus();
      },
      textDirection: TextDirection.ltr,
      cursorColor: AppColors.black,
      decoration: InputDecoration(
        prefixText: prefix,
        prefixIcon: Icon(
          Icons.edit,
          size: 20,
          color: AppColors.black.withOpacity(.7),
        ),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.black)),
      ),
    );
  }
}
