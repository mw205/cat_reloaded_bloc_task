import 'package:bloc_task/pages/sign_in_page.dart';
import 'package:bloc_task/utils/constants.dart';
import 'package:bloc_task/widgets/register_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/next_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Column(
              children: [
                const RegisterPageImage(
                  type: RegisterPageImageType.signUp,
                ),
                // const CustomTextFeild(

                //   hintText: "Full name",
                //   suffixIconPath: "assets/images/name.svg",
                // ),
                // Gap(h * 0.025),
                // const CustomTextFeild(
                //   hintText: "Valid email",
                //   suffixIconPath: "assets/images/email.svg",
                // ),
                // Gap(h * 0.025),
                // const CustomTextFeild(
                //   hintText: "Phone number",
                //   suffixIconPath: "assets/images/mobile.svg",
                //   isPhoneNumber: true,
                // ),
                // Gap(h * 0.025),
                // const CustomTextFeild(
                //   hintText: "Enter your password",
                //   suffixIconPath: "assets/images/password.svg",
                //   isObsecured: true,
                // ),
                Gap(h * 0.01),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      // Checkbox(
                      //   checkColor: Colors.white,
                      //   splashRadius: 0,
                      //   fillColor:
                      //       MaterialStateProperty.resolveWith<Color>((states) {
                      //     if (states.contains(MaterialState.selected)) {
                      //       return primColor;
                      //     }
                      //     return Colors.white;
                      //   }),
                      //   side: const BorderSide(
                      //       color: Color(0xffCBCBCB), width: 1.5),
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(
                      //         4.0), // Set your custom border radius here
                      //   ),
                      //   value: rememberMe,
                      //   onChanged: (value) {
                      //     setState(() {
                      //       rememberMe = value!;
                      //     });
                      //   },
                      // ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "By checking the box you agree to our",
                              style: TextStyle(
                                  color: const Color(0xff252525),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10.sp),
                            ),
                            TextSpan(
                              text: " Terms",
                              style: TextStyle(
                                  color: primColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10.sp),
                            ),
                            TextSpan(
                              text: " and",
                              style: TextStyle(
                                  color: const Color(0xff252525),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10.sp),
                            ),
                            TextSpan(
                              text: " conditions",
                              style: TextStyle(
                                  color: primColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(h * 0.08),
                NextButton(
                  onTap: () {},
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.off(() => const LoginForm());
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Already a member?",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: " Log In",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp,
                              color: primColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
