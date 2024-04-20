// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

List<Order> orderFromJson(String str) => List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

String orderToJson(List<Order> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Order {
    int id;
    int userId;
    String orderNumber;
    String deliveryAddress;
    int totalAmount;
    String paymentMethod;
    String paymentStatus;
    String condition;
    int deliveryCharge;
    DateTime createdAt;
    DateTime updatedAt;
    String userName;

    Order({
        required this.id,
        required this.userId,
        required this.orderNumber,
        required this.deliveryAddress,
        required this.totalAmount,
        required this.paymentMethod,
        required this.paymentStatus,
        required this.condition,
        required this.deliveryCharge,
        required this.createdAt,
        required this.updatedAt,
        required this.userName,
    });

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        userId: json["user_id"],
        orderNumber: json["order_number"],
        deliveryAddress: json["delivery_address"],
        totalAmount: json["total_amount"],
        paymentMethod: json["payment_method"],
        paymentStatus: json["payment_status"],
        condition: json["condition"],
        deliveryCharge: json["delivery_charge"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        userName: json["user_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "order_number": orderNumber,
        "delivery_address": deliveryAddress,
        "total_amount": totalAmount,
        "payment_method": paymentMethod,
        "payment_status": paymentStatus,
        "condition": condition,
        "delivery_charge": deliveryCharge,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user_name": userName,
    };
}