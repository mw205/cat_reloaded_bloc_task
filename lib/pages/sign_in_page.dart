import 'package:bloc_task/bloc/auth_bloc.dart';
import 'package:bloc_task/pages/sign_up_page.dart';
import 'package:bloc_task/utils/constants.dart';
import 'package:bloc_task/widgets/register_image.dart';
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
      create: (context) => AuthBloc(),
      child: const LoginForm(),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailTextEditingController =
        TextEditingController();
    final TextEditingController passwordTextEditingController =
        TextEditingController();
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Column(
              children: [
                const RegisterPageImage(
                  type: RegisterPageImageType.signIn,
                ),
                Gap(h * 0.035),
                CustomTextFeild(
                  controller: emailTextEditingController,
                  hintText: "Enter your email",
                  suffixIconPath: "assets/images/email.svg",
                ),
                Gap(h * 0.03),
                CustomTextFeild(
                  controller: passwordTextEditingController,
                  hintText: "Enter your password",
                  suffixIconPath: "assets/images/password.svg",
                  isObsecured: true,
                ),
                Gap(h * 0.01),
                Padding(
                  padding: const EdgeInsets.only(right: 35.0, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          BlocBuilder<AuthBloc, AuthState>(
                            builder: (context, state) {
                              if (state is AuthInitial) {
                                return Checkbox(
                                  checkColor: Colors.white,
                                  splashRadius: 0,
                                  fillColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (states) {
                                    if (states
                                        .contains(MaterialState.selected)) {
                                      return primColor;
                                    }
                                    return Colors.white;
                                  }),
                                  side: const BorderSide(
                                      color: Color(0xffCBCBCB), width: 1.5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        4.0), // Set your custom border radius here
                                  ),
                                  value: state.rememberMe,
                                  onChanged: (value) {
                                    BlocProvider.of<AuthBloc>(context)
                                        .add(RememberMeToggleEvent());
                                  },
                                );
                              } else if (state is RememberMeChangedState) {
                                return Checkbox(
                                  checkColor: Colors.white,
                                  splashRadius: 0,
                                  fillColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (states) {
                                    if (states
                                        .contains(MaterialState.selected)) {
                                      return primColor;
                                    }
                                    return Colors.white;
                                  }),
                                  side: const BorderSide(
                                      color: Color(0xffCBCBCB), width: 1.5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        4.0), // Set your custom border radius here
                                  ),
                                  value: state.rememberMe,
                                  onChanged: (value) {
                                    BlocProvider.of<AuthBloc>(context)
                                        .add(RememberMeToggleEvent());
                                  },
                                );
                              } else {
                                return Container();
                              }
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
                              color: primColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp),
                        ),
                      )
                    ],
                  ),
                ),
                Gap(h * 0.19),
                NextButton(
                  onTap: () {
                    BlocProvider.of<AuthBloc>(context).add(
                      AuthSignInEvent(
                          email: emailTextEditingController.text,
                          password: passwordTextEditingController.text),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.off(() => const SignUpPage());
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
