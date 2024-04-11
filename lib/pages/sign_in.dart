import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:good_goods/Controller/auth/login_controller.dart';
import 'package:good_goods/Controller/orderController.dart';
import 'package:good_goods/pages/home_page.dart';
import 'package:good_goods/resources/constant.dart';
import 'package:good_goods/resources/customtextfield.dart';
import 'package:good_goods/resources/theme.dart';

class SignIn extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  SignIn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(OrderController());

    var a = Get.put(LoginController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Image.asset("assets/giphy.gif", height: 300, width: 300),
                  const Center(
                      child: Text('Good Goods Delivery App',
                          style: AppTextStyles.blackHeader1)),
                  CustomTextField(
                    controller:
                        // emailController
                        emailController,
                    validator: (value) {
                      if (!value!.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    controller:
                        //  passwordController
                        passwordController,
                    label: 'Password',
                    isPassword: true,
                    validator: (value) {
                      if (value!.length < 6) {
                        return 'Please enter a valid password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Obx(() => Container(
                        child: a.isLoading.value
                            ? const CircularProgressIndicator()
                            : InkWell(
                                borderRadius: BorderRadius.circular(30),
                                onTap: () {
                                  var isValid =
                                      formKey.currentState!.validate();

                                  if (isValid) {
                                    var data = {
                                      'email': emailController.text,
                                      'password': passwordController.text
                                    };

                                    print(data);
                                    a.signIn(data);
                                    // Get.to(MyHomePage());
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  width: 500,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: bluecolor),
                                  child: Center(
                                      child: Text("Sign In",
                                          style:
                                              AppTextStyles.whiteHeader2Bold)),
                                ),
                              ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
