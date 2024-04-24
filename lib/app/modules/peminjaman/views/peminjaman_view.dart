import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/model/response_pinjam.dart';
import '../controllers/peminjaman_controller.dart';

class PeminjamanView extends GetView<PeminjamanController> {
  const PeminjamanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PeminjamanController());
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            "Data Peminjaman",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: controller.obx((state) => ListView.separated(
              itemCount: state!.length,
              itemBuilder: (context, index) {
                DataPinjam dataPinjam = state[index];
                return ListTile(
                  title: Text("${dataPinjam.book?.judul}"),
                  subtitle: Text(
                      "Jangka Waktu : ${dataPinjam.tanggalPinjam} - ${dataPinjam.tanggalKembali}"),
                );
              },
              separatorBuilder: (context, index) => Divider(),
            )),
          ),
        ],
      ),
    );
  }
}