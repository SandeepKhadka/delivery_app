// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

List<Order> orderFromJson(String str) =>
    List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

String orderToJson(List<Order> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Order {
  Order({
    required this.id,
    required this.userId,
    required this.orderNumber,
    required this.subTotal,
    required this.totalAmount,
    required this.coupon,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.condition,
    required this.deliveryCharge,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.country,
    required this.address,
    required this.city,
    this.state,
    required this.postcode,
    this.note,
    required this.sfirstName,
    required this.slastName,
    required this.semail,
    required this.sphone,
    required this.scountry,
    required this.saddress,
    required this.scity,
    this.sstate,
    required this.spostcode,
    required this.createdAt,
    required this.updatedAt,
    required this.oid,
  });

  int id;
  int userId;
  String orderNumber;
  int subTotal;
  int totalAmount;
  int coupon;
  dynamic paymentMethod;
  dynamic paymentStatus;
  dynamic condition;
  int deliveryCharge;
  dynamic firstName;
  dynamic lastName;
  dynamic email;
  String phone;
  dynamic country;
  dynamic address;
  String city;
  String? state;
  int postcode;
  String? note;
  dynamic sfirstName;
  dynamic slastName;
  dynamic semail;
  String sphone;
  dynamic scountry;
  dynamic saddress;
  String scity;
  String? sstate;
  int spostcode;
  DateTime createdAt;
  DateTime updatedAt;
  String oid;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        userId: json["user_id"],
        orderNumber: json["order_number"],
        subTotal: json["sub_total"],
        totalAmount: json["total_amount"],
        coupon: json["coupon"],
        paymentMethod: json["payment_method"]!,
        paymentStatus: json["payment_status"]!,
        condition: json["condition"]!,
        deliveryCharge: json["delivery_charge"],
        firstName: json["first_name"]!,
        lastName: json["last_name"]!,
        email: json["email"]!,
        phone: json["phone"],
        country: json["country"]!,
        address: json["address"]!,
        city: json["city"],
        state: json["state"],
        postcode: json["postcode"],
        note: json["note"],
        sfirstName: json["sfirst_name"]!,
        slastName: json["slast_name"]!,
        semail: json["semail"]!,
        sphone: json["sphone"],
        scountry: json["scountry"]!,
        saddress: json["saddress"]!,
        scity: json["scity"],
        sstate: json["sstate"],
        spostcode: json["spostcode"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        oid: json["oid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "order_number": orderNumber,
        "sub_total": subTotal,
        "total_amount": totalAmount,
        "coupon": coupon,
        "payment_method": paymentMethod,
        "payment_status": paymentStatus,
        "condition": condition,
        "delivery_charge": deliveryCharge,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone,
        "country": country,
        "address": address,
        "city": city,
        "state": state,
        "postcode": postcode,
        "note": note,
        "sfirst_name": sfirstName,
        "slast_name": slastName,
        "semail": semail,
        "sphone": sphone,
        "scountry": scountry,
        "saddress": saddress,
        "scity": scity,
        "sstate": sstate,
        "spostcode": spostcode,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "oid": oid,
      };
}

// enum Address { POKHARA_LAKESIDE, MASBAR_7, LAKESIDE, STEET_NO_33 }

// final addressValues = EnumValues({
//     "Lakeside": Address.LAKESIDE,
//     "Masbar, 7": Address.MASBAR_7,
//     "Pokhara, Lakeside": Address.POKHARA_LAKESIDE,
//     "Steet no 33": Address.STEET_NO_33
// });

// enum Condition { PROCESSING, CANCELLED, DELIVERED, SHIPPED }

// final conditionValues = EnumValues({
//     "cancelled": Condition.CANCELLED,
//     "delivered": Condition.DELIVERED,
//     "processing": Condition.PROCESSING,
//     "shipped": Condition.SHIPPED
// });

// enum Country { NEPAL }

// final countryValues = EnumValues({
//     "Nepal": Country.NEPAL
// });

// enum Email { CUSTOMER_GOODGOODS_COM, SANDEEPKHADKA4935_G_GMAIL_COM, SANDEEP_KHADKA_S21_ICP_EDU_NP, SHISHIR_ACHARYA_S21_ICP_EDU_NP }

// final emailValues = EnumValues({
//     "customer@good_goods.com": Email.CUSTOMER_GOODGOODS_COM,
//     "sandeepkhadka4935g@gmail.com": Email.SANDEEPKHADKA4935_G_GMAIL_COM,
//     "sandeep.khadka.s21@icp.edu.np": Email.SANDEEP_KHADKA_S21_ICP_EDU_NP,
//     "shishir.acharya.s21@icp.edu.np": Email.SHISHIR_ACHARYA_S21_ICP_EDU_NP
// });

// enum FirstName { SANDEEP, DEEPSAN, JUST, SHISHIR }

// final firstNameValues = EnumValues({
//     "Deepsan": FirstName.DEEPSAN,
//     "Just": FirstName.JUST,
//     "Sandeep": FirstName.SANDEEP,
//     "Shishir": FirstName.SHISHIR
// });

// enum LastName { KHADKA, SANDEEP, CUSTOMER, ACHARYA }

// final lastNameValues = EnumValues({
//     "Acharya": LastName.ACHARYA,
//     "Customer": LastName.CUSTOMER,
//     "Khadka": LastName.KHADKA,
//     "Sandeep": LastName.SANDEEP
// });

// enum PaymentMethod { ESEWA, COD }

// final paymentMethodValues = EnumValues({
//     "cod": PaymentMethod.COD,
//     "esewa": PaymentMethod.ESEWA
// });

// enum PaymentStatus { UNPAID, PAID }

// final paymentStatusValues = EnumValues({
//     "paid": PaymentStatus.PAID,
//     "unpaid": PaymentStatus.UNPAID
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     late Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         reverseMap = map.map((k, v) => MapEntry(v, k));
//         return reverseMap;
//     }
// }



//





// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

// import 'dart:convert';

// List<Order> orderFromJson(String str) => List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

// String orderToJson(List<Order> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));




// class Order {
//     Order({
//         required this.id,
//         required this.userId,
//         required this.orderNumber,
//         required this.subTotal,
//         required this.totalAmount,
//         required this.coupon,
//         required this.paymentMethod,
//         required this.paymentStatus,
//         required this.condition,
//         required this.deliveryCharge,
//         required this.firstName,
//         required this.lastName,
//         required this.email,
//         required this.phone,
//         required this.country,
//         required this.address,
//         required this.city,
//         this.state,
//         required this.postcode,
//         this.note,
//         required this.sfirstName,
//         required this.slastName,
//         required this.semail,
//         required this.sphone,
//         required this.scountry,
//         required this.saddress,
//         required this.scity,
//         this.sstate,
//         required this.spostcode,
//         required this.createdAt,
//         required this.updatedAt,
//         required this.oid,
//     });

//     int id;
//     int userId;
//     String orderNumber;
//     int subTotal;
//     int totalAmount;
//     int coupon;
//     PaymentMethod paymentMethod;
//     PaymentStatus paymentStatus;
//     Condition condition;
//     int deliveryCharge;
//     FirstName firstName;
//     LastName lastName;
//     Email email;
//     String phone;
//     Country country;
//     Address address;
//     String city;
//     String? state;
//     int postcode;
//     String? note;
//     FirstName sfirstName;
//     LastName slastName;
//     Email semail;
//     String sphone;
//     Country scountry;
//     Address saddress;
//     String scity;
//     String? sstate;
//     int spostcode;
//     DateTime createdAt;
//     DateTime updatedAt;
//     String oid;

//     factory Order.fromJson(Map<String, dynamic> json) => Order(
//         id: json["id"],
//         userId: json["user_id"],
//         orderNumber: json["order_number"],
//         subTotal: json["sub_total"],
//         totalAmount: json["total_amount"],
//         coupon: json["coupon"],
//         paymentMethod: paymentMethodValues.map[json["payment_method"]]!,
//         paymentStatus: paymentStatusValues.map[json["payment_status"]]!,
//         condition: conditionValues.map[json["condition"]]!,
//         deliveryCharge: json["delivery_charge"],
//         firstName: firstNameValues.map[json["first_name"]]!,
//         lastName: lastNameValues.map[json["last_name"]]!,
//         email: emailValues.map[json["email"]]!,
//         phone: json["phone"],
//         country: countryValues.map[json["country"]]!,
//         address: addressValues.map[json["address"]]!,
//         city: json["city"],
//         state: json["state"],
//         postcode: json["postcode"],
//         note: json["note"],
//         sfirstName: firstNameValues.map[json["sfirst_name"]]!,
//         slastName: lastNameValues.map[json["slast_name"]]!,
//         semail: emailValues.map[json["semail"]]!,
//         sphone: json["sphone"],
//         scountry: countryValues.map[json["scountry"]]!,
//         saddress: addressValues.map[json["saddress"]]!,
//         scity: json["scity"],
//         sstate: json["sstate"],
//         spostcode: json["spostcode"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         oid: json["oid"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "user_id": userId,
//         "order_number": orderNumber,
//         "sub_total": subTotal,
//         "total_amount": totalAmount,
//         "coupon": coupon,
//         "payment_method": paymentMethodValues.reverse[paymentMethod],
//         "payment_status": paymentStatusValues.reverse[paymentStatus],
//         "condition": conditionValues.reverse[condition],
//         "delivery_charge": deliveryCharge,
//         "first_name": firstNameValues.reverse[firstName],
//         "last_name": lastNameValues.reverse[lastName],
//         "email": emailValues.reverse[email],
//         "phone": phone,
//         "country": countryValues.reverse[country],
//         "address": addressValues.reverse[address],
//         "city": city,
//         "state": state,
//         "postcode": postcode,
//         "note": note,
//         "sfirst_name": firstNameValues.reverse[sfirstName],
//         "slast_name": lastNameValues.reverse[slastName],
//         "semail": emailValues.reverse[semail],
//         "sphone": sphone,
//         "scountry": countryValues.reverse[scountry],
//         "saddress": addressValues.reverse[saddress],
//         "scity": scity,
//         "sstate": sstate,
//         "spostcode": spostcode,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "oid": oid,
//     };
// }

// enum Address { POKHARA_LAKESIDE, MASBAR_7, LAKESIDE, STEET_NO_33 }

// final addressValues = EnumValues({
//     "Lakeside": Address.LAKESIDE,
//     "Masbar, 7": Address.MASBAR_7,
//     "Pokhara, Lakeside": Address.POKHARA_LAKESIDE,
//     "Steet no 33": Address.STEET_NO_33
// });

// enum Condition { PROCESSING, CANCELLED, DELIVERED, SHIPPED }

// final conditionValues = EnumValues({
//     "cancelled": Condition.CANCELLED,
//     "delivered": Condition.DELIVERED,
//     "processing": Condition.PROCESSING,
//     "shipped": Condition.SHIPPED
// });

// enum Country { NEPAL }

// final countryValues = EnumValues({
//     "Nepal": Country.NEPAL
// });

// enum Email { CUSTOMER_GOODGOODS_COM, SANDEEPKHADKA4935_G_GMAIL_COM, SANDEEP_KHADKA_S21_ICP_EDU_NP, SHISHIR_ACHARYA_S21_ICP_EDU_NP }

// final emailValues = EnumValues({
//     "customer@good_goods.com": Email.CUSTOMER_GOODGOODS_COM,
//     "sandeepkhadka4935g@gmail.com": Email.SANDEEPKHADKA4935_G_GMAIL_COM,
//     "sandeep.khadka.s21@icp.edu.np": Email.SANDEEP_KHADKA_S21_ICP_EDU_NP,
//     "shishir.acharya.s21@icp.edu.np": Email.SHISHIR_ACHARYA_S21_ICP_EDU_NP
// });

// enum FirstName { SANDEEP, DEEPSAN, JUST, SHISHIR }

// final firstNameValues = EnumValues({
//     "Deepsan": FirstName.DEEPSAN,
//     "Just": FirstName.JUST,
//     "Sandeep": FirstName.SANDEEP,
//     "Shishir": FirstName.SHISHIR
// });

// enum LastName { KHADKA, SANDEEP, CUSTOMER, ACHARYA }

// final lastNameValues = EnumValues({
//     "Acharya": LastName.ACHARYA,
//     "Customer": LastName.CUSTOMER,
//     "Khadka": LastName.KHADKA,
//     "Sandeep": LastName.SANDEEP
// });

// enum PaymentMethod { ESEWA, COD }

// final paymentMethodValues = EnumValues({
//     "cod": PaymentMethod.COD,
//     "esewa": PaymentMethod.ESEWA
// });

// enum PaymentStatus { UNPAID, PAID }

// final paymentStatusValues = EnumValues({
//     "paid": PaymentStatus.PAID,
//     "unpaid": PaymentStatus.UNPAID
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     late Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         reverseMap = map.map((k, v) => MapEntry(v, k));
//         return reverseMap;
//     }
// }
