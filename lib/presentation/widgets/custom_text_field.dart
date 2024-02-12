import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    this.isPhoneNumber = false,
    this.isObsecured = false,
    this.isForSignIn = true,
    super.key,
    required this.hintText,
    required this.suffixIconPath, required this.controller,
  }) ;


  final String hintText;
  final String suffixIconPath;
  final bool isObsecured;
  final bool isPhoneNumber;
  final bool isForSignIn;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Container(
      height: h * 0.067,
      width: w * 0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xfff0f0f1),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 8.0, bottom: 8, right: 18, left: 22),
        child: TextFormField(
          controller: controller,
          obscureText: isObsecured,
          keyboardType:
              isPhoneNumber ? TextInputType.phone : TextInputType.text,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          cursorColor: const Color.fromARGB(128, 0, 0, 0),
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: Transform.scale(
                scale: 0.5, child: SvgPicture.asset(suffixIconPath)),
            hintText: hintText,
            hintStyle: GoogleFonts.montserrat(
              fontWeight: FontWeight.w300,
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
    );
  }
}
