import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:selivery_client/core/services/cache_storage_services.dart';

import '../../../core/contants/api.dart';
import '../../../core/functions/checkinternet.dart';

import '../model/ads_model.dart';

class AdsController extends GetxController {
  var isLoading = false.obs;
  var allAdsDataError = ''.obs;
  RxList<AdsModel> allAdsList = <AdsModel>[].obs;

  Future<void> getAllAdsData() async {
    if (await checkInternet()) {
      try {
        isLoading.value = true;
        allAdsList.value = <AdsModel>[].obs;
        final response = await http.get(
          getAllAdsUri,
          headers: authHeadersWithToken(CacheStorageServices().token),
        );
        final result = jsonDecode(response.body);

        if (response.statusCode == 200) {
          print('all ads   ${result['ads']}');
          var r = result['ads'] as List;
          r.map((e) {
            allAdsList.add(AdsModel.fromJson(e));
          }).toList();
          allAdsList.isEmpty
              ? allAdsDataError.value = 'لا يوجد بيانات'
              : allAdsDataError.value = '';
          isLoading.value = false;
        } else {
          isLoading.value = false;
          allAdsDataError.value = result['message'];
        }
      } catch (e) {
        print(e.toString());
        isLoading.value = false;
        allAdsDataError.value = e.toString();
      }
    } else {
      allAdsDataError.value = 'لا يوجد اتصال بالانترنت';
    }
    print(allAdsList);
  }

  RxString searchText = ''.obs;
  List get filteredList {
    if (searchText.value.isEmpty) {
      return [];
    } else {
      return allAdsList.where((item) {
        String? name = item.name ?? '';
      
        return name.toLowerCase().startsWith(searchText.value.toLowerCase());
      }).toList();
    }
  }
}
