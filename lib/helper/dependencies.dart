import 'package:get/get.dart';
import 'package:rumah_kreatif_toba/data/api/api_client.dart';
import 'package:rumah_kreatif_toba/data/repository/popular_produk_repo.dart';

import '../controllers/popular_produk_controller.dart';
import '../utils/app_constants.dart';

Future<void> init() async{
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //Get.lazyPut(() => ApiClient(appBaseUrl: "https://mvs.bslmeiyu.com"));
  //repos
  Get.lazyPut(() => PopularProdukRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => PopularProdukController(popularProdukRepo:Get.find()));
}