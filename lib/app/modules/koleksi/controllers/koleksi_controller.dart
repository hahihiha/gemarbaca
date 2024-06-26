import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_koleksi.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';

class KoleksiController extends GetxController with StateMixin<List<DataKoleksi>> {
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
    getData();
  }

  @override
  void onClose() {
    super.onClose();
    tglpinjamController.dispose();
    tglkembaliController.dispose();
  }

  getData() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await ApiProvider.instance().get(Endpoint.koleksi + "/${StorageProvider.read(StorageKey.idUser)}");
      if (response.statusCode == 200) {
        final ResponseKoleksi responseBuku = ResponseKoleksi.fromJson(response.data);
        if (responseBuku.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(responseBuku.data, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal mengambil data"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null,
              status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void increment() => count.value++;
}
