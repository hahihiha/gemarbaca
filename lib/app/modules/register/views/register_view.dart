import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: FadeInUp(
          duration: const Duration(milliseconds: 1800),
          child: Form(
            key: controller.formKey,  // Using the form key from the controller
            child: Column(
              children: [
                buildImagePicker(context, controller),
                const SizedBox(height: 20),
                buildDetailsForm(),
                const SizedBox(height: 30),
                buildSubmitButton(context),
                const SizedBox(height: 30),
                FadeInUp(
                  duration: const Duration(milliseconds: 2000),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Sudah punya akun? ',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: 'Login!',
                          style: const TextStyle(
                              color: Color(0xFF0CBD63)
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(Routes.LOGIN);
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildImagePicker(BuildContext context, RegisterController controller) {
    return Column(
      children: [
        Obx(() => controller.selectedImage.value != null
            ? Image.file(controller.selectedImage.value!, height: 200, fit: BoxFit.cover)
            : const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text("No image selected"),
        )),
        ElevatedButton(
          onPressed: controller.pickImageFromGallery,
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFF0CBD63),  // Background color
            onPrimary: Colors.white,  // Text color
          ),
          child: const Text('Pick Image from Gallery'),
        ),
      ],
    );
  }

  Widget buildDetailsForm() {
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            buildTextFormField(controller.namaController, "Nama"),
            buildTextFormField(controller.usernameController, "Username"),
            buildTextFormField(controller.notelpController, "No Telepon"),
            buildTextFormField(controller.alamatController, "Alamat"),
            buildTextFormField(controller.passwordController, "Password", isLast: true),
          ],
        ),
      ),
    );
  }

  Widget buildTextFormField(TextEditingController controller, String hintText, {bool isLast = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: isLast ? null : const Border(bottom: BorderSide(color: Color(0xFF0CBD63))),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget buildSubmitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        controller.daftar();
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF0CBD63),
              Color(0xFF37FF98),
            ],
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: 50,
          child: const Center(
            child: Text(
              "Daftar",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
