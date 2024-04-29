import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import '../controllers/detailbukukoleksi_controller.dart';

class DetailbukukoleksiView extends GetView<DetailbukukoleksiController> {

  @override
  Widget build(BuildContext context) {
    final imageUrl = Get.parameters['image'];
    final judul = Get.parameters['judul'];
    final penulis = Get.parameters['penulis'];
    final penerbit = Get.parameters['penerbit'];
    final tahunTerbit = Get.parameters['tahun_terbit'];
    final deskripsi = Get.parameters['deskripsi'];
    final koleksiId = int.parse(Get.parameters['koleksiId'] ?? '0');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Buku Koleksi',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF0CBD63),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(3, 3),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(23.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: CachedNetworkImage(
                        imageUrl: imageUrl ?? '',
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width * 0.8,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Judul: $judul',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Penulis: $penulis',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Penerbit: $penerbit',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Tahun Terbit: $tahunTerbit',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Pinjam Buku"),
                                        content: PeminjamanBukuForm(controller: controller),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Batal"),
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              foregroundColor: Colors.white,
                                              backgroundColor: Colors.green,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(30),
                                              ),
                                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                            ),
                                            onPressed: () {
                                              controller.pinjam();
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Pinjam"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Text("Pinjam"),
                              ),
                              IconButton(
                                onPressed: () {
                                  if (koleksiId != 0) {
                                    controller.hapusKoleksi(koleksiId);
                                  } else {
                                    Get.snackbar("Error", "Invalid koleksi ID", backgroundColor: Colors.red);
                                  }
                                },
                                icon: Icon(Icons.delete),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(3, 3),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deskripsi Buku:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '$deskripsi',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PeminjamanBukuForm extends StatelessWidget {
  final DetailbukukoleksiController controller;

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