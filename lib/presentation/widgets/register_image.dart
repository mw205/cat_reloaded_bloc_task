import 'package:bloc_task/constants/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

enum RegisterPageImageType { signIn, signUp }

class RegisterPageImage extends StatelessWidget {
  const RegisterPageImage({
    required this.type,
    super.key,
  });
  final RegisterPageImageType type;
  @override
  Widget build(BuildContext context) {
    switch (type) {
      case RegisterPageImageType.signIn:
        return SizedBox(
          height: Helpers.height * 0.31,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: Helpers.height * 0.15,
                  child: Column(
                    children: [
                      Text(
                        "Welcome back",
                        style: GoogleFonts.montserrat(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      Text(
                        "sign in to access your account",
                        style: GoogleFonts.montserrat(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                    width: Helpers.width * 0.88,
                    child: SvgPicture.asset("assets/images/register.svg")),
              ),
            ],
          ),
        );
      case RegisterPageImageType.signUp:
        return SizedBox(
          height: Helpers.height * 0.31,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: Helpers.height * 0.18,
                  child: Column(
                    children: [
                      Text(
                        "Get Started",
                        style: GoogleFonts.montserrat(
                            fontSize: 36.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      Text(
                        "by creating a free account.",
                        style: GoogleFonts.montserrat(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                    width: Helpers.width * 0.88,
                    child: SvgPicture.asset("assets/images/register.svg")),
              ),
            ],
          ),
        );

      default:
        return const Gap(0);
    }
  }
}
