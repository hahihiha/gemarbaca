import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../data/model/response_buku.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final myitems = [
      Container(
        margin: EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'assets/image/gambar01.jpg',
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
            'assets/image/gambar01.jpg',
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
            'assets/image/gambar01.jpg',
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
            'assets/image/gambar01.jpg',
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
            'assets/image/gambar01.jpg',
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
            'assets/image/gambar01.jpg',
            fit: BoxFit.cover,
            width: 1000.0,
          ),
        ),
      ),
    ];

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 130,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/bg-green.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 14, left: 16, right: 16),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10, left: 14),
                          child: Icon(Icons.search, color: Colors.grey),
                        ),
                        Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 9),
                              hintText: 'search..',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),

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
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
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
          SizedBox(height: 30),
          Expanded(
            child: SizedBox(
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
                            'penulis': dataBuku.penulis ?? '-',
                            'penerbit': dataBuku.penerbit ?? '-',
                            'tahun_terbit': dataBuku.tahunTerbit.toString() ?? '-',
                            'deskripsi': dataBuku.deskripsi ?? '-',
                          },
                        ),
                        child: ListTile(
                          title: Text("${dataBuku.judul}"),
                          subtitle: Text(
                            "Penulis ${dataBuku.penulis}\n${dataBuku.penerbit} - ${dataBuku.tahunTerbit}",
                          ),
                          trailing: Icon(Icons.arrow_forward),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                ),
                onLoading: Center(child: CupertinoActivityIndicator()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
