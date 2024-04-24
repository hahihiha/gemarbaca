import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../data/model/response_buku.dart';
import '../../../routes/app_pages.dart';
import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>BookController());
    final myitems = [
      Container(
        margin: EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'assets/image/perpustakaan3.jpg',
            fit: BoxFit.cover,
            width: 1000.0,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'assets/image/perpustakaan1.jpg',
            fit: BoxFit.cover,
            width: 1000.0,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'assets/image/perpustakaan2.jpeg',
            fit: BoxFit.cover,
            width: 1000.0,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'assets/image/perpustakaan6.jpeg',
            fit: BoxFit.cover,
            width: 1000.0,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'assets/image/perpustakaan4.jpg',
            fit: BoxFit.cover,
            width: 1000.0,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'assets/image/perpustakaan5.jpg',
            fit: BoxFit.cover,
            width: 1000.0,
          ),
        ),
      ),
    ];

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 9),
                              hintText: 'Cari Judul Buku',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide:
                                BorderSide(color: Colors.green, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide:
                                BorderSide(color: Colors.green, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide:
                                BorderSide(color: Colors.green, width: 2),
                              ),
                              prefixIcon: Padding(
                                padding:
                                const EdgeInsets.only(right: 14, left: 14),
                                child: Container(
                                  width: 48,
                                  height: 48,
                                  child: Icon(Icons.search, color: Colors.grey),
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              controller.searchBuku(value);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      height: 150,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlayAnimationDuration:
                      const Duration(milliseconds: 800),
                      autoPlayInterval: const Duration(seconds: 2),
                      enlargeCenterPage: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        controller.updateCurrentIndex(index);
                      },
                    ),
                    items: myitems,
                  ),
                  Obx(() => AnimatedSmoothIndicator(
                    activeIndex: controller.currentIndex.value,
                    count: myitems.length,
                    effect: WormEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      spacing: 10,
                      dotColor: Colors.grey.shade200,
                      activeDotColor: Colors.grey.shade900,
                      paintStyle: PaintingStyle.fill,
                    ),
                  )),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              const Text('Daftar Buku',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 20)),
                              const SizedBox(height: 5),
                              Container(
                                width: 100,
                                height: 2,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: controller.obx(
                          (state) => ListView.separated(
                        itemCount: state!.length,
                        itemBuilder: (context, index) {
                          DataBuku dataBuku = state[index];
                          return Container(
                            child: InkWell(
                                onTap: () => Get.toNamed(
                                  Routes.DETAIL_BUKU,
                                  parameters: {
                                    'id': (dataBuku.id ?? 0).toString(),
                                    'judul': dataBuku.judul ?? '-',
                                    'image': dataBuku.image ?? '-',
                                    'penulis': dataBuku.penulis ?? '-',
                                    'penerbit': dataBuku.penerbit ?? '-',
                                    'tahun_terbit':
                                    dataBuku.tahunTerbit.toString() ??
                                        '-',
                                    'deskripsi': dataBuku.deskripsi ?? '-',
                                  },
                                ),
                                child: ListTile(
                                  contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16),
                                  leading: Container(
                                    child: CachedNetworkImage(
                                      imageUrl: dataBuku.image ?? "",
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ),
                                  title: Text(
                                    dataBuku.judul ?? "",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  subtitle: Text(
                                    "Penulis: ${dataBuku.penulis ?? ""}\nPenerbit: ${dataBuku.penerbit ?? ""} - ${dataBuku.tahunTerbit ?? ""}",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  trailing: Icon(Icons.arrow_forward),
                                )),
                          );
                        },
                        separatorBuilder: (context, index) => Divider(),
                      ),
                      onLoading: Center(child: CupertinoActivityIndicator()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
