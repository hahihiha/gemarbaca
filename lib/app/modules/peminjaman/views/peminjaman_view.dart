import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
          const SizedBox(height: 20),
          const Text(
            "Data Peminjaman",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Container(
            width: 100,
            height: 2,
            color: Colors.black,
          ),
          SizedBox(height: 40),
          Expanded(
            child: controller.obx(
                  (state) => ListView.separated(
                itemCount: state?.length ?? 0,
                itemBuilder: (context, index) {
                  DataPinjam dataPinjam = state![index];
                  return Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                          leading: Container(
                            child: CachedNetworkImage(
                              imageUrl: dataPinjam.book?.image ?? "https://via.placeholder.com/150",
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const CircularProgressIndicator(),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                            ),
                          ),
                          title: Text(
                            dataPinjam.book?.judul ?? "Unknown title",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text(
                            "Jangka Waktu : ${dataPinjam.tanggalPinjam} - ${dataPinjam.tanggalKembali}"
                                "\n Status : ${dataPinjam.status}",
                          ),
                        ),
                      )
                    ],
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
              ),
              onLoading: const Center(child: CircularProgressIndicator()),
              onError: (error) => Center(child: Text(error ?? "An unknown error occurred")),
            ),
          ),
        ],
      ),
    );
  }
}
