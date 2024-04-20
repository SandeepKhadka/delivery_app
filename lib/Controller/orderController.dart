import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:good_goods/model/orderModel.dart';
import 'package:good_goods/utils/api.dart';
import 'package:http/http.dart' as http;

class OrderController extends GetxController {
  List<Order> order = [];
  var isLoading = false.obs;
  var isLoadings = false.obs;
  @override
  void onInit() {
    super.onInit();
    // print(order);
    get();
  }

  get() async {
    isLoadings.value = true;
    try {
      // isLoading.value = true;
      var response = await http.get(Uri.parse(GET_ORDERS));
      // Future.delayed(Duration(seconds: 10), () {
      if (response.statusCode == 200) {

        print("Hit Successfully");
        // isLoading.value = false;
        var products = jsonDecode(response.body)["data"];

        this.order = products.map<Order>((e) => Order.fromJson(e)).toList();
        print(order);
        update();
        isLoadings.value = false;
        update();
      } else {}
      ;
    } catch (e) {
      Get.snackbar("", "Errors");
    }
  }

  ApplyOrder(data) async {
    isLoading = true.obs;
    // var token = await authService.getToken();
    var url = Uri.parse(APPLY_ORDERS);
    var response = await http.post(url, body: data);
    var result = jsonDecode(response.body);
    print(result);
    isLoading = false.obs;
    update();
    Get.snackbar("Success", result['message'],
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: Duration(seconds: 2));
  }
  OrderComplete(data) async {
    isLoading = true.obs;
    
    var url = Uri.parse(ORDER_COMPLETE);
    var response = await http.post(url, body: data);
    var result = jsonDecode(response.body);
    print(result);
    isLoading = false.obs;
    update();
    Get.snackbar("Success", result['message'],
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: Duration(seconds: 2));
  }
}
