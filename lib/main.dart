import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:good_goods/Controller/orderController.dart';
import 'package:good_goods/pages/home_page.dart';
import 'package:good_goods/pages/new_orders.dart';
import 'package:good_goods/pages/sign_in.dart';

import 'pages/order_details.dart';

void main() {
  // Get.put(OrderController());
  runApp(
    GetMaterialApp(
      home: SignIn(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
