import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:good_goods/Controller/orderController.dart';
import 'package:good_goods/main.dart';
import 'package:good_goods/model/orderModel.dart';
import 'package:good_goods/pages/Map/good_goods_Map.dart';
import 'package:good_goods/resources/constant.dart';
import 'package:good_goods/resources/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class orderDetails extends StatelessWidget {
  // int id;
  Order orders;
  orderDetails({super.key, required this.orders});
  RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: bluecolor,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.keyboard_arrow_left)),
          // Image(
          //   image: AssetImage(
          //     "assets/delivery.png",
          //   ),
          // ),
          title: Text("Order Details"),
        ),
        body: SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            onRefresh: (() {
              // print("Refreshed");
              Get.find<OrderController>().get();
              _refreshController.refreshCompleted();
            }),
            child: GetBuilder<OrderController>(builder: ((_) {
              return _.isLoadings.value
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: 1,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Card(
                          shadowColor: bluecolor,
                          color: Colors.green[50],
                          borderOnForeground: true,
                          elevation: 40,
                          child: Padding(
                            padding: const EdgeInsets.all(
                              10,
                            ),
                            child: Container(
                              // color: Colors.grey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Text(
                                      //   orders.phone.toString(),
                                      //   style: AppTextStyles.blackHeader2Bold,
                                      // ),
                                      Icon(
                                        Icons.call,
                                        color: bluecolor,
                                      )
                                    ],
                                  ),
                                  Divider(
                                    thickness: 2,
                                    color: Colors.grey,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Order Number",
                                                style: AppTextStyles
                                                    .blackHeader2Bold,
                                              ),
                                              Text(
                                                orders.orderNumber,
                                                style:
                                                    AppTextStyles.blackHeader3,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          color: bluecolor,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              orders.condition,
                                              style: AppTextStyles
                                                  .whiteHeader2Bold,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Divider(
                                    color: Colors.grey.withOpacity(0.5),
                                    thickness: 2,
                                  ),
                                  Text(
                                    "Order Placed On",
                                    style: AppTextStyles.blackHeader2Bold,
                                  ),
                                  Text(orders.createdAt.toString()),
                                  Divider(
                                    color: Colors.grey.withOpacity(0.5),
                                    thickness: 2,
                                  ),
                                  Text(
                                    "Order Placed By",
                                    style: AppTextStyles.blackHeader2Bold,
                                  ),
                                  Text(
                                    _.order[index].userName.toString(),
                                    style: AppTextStyles.blackHeader3,
                                  ),
                                  Divider(
                                    thickness: 2,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            "Total Amount",
                                            style:
                                                AppTextStyles.blackHeader2Bold,
                                          ),
                                          Text(orders.totalAmount.toString()),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "Payment Mode",
                                            style:
                                                AppTextStyles.blackHeader2Bold,
                                          ),
                                          Text(orders.paymentMethod.toString())
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "Payment Status",
                                            style:
                                                AppTextStyles.blackHeader2Bold,
                                          ),
                                          Text("Paid") // CHANGE GARNA XA
                                        ],
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 2,
                                    color: Colors.grey,
                                  ),
                                  Text("Delivery Address",
                                      style: AppTextStyles.blackHeader2Bold),
                                  Text(orders.deliveryAddress.toString() ?? ""),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Divider(
                                    thickness: 2,
                                    color: Colors.grey,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Customer Shipping Address"),
                                      Container(
                                        color: bluecolor,
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: InkWell(
                                            onTap: () {
                                              Get.to(good_goodsMap());
                                            },
                                            child: Text(
                                              "View Location",
                                              style: AppTextStyles
                                                  .whiteHeader2Bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Text(orders.scountry.toString() ?? ""),
                                  // Text(orders.sstate.toString() ?? ""),
                                  // Text(orders.scity.toString() ?? ""),
                                  // Text(orders.saddress.toString() ?? ""),
                                  // Text(orders.spostcode.toString() ?? ""),
                                  Divider(
                                    thickness: 2,
                                    color: Colors.grey,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        child: Container(
                                          color: Colors.red,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: orders.condition ==
                                                    "out for delivery"
                                                ? InkWell(
                                                    onTap: (() {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                "Confirmation"),
                                                            content: Text(
                                                                "Is this Product Delivered?"),
                                                            actions: <Widget>[
                                                              ElevatedButton(
                                                                child:
                                                                    Text("Yes"),
                                                                onPressed: () {
                                                                  var data = {
                                                                    'id': orders
                                                                        .id
                                                                        .toString()
                                                                  };
                                                                  _.OrderComplete(
                                                                      data);

                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                  _.get();
                                                                  Get.back();
                                                                  _.get();
                                                                },
                                                              ),
                                                              ElevatedButton(
                                                                child:
                                                                    Text("No"),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }),
                                                    child: Text(
                                                      "Delivered",
                                                      style: AppTextStyles
                                                          .whiteHeader2Bold,
                                                    ),
                                                  )
                                                : InkWell(
                                                    onTap: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                "Confirmation"),
                                                            content: Text(
                                                                "Do you want to apply this delivery?"),
                                                            actions: <Widget>[
                                                              ElevatedButton(
                                                                child:
                                                                    Text("Yes"),
                                                                onPressed: () {
                                                                  var data = {
                                                                    'id': orders
                                                                        .id
                                                                        .toString()
                                                                  };
                                                                  _.ApplyOrder(
                                                                      data);

                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                  _.get();
                                                                  Get.back();
                                                                  _.get();
                                                                },
                                                              ),
                                                              ElevatedButton(
                                                                child:
                                                                    Text("No"),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: Text(
                                                      "Apply",
                                                      style: AppTextStyles
                                                          .whiteHeader2Bold,
                                                    ),
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
            }))));
  }
}
