import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/constants.dart';
import '../../widgets/toast/custom_toast.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool obsecureText = true.obs;
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  final GlobalKey<FormState> loginFormkey = GlobalKey<FormState>();
  final dio = Dio();
  final storage = const FlutterSecureStorage();

  bool validateAndSave() {
    final form = loginFormkey.currentState!;
    form.save();

    if (form.validate()) {
      return true;
    }
    return false;
  }

  validateAndSubmit() async {
    if (validateAndSave()) {
      isLoading.value = true;

      try {
        Map<String, dynamic> data = {
          "user_type": "is_delivery_boy",
          "email": 'lesterrusike@gmail.com',//,emailC.text.trim(),
          "password": 'ic64PebvSA'//passC.text
        };

        var headers = await getHeaders();

        var response = await dio.post('${Urls.baseUrl}login',
            data: data, options: headers);

        isLoading.value = false;

        if (response.statusCode == 200) {
          CustomToast.successToast("Success", "Login Success");
          String token = response.data['token'];

          await storage.write(key: 'token', value: token);
          Get.offAllNamed(Routes.TABS);
        } else if (response.statusCode == 401) {
          CustomToast.errorToast("Error", "Wrong Password");
        } else {
          CustomToast.errorToast("Error", "Something went wrong");
        }
      } catch (e) {
        CustomToast.errorToast("Error", e.toString());

        isLoading.value = false;
      }
    }
  }
}
