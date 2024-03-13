import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/detail_buku_controller.dart';

class DetailBukuView extends GetView<DetailBukuController> {
  const DetailBukuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Buku'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${Get.parameters['judul']}',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Penulis: ${Get.parameters['penulis']}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Penerbit: ${Get.parameters['penerbit']}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Tahun Terbit: ${Get.parameters['tahun_terbit']}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Deskripsi:',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${Get.parameters['deskripsi']}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}
