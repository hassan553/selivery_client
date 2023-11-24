import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selivery_client/features/profile/presentation/widgets/update_profile.dart';
import '../../../../../core/widgets/custom_loading_widget.dart';
import '../../../../core/widgets/error_componant.dart';
import '../../controller/client_profile_controller.dart';
import '../../../../../core/functions/global_function.dart';
import '../../../../../core/widgets/custom_sized_box.dart';
import '../../../../../../core/widgets/custom_appBar.dart';
import '../../data/model/client_profile_model.dart';
import '../widgets/client_user_info.dart';
import '../widgets/top_title.dart';
import 'client_edit_profile.dart';

class ClientProfileView extends StatefulWidget {
  const ClientProfileView({super.key});

  @override
  State<ClientProfileView> createState() => _ClientProfileViewState();
}

class _ClientProfileViewState extends State<ClientProfileView> {
  final controller = Get.put(ClientProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: GetBuilder<ClientProfileController>(
        builder: (controller) {
          if (controller.isLoading) {
            return const CustomLoadingWidget();
          } else if (controller.errorMessage.isNotEmpty) {
            return ErrorComponant(
                function: () => controller.getClientProfile(),
                message: controller.errorMessage);
          }
          return clientProfileBody(controller.clientProfileModel);
        },
      ),
    );
  }

  Center clientProfileBody(ClientProfileModel? clientModel) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // TopTitleWidget(
            //   title1: 'عم',
            //   title2: 'يل',
            //   image:
            //       "http://192.168.1.122:8000/${clientModel?.image}", //clientModel?.image
            //   name: clientModel?.name,
            // ),
            const SizedBox(height: 10),
            ClientUserInfo(clientModel: clientModel),
            const CustomSizedBox(value: .03),
            UpdateProfile(
              function: () => navigateTo(const ClientEditProfileView()),
            ),
          ],
        ),
      ),
    );
  }
}
