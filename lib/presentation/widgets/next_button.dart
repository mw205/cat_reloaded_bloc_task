import 'package:bloc_task/constants/helpers.dart';
import 'package:bloc_task/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    required this.onTap,
    super.key,
  });
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Helpers.height * 0.067,
        width: Helpers.width * 0.85,
        decoration: BoxDecoration(
          color: MyColors.primColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Next",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 20.sp,
              )
            ],
          ),
        ),
      ),
    );
  }
}
