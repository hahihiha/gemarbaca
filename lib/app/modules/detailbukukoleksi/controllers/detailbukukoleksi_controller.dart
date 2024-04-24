import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_hapuskoleksi.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';

class DetailbukukoleksiController extends GetxController with StateMixin<HapusKoleksi?> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController tglpinjamController = TextEditingController();
  final TextEditingController tglkembaliController = TextEditingController();
  final loading = false.obs;
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    tglpinjamController.text = '';
    tglkembaliController.text = '';
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    tglpinjamController.dispose();
    tglkembaliController.dispose();
  }

  pinjam() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus(); //nge close keyboard
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.pinjam,
            data: {
              "tanggal_pinjam": tglpinjamController.text.toString(),
              "tanggal_kembali": tglkembaliController.text.toString(),
              "user_id": int.parse(StorageProvider.read(StorageKey.idUser)),
              "book_id": int.parse(Get.parameters['id'].toString()),
            });
        if (response.statusCode == 201) {
          Get.back();
          Get.snackbar("Berhasil", "Buku berhasil di pinjam", backgroundColor: Colors.green);
        } else {
          Get.snackbar("Sorry", "Login Gagal", backgroundColor: Colors.orange);
        }
      }
      loading(false);
    } on dio.DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Sorry", "${e.response?.data['message']}",
              backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    } catch (e) {
      loading(false);
      Get.snackbar("Sorry", e.toString(), backgroundColor: Colors.red);
    }
  }

  hapusKoleksi(int koleksiId) async {
    change(null, status: RxStatus.loading());
    try {
      final response = await ApiProvider.instance().delete('${Endpoint.koleksi}/$koleksiId');
      if (response.statusCode == 200) {
        final ResponseHapuskoleksi responseHapusKoleksi = ResponseHapuskoleksi.fromJson(response.data);
        if(responseHapusKoleksi.data == null){
          change(null, status: RxStatus.empty());
        } else {
          change(responseHapusKoleksi.data, status: RxStatus.success());
          Get.back();
          Get.snackbar("Berhasil", "Koleksi berhasil dihapus", backgroundColor: Colors.green);
        }
      } else {
        change(null, status: RxStatus.error("Gagal menghapus koleksi"));
        Get.snackbar("Gagal", "Koleksi gagal dihapus", backgroundColor: Colors.red);
      }
    } on DioException catch (e) {
      change(null, status: RxStatus.error(e.response?.data['message'] ?? e.message));
      Get.snackbar("Error", e.response?.data['message'] ?? "Terjadi kesalahan", backgroundColor: Colors.red);
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
      Get.snackbar("Error", "Terjadi kesalahan", backgroundColor: Colors.red);
    }
  }


  void increment() => count.value++;
}
