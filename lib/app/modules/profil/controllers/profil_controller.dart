import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_profil.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';

class ProfilController extends GetxController with StateMixin<DataProfil?> {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void logout() async {
    await StorageProvider.remove(StorageKey.status);
    await StorageProvider.remove(StorageKey.idUser);
    Get.offAllNamed(Routes.LOGIN);
  }

  getData() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await ApiProvider.instance().get(Endpoint.profil + "/${StorageProvider.read(StorageKey.idUser)}");
      if (response.statusCode == 200) {
        final ResponseProfil responeProfil = ResponseProfil.fromJson(response.data);
        if(responeProfil.data == null){
          change(null, status: RxStatus.empty());
        } else {
          change(responeProfil.data, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal mengambil data"));
      }
    } on DioException catch (e) {
      if (e.response!= null) {
        if (e.response?.data!= null) {
          change(null, status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error(e.message?? ""));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void increment() => count.value++;
}