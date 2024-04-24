import 'package:flutter/cupertino.dart';
import 'package:gemarbaca/app/modules/profil/views/profil_view.dart';
import 'package:get/get.dart';

import '../../book/views/book_view.dart';
import '../../koleksi/views/koleksi_view.dart';
import '../../peminjaman/views/peminjaman_view.dart';

class HomeController extends GetxController {
  final count = 0.obs;

  final RxInt currentIndex = 0.obs;
  final List<Widget> pages = [BookView(), KoleksiView(), PeminjamanView(), ProfilView()];

  void changePage(int index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
