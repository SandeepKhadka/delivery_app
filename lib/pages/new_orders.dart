import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:good_goods/Controller/orderController.dart';
import 'package:good_goods/pages/order_details.dart';
import 'package:good_goods/resources/constant.dart';
import 'package:good_goods/resources/theme.dart';

class newOrders extends StatelessWidget {
  const newOrders({super.key});

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
          title: Text("New Orders"),
        ),
        body: GetBuilder<OrderController>(builder: ((_) {
          return _.isLoadings.value
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: _.order.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10, top: 20),
                      child: Card(
                        shadowColor: bluecolor,
                        color: Colors.green[50],
                        elevation: 10,
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
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              child: Text(
                                                "Order Number",
                                                style:
                                                    AppTextStyles.blackHeader2,
                                              ),
                                            ),
                                            Text(
                                                _.order[index].orderNumber
                                                    .toString(),
                                                style:
                                                    AppTextStyles.blackHeader3),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        color: _.order[index].condition ==
                                                "out for delivery"
                                            ? Colors.orange
                                            : bluecolor,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            _.order[index].condition.toString(),
                                            style:
                                                AppTextStyles.whiteHeader2Bold,
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
                                  style: AppTextStyles.blackHeader2,
                                ),
                                Text(
                                  _.order[index].createdAt.toString(),
                                  style: AppTextStyles.blackHeader3,
                                ),
                                Divider(
                                  color: Colors.grey.withOpacity(0.5),
                                  thickness: 2,
                                ),
                                Text(
                                  "Order Placed By",
                                  style: AppTextStyles.blackHeader2,
                                ),
                                Text(
                                  _.order[index].firstName.toString() +
                                      _.order[index].lastName.toString(),
                                  style: AppTextStyles.blackHeader3,
                                ),
                                Text(_.order[index].phone.toString()),
                                Divider(
                                  color: Colors.grey.withOpacity(0.5),
                                  thickness: 2,
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
                                          style: AppTextStyles.blackHeader2Bold,
                                        ),
                                        Text("Rs " +
                                            _.order[index].totalAmount
                                                .toString()),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Payment Mode",
                                          style: AppTextStyles.blackHeader2Bold,
                                        ),
                                        Text(_.order[index].paymentMethod
                                            .toString())
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Payment Status",
                                          style: AppTextStyles.blackHeader2Bold,
                                        ),
                                        Text(_.order[index].paymentStatus)
                                      ],
                                    )
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(orderDetails(
                                      orders: _.order[index],
                                    ));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 40,
                                      color: Colors.green,
                                      child: Center(
                                          child: Text(
                                        "View Order",
                                        style: AppTextStyles.whiteHeader2Bold,
                                      )),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
        })));
  }
}
