import 'package:bloc_task/business_logic/cubit/auth_cubit.dart';
import 'package:bloc_task/constants/helpers.dart';
import 'package:bloc_task/constants/my_colors.dart';
import 'package:bloc_task/presentation/pages/sign_in_page.dart';
import 'package:bloc_task/presentation/widgets/custom_text_field.dart';
import 'package:bloc_task/presentation/widgets/register_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/next_button.dart';
import 'home_page.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool termsAgrement = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: SignUpForm(),
    );
  }
}

class SignUpForm extends StatelessWidget {
  SignUpForm({
    super.key,
  });

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Column(
              children: [
                const RegisterPageImage(type: RegisterPageImageType.signUp),
                CustomTextFeild(
                  controller: nameController,
                  hintText: "Full name",
                  suffixIconPath: "assets/images/name.svg",
                ),
                Gap(Helpers.height * 0.025),
                CustomTextFeild(
                  controller: emailController,
                  hintText: "Valid email",
                  suffixIconPath: "assets/images/email.svg",
                ),
                Gap(Helpers.height * 0.025),
                CustomTextFeild(
                  controller: phoneController,
                  hintText: "Phone number",
                  suffixIconPath: "assets/images/mobile.svg",
                  isPhoneNumber: true,
                ),
                Gap(Helpers.height * 0.025),
                CustomTextFeild(
                  controller: passwordController,
                  hintText: "Enter your password",
                  suffixIconPath: "assets/images/password.svg",
                  isObsecured: true,
                ),
                Gap(Helpers.height * 0.01),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          return Checkbox(
                            checkColor: Colors.white,
                            splashRadius: 0,
                            fillColor: MaterialStateProperty.resolveWith<Color>(
                                (states) {
                              if (states.contains(MaterialState.selected)) {
                                return MyColors.primColor;
                              }
                              return Colors.white;
                            }),
                            side: const BorderSide(
                                color: Color(0xffCBCBCB), width: 1.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  4.0), // Set your custom border radius here
                            ),
                            value: BlocProvider.of<AuthCubit>(context)
                                .termsAgrement,
                            onChanged: (value) {
                              BlocProvider.of<AuthCubit>(context)
                                  .termsAgrementToggle();
                            },
                          );
                        },
                      ),
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
                                  color: MyColors.primColor,
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
                                  color: MyColors.primColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(Helpers.height * 0.08),
                NextButton(
                  onTap: () {
                    print("signUp");
                    BlocProvider.of<AuthCubit>(context).signUp(
                      email: emailController.text,
                      name: nameController.text,
                      phone: phoneController.text,
                      password: passwordController.text,
                    );
                  },
                ),
                BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is RegistrationSuccess) {
                      Get.off(() => const HomePage());
                    } else if (state is RegistrationLoading) {
                      showDialog(
                        context: context,
                        barrierDismissible:
                            false, // Prevent dismissing dialog on tap outside
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.transparent,
                            content: Center(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                width: MediaQuery.of(context).size.height * 0.1,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Transform.scale(
                                  scale: 0.5,
                                  child: const CircularProgressIndicator(),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else if (state is RegistrationFailure) {
                      Get.back();
                      Get.snackbar("Error", state.error);
                    }
                  },
                  child: Container(),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.off(() => LoginForm());
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
                              color: MyColors.primColor,
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
