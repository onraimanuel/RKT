import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rumah_kreatif_toba/controllers/alamat_controller.dart';
import 'package:rumah_kreatif_toba/controllers/auth_controller.dart';
import 'package:rumah_kreatif_toba/controllers/bank_controller.dart';
import 'package:rumah_kreatif_toba/controllers/cart_controller.dart';
import 'package:rumah_kreatif_toba/controllers/pembelian_controller.dart';
import 'package:rumah_kreatif_toba/controllers/pengiriman_controller.dart';
import 'package:rumah_kreatif_toba/controllers/pesanan_controller.dart';
import 'package:rumah_kreatif_toba/controllers/produk_controller.dart';
import 'package:rumah_kreatif_toba/controllers/toko_controller.dart';
import 'package:rumah_kreatif_toba/controllers/wishlist_controller.dart';
import 'package:rumah_kreatif_toba/data/api/api_client.dart';
import 'package:rumah_kreatif_toba/data/repository/auth_repo.dart';
import 'package:rumah_kreatif_toba/data/repository/cart_repo.dart';
import 'package:rumah_kreatif_toba/data/repository/categories_repo.dart';
import 'package:rumah_kreatif_toba/data/repository/produk_repo.dart';
import 'package:rumah_kreatif_toba/data/repository/toko_repo.dart';
import 'package:rumah_kreatif_toba/data/repository/user_repo.dart';
import 'package:rumah_kreatif_toba/data/repository/wishlist_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/categories_controller.dart';
import '../controllers/popular_produk_controller.dart';
import '../controllers/user_controller.dart';
import '../data/repository/bank_repo.dart';
import '../data/repository/pembelian_repo.dart';
import '../data/repository/pengiriman_repo.dart';
import '../data/repository/alamat_repo.dart';
import '../data/repository/pesanan_repo.dart';
import '../utils/app_constants.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);
  //api client
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => UserRepo(apiClient: Get.find()));

  //Get.lazyPut(() => ApiClient(appBaseUrl: "https://mvs.bslmeiyu.com"));
  //repos
  Get.lazyPut(() => PopularProdukRepo(apiClient: Get.find()));
  Get.lazyPut(
      () => CartRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() =>
      PengirimanRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(
      () => PesananRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(
          () => WishlistRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(
          () => TokoRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(
          () => BankRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(
          () => CategoriesRepo(apiClient: Get.find()));
  Get.lazyPut(
          () => PembelianRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(
          () => AlamatRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  //controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => PopularProdukController(popularProdukRepo: Get.find()),fenix: true);
  Get.lazyPut(() => CartController(cartRepo: Get.find()), fenix: true);
  Get.lazyPut(() => PengirimanController(pengirimanRepo: Get.find()) , fenix: true);
  Get.put(PengirimanController(pengirimanRepo: Get.find()));
  Get.lazyPut(() => PesananController(pesananRepo: Get.find()));
  Get.put(PesananController(pesananRepo: Get.find()));

  Get.lazyPut(() => AlamatController(alamatRepo: Get.find()), fenix: true);
  Get.put(AlamatController(alamatRepo: Get.find()));

  Get.lazyPut(() => WishlistController(wishlistRepo: Get.find()));
  Get.put(WishlistController(wishlistRepo: Get.find()));
  Get.lazyPut(() => TokoController(tokoRepo: Get.find()));
  Get.lazyPut(() => BankController(bankRepo: Get.find()));
  Get.lazyPut(() => CategoriesController(categoriesRepo: Get.find()));
  Get.put(() => CategoriesController(categoriesRepo: Get.find()));
  Get.lazyPut(() => ProdukController(produkRepo: Get.find()));
  Get.lazyPut(() => PembelianController(pembelianRepo: Get.find()));
  Get.put(() => PembelianController(pembelianRepo: Get.find()));
}