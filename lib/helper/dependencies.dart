import 'package:get/get.dart';
import 'package:rumah_kreatif_toba/controllers/cart_controller.dart';
import 'package:rumah_kreatif_toba/data/api/api_client.dart';
import 'package:rumah_kreatif_toba/data/repository/cart_repo.dart';
import 'package:rumah_kreatif_toba/data/repository/popular_produk_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/popular_produk_controller.dart';
import '../utils/app_constants.dart';

Future<void> init() async{
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //Get.lazyPut(() => ApiClient(appBaseUrl: "https://mvs.bslmeiyu.com"));
  //repos
  Get.lazyPut(() => PopularProdukRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));

  //controllers
  Get.lazyPut(() => PopularProdukController(popularProdukRepo:Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));

}