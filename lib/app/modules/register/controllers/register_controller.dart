import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart' as p;

import '../../../data/constant/endpoint.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController notelpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loading = false.obs;
  final count = 0.obs;

  var selectedImage = Rxn<File>();
  final ImagePicker _picker = ImagePicker();

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
    namaController.dispose();
    usernameController.dispose();
    notelpController.dispose();
    alamatController.dispose();
    passwordController.dispose();
  }

  // Fungsi untuk memilih gambar
  Future<void> pickImageFromGallery() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        selectedImage.value = File(pickedFile.path);  // Menyimpan file gambar yang dipilih
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<void> daftar() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();

      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();

        // Properly declaring a map to hold dynamic values
        var map = <String, dynamic>{
          "nama": namaController.text,
          "username": usernameController.text,
          "telp": notelpController.text,
          "alamat": alamatController.text,
          "password": passwordController.text,
        };

        if (selectedImage.value != null) {
          String filePath = selectedImage.value!.path;
          String fileName = p.basename(filePath);

          // Adding MultipartFile correctly
          map["image"] = await dio.MultipartFile.fromFile(filePath, filename: fileName);
        }

        // Constructing FormData with the dynamic map
        var formData = dio.FormData.fromMap(map);

        final response = await dio.Dio().post(
          Endpoint.register,
          data: formData,
        );

        if (response.statusCode == 201) {
          Get.back();
          Get.snackbar("Berhasil", "Petugas berhasil di daftarkan", backgroundColor: Colors.green);
        } else {
          Get.snackbar("Error", "Pendaftaran Akun Petugas Gagal with Status: ${response.statusCode}", backgroundColor: Colors.red);
        }
      }
    } on dio.DioException catch (e) {
      Get.snackbar("Error", "Dio Error: ${e.message}", backgroundColor: Colors.red);
    } catch (e, stacktrace) {
      print(stacktrace);
      Get.snackbar("Error", "Exception: ${e.toString()}", backgroundColor: Colors.red);
    } finally {
      loading(false);
    }
  }


  void increment() => count.value++;
}
