import 'package:bloc_task/business_logic/cubit/auth_cubit.dart';
import 'package:bloc_task/constants/helpers.dart';
import 'package:bloc_task/constants/my_colors.dart';
import 'package:bloc_task/presentation/pages/home_page.dart';
import 'package:bloc_task/presentation/pages/sign_up_page.dart';
import 'package:bloc_task/presentation/widgets/register_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custom_text_field.dart';
import '../widgets/next_button.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: LoginForm(),
    );
  }
}

class LoginForm extends StatelessWidget {
  LoginForm({super.key});
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Column(
              children: [
                const RegisterPageImage(type: RegisterPageImageType.signIn),
                Gap(Helpers.height * 0.035),
                CustomTextFeild(
                  controller: emailTextEditingController,
                  hintText: "Enter your email",
                  suffixIconPath: "assets/images/email.svg",
                ),
                Gap(Helpers.height * 0.03),
                CustomTextFeild(
                  controller: passwordTextEditingController,
                  hintText: "Enter your password",
                  suffixIconPath: "assets/images/password.svg",
                  isObsecured: true,
                ),
                Gap(Helpers.height * 0.01),
                Padding(
                  padding: const EdgeInsets.only(right: 35.0, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          BlocBuilder<AuthCubit, AuthState>(
                            builder: (context, state) {
                              return Checkbox(
                                checkColor: Colors.white,
                                splashRadius: 0,
                                fillColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (states) {
                                    if (states
                                        .contains(MaterialState.selected)) {
                                      return MyColors.primColor;
                                    }
                                    return Colors.white;
                                  },
                                ),
                                side: const BorderSide(
                                    color: Color(0xffCBCBCB), width: 1.5),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0)),
                                value: BlocProvider.of<AuthCubit>(context)
                                    .rememberMe,
                                onChanged: (value) {
                                  BlocProvider.of<AuthCubit>(context)
                                      .rememberMeToggle();
                                },
                              );
                            },
                          ),
                          Text(
                            "Remember me",
                            style: TextStyle(
                                color: const Color(0xff252525),
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp),
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Forget password ?",
                          style: TextStyle(
                              color: MyColors.primColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp),
                        ),
                      )
                    ],
                  ),
                ),
                Gap(Helpers.height * 0.19),
                NextButton(
                  onTap: () {
                    BlocProvider.of<AuthCubit>(context).signIn(
                        emailTextEditingController.text,
                        passwordTextEditingController.text);
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
                      Get.off(() => SignUpPage());
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "New Member?",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: " Register now",
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
