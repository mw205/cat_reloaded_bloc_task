import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Welcome To Home",
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontSize: 22.sp,
          ),
        ),
      ),
    );
  }
}
