import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:good_goods/pages/home_page.dart';
import 'package:good_goods/pages/new_orders.dart';

import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import 'dart:convert';
import 'package:good_goods/utils/api.dart';
import 'package:http/http.dart' as https;

class LoginController extends GetxController {
  SimpleFontelicoProgressDialog load = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);
  var emailTextController = TextEditingController();
  var passwordTextController = TextEditingController();

  var isLoading = false.obs;
  signIn(data) async {
    isLoading.value = true;
    var url = Uri.parse(SIGNIN_API);
    var response = await https.post(url, body: data);
    var result = jsonDecode(response.body);
    print(result);
    // print();
    // print("aaaaaa");
    String finals = "true";

    if (finals == result['status']) {
      Get.to(homepage(name: result['user']['name']));
      Get.snackbar("Success", result['message'],
          backgroundColor: Colors.green, colorText: Colors.white);
    } else {
      Get.snackbar("Error", result['message'],
          backgroundColor: Colors.red, colorText: Colors.white);
    }
    isLoading.value = false;
  }
}
