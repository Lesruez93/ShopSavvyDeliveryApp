import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../style/app_color.dart';
import '../../../utils/utils.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 45 / 100,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 32),
            decoration: BoxDecoration(
              gradient: AppColor.primaryGradient,
              image: const DecorationImage(
                image: AssetImage('assets/images/pattern-1-1.png'),
                fit: BoxFit.cover,
              ),
            ),
            // child: const Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Text(
            //       "ShopSavvy Delivery App",
            //       style: TextStyle(
            //         fontSize: 28,
            //         color: Colors.white,
            //         fontFamily: 'poppins',
            //         height: 150 / 100,
            //         fontWeight: FontWeight.w600,
            //       ),
            //     ),
            //   ],
            // ),
          ),
          Form(
            key: controller.loginFormkey,
            child: Container(
                height: MediaQuery.of(context).size.height * 65 / 100,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                padding: const EdgeInsets.only(left: 20, right: 20, top: 36),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 24),
                      child: const Text(
                        'Log in',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'poppins',
                         // backgroundColor: AppColor.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding:
                          const EdgeInsets.only(left: 14, right: 14, top: 4),
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            width: 1, color: AppColor.secondaryExtraSoft),
                      ),
                      child: TextFormField(
                        style: const TextStyle(
                            fontSize: 14, fontFamily: 'poppins'),
                        maxLines: 1,
                        autofocus: false,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (val) => validateEmail(
                          val!,

                        ),
                        controller: controller.emailC,
                        decoration: InputDecoration(
                          label: Text(
                            "Email",
                            style: TextStyle(
                              color: AppColor.secondarySoft,
                              fontSize: 14,
                            ),
                          ),
                          border: InputBorder.none,
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500,
                            color: AppColor.secondarySoft,
                          ),
                        ),
                      ),
                    ),
                    Material(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding:
                            const EdgeInsets.only(left: 14, right: 14, top: 4),
                        margin: const EdgeInsets.only(bottom: 24),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              width: 1, color: AppColor.secondaryExtraSoft),
                        ),
                        child: Obx(
                          () => TextFormField(
                            style: const TextStyle(
                                fontSize: 14, fontFamily: 'poppins'),
                            maxLines: 1,
                            validator: (val) => validateField(
                              val!,
                              "Password is required",
                            ),
                            controller: controller.passC,
                            obscureText: controller.obsecureText.value,
                            autofocus: false,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              label: Text(
                                "Password",
                                style: TextStyle(
                                  color: AppColor.secondarySoft,
                                  fontSize: 14,
                                ),
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: InputBorder.none,
                              hintText: "*************",
                              suffixIcon: IconButton(
                                icon: (controller.obsecureText != false)
                                    ? Icon(
                                        CupertinoIcons.eye,
                                        size: 20,
                                      )
                                    : Icon(
                                        CupertinoIcons.eye_slash,
                                        size: 20,
                                      ),
                                onPressed: () {
                                  controller.obsecureText.value =
                                      !(controller.obsecureText.value);
                                },
                              ),
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.w500,
                                color: AppColor.secondarySoft,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton.icon(
                          icon: controller.isLoading.isTrue
                              ? Container(
                                  width: 24,
                                  height: 24,
                                  padding: const EdgeInsets.all(2.0),
                                  child: const CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 3,
                                  ),
                                )
                              : Container(),
                          onPressed: !controller.isLoading.isTrue
                              ? () => {controller.validateAndSubmit()}
                              : null,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            backgroundColor: AppColor.primary,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          label: Text(
                            (controller.isLoading.isFalse)
                                ? 'Log in'
                                : 'Loading...',
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(top: 4),
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () => {},
                        //  Get.toNamed(Routes.FORGOT_PASSWORD),

                        style: TextButton.styleFrom(
                          foregroundColor: AppColor.secondarySoft,
                        ),
                        child: const Text("Forgot your password?"),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
