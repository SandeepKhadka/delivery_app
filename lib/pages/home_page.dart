import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:good_goods/Controller/orderController.dart';
import 'package:good_goods/pages/new_orders.dart';
import 'package:good_goods/resources/constant.dart';
import 'package:good_goods/resources/theme.dart';

class homepage extends StatelessWidget {
  String name;
  homepage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bluecolor,
        leading: SizedBox(
          height: 20,
          width: 20,
          child: Image(
            image: AssetImage(
              "assets/delivery.png",
            ),
          ),
        ),
        title: Text("Delivery Boy"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Get.put(OrderController());
                  // Get.put(OrderController()).order;
                  // print(Get.put(OrderController().order));
                },
                child: Text(
                  "Welcome " + name.capitalizeFirst.toString(),
                  style: AppTextStyles.boxtext,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Congratulation, Your delivery account is Active",
                style: AppTextStyles.blackHeader2,
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: (() {
                      Get.to(newOrders());
                    }),
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/preorder.png',
                              height: 70,
                              width: 100,
                            ),
                          ),
                          Text(
                            "Pending Orders",
                            style: AppTextStyles.boxtext,
                          )
                        ],
                      ),
                      height: 170,
                      width: 180,
                      color: Colors.green[100],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/completed-task.png',
                            height: 70,
                            width: 100,
                          ),
                        ),
                        Text(
                          "Completed Order",
                          style: AppTextStyles.boxtext,
                        )
                      ],
                    ),
                    height: 170,
                    width: 180,
                    color: Colors.yellow[100],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/dollar.png',
                            height: 70,
                            width: 100,
                          ),
                        ),
                        Text(
                          "Collection",
                          style: AppTextStyles.boxtext,
                        )
                      ],
                    ),
                    height: 170,
                    width: 180,
                    color: Colors.pink[100],
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/distribution.png',
                            height: 70,
                            width: 100,
                          ),
                        ),
                        Text(
                          "Pick and Drop",
                          style: AppTextStyles.boxtext,
                        )
                      ],
                    ),
                    height: 170,
                    width: 180,
                    color: Colors.blue[100],
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                color: Colors.grey.withOpacity(0.5),
                thickness: 4,
              ),
              Text(
                "Delivery Boy Responsibility and Duties",
                style: AppTextStyles.blackHeader2Bold,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Drive Vehicles to designated destinations for customers product deliveries",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Drive safely and deliver products within deadlines",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Analyze delivery address, determine appropriate routes and mainain schedule",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
