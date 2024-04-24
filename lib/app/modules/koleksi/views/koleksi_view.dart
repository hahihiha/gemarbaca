import 'package:cached_network_image/cached_network_image.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import '../../../data/model/response_koleksi.dart';
import '../../../routes/app_pages.dart';
import '../controllers/koleksi_controller.dart';

class KoleksiView extends GetView<KoleksiController> {
  const KoleksiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>KoleksiController());
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: Text(
              "Koleksi Anda",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: controller.obx(
                    (state) => ListView.separated(
                  itemCount: state!.length,
                  itemBuilder: (context, index) {
                    DataKoleksi dataBuku = state[index];
                    return Container(
                      child: InkWell(
                          onTap: () => Get.toNamed(
                            Routes.DETAILBUKUKOLEKSI,
                            parameters: {
                              'koleksiId': (dataBuku.id ?? 0).toString(),
                              'id': (dataBuku.bookId ?? 0).toString(),
                              'judul': dataBuku.book?.judul ?? '-',
                              'image': dataBuku.book?.image ?? '-',
                              'penulis': dataBuku.book?.penulis ?? '-',
                              'penerbit': dataBuku.book?.penerbit ?? '-',
                              'tahun_terbit':
                              dataBuku.book?.tahunTerbit.toString() ??
                                  '-',
                              'deskripsi': dataBuku.book?.deskripsi ?? '-',
                            },
                          ),
                          child: ListTile(
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 16),
                            leading: Container(
                              child: CachedNetworkImage(
                                imageUrl: dataBuku.book?.image ?? "",
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                            title: Text(
                              dataBuku.book?.judul ?? "",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            subtitle: Text(
                              "Penulis: ${dataBuku.book?.penulis ?? ""}\nPenerbit: ${dataBuku.book?.penerbit ?? ""} - ${dataBuku.book?.tahunTerbit ?? ""}",
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
          ),
        ],
      ),
    );
  }
}

class PeminjamanBukuForm extends StatelessWidget {
  final KoleksiController controller;

  const PeminjamanBukuForm({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 10),
        Form(
          key: controller.formKey,
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFF0CBD63)),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(143, 148, 251, .2),
                      blurRadius: 20.0,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Color(0xFF0CBD63)),
                        ),
                      ),
                      child: DateTimeField(
                        controller: controller.tglpinjamController,
                        decoration: InputDecoration(hintText: "Masukkan Tanggal Peminjaman", border: InputBorder.none,),
                        validator: (value) {
                          if (value == null) {
                            return "Tanggal Tidak Boleh Kosong";
                          }
                          return null;
                        },
                        format: DateFormat("yyyy-MM-dd hh:mm"),
                        onChanged: (val) => print('onChanged: $val'),
                        onSaved: (val) => print('onSaved: $val'),
                        onShowPicker: (context, currentValue) async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: currentValue ?? DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );
                          if (date != null) {
                            final time = await showTimePicker(
                              context: context,
                              initialTime:
                              TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                            );
                            return DateTimeField.combine(date, time);
                          } else {
                            return currentValue;
                          }
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: DateTimeField(
                        controller: controller.tglkembaliController,
                        decoration: InputDecoration(hintText: "Masukkan Tanggal Pengembalian", border: InputBorder.none,),
                        validator: (value) {
                          if (value == null) {
                            return "Tanggal Tidak Boleh Kosong";
                          }
                          return null;
                        },
                        format: DateFormat("yyyy-MM-dd hh:mm"),
                        onChanged: (val) => print('onChanged: $val'),
                        onSaved: (val) => print('onSaved: $val'),
                        onShowPicker: (context, currentValue) async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: currentValue ?? DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );
                          if (date != null) {
                            final time = await showTimePicker(
                              context: context,
                              initialTime:
                              TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                            );
                            return DateTimeField.combine(date, time);
                          } else {
                            return currentValue;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}