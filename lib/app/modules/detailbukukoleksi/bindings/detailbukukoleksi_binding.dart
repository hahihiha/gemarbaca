import 'package:get/get.dart';

import '../controllers/detailbukukoleksi_controller.dart';

class DetailbukukoleksiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailbukukoleksiController>(
      () => DetailbukukoleksiController(),
    );
  }
}
