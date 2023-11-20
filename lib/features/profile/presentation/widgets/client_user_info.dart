import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/functions/global_function.dart';
import '../../../../../core/rescourcs/app_colors.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../controller/client_profile_controller.dart';
import '../../data/model/client_profile_model.dart';


class ClientUserInfo extends StatefulWidget {
  final ClientProfileModel? clientModel;
  const ClientUserInfo({super.key, this.clientModel});

  @override
  State<ClientUserInfo> createState() => _ClientUserInfoState();
}

class _ClientUserInfoState extends State<ClientUserInfo> {
  @override
  Widget build(BuildContext context) {
   
    return Container(
      width: screenSize(context).width,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(.7),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           
            GetBuilder<ClientProfileController>(builder:
                (controller)=>CustomText(
              title: 'النوع : ${controller.clientProfileModel?.gander??''}',
              fontSize: 16,
            ),),
            
            GetBuilder<ClientProfileController>(builder:
                (controller)=>CustomText(
              title: 'السن : ${controller.clientProfileModel?.age??''}',
              fontSize: 16,
            ),),
            GetBuilder<ClientProfileController>(builder:
                (controller)=>CustomText(
              title: 'رقم الموبايل : ${controller.
              clientProfileModel?.phone ?? ""} ',
              fontSize: 16,
            ),),
            
          ],
        ),
      ),
    );
  }
}
