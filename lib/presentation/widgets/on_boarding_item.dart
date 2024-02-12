import 'package:bloc_task/constants/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({
    super.key,
    required this.imagePath,
    required this.primString,
    required this.secString,
  });
  final String imagePath;
  final String primString;
  final String secString;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Helpers.height * 0.4,
          width: Helpers.width * 0.9,
          child: SvgPicture.asset(imagePath),
        ),
        Gap(Helpers.height * 0.08),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            primString,
            style: GoogleFonts.montserrat(
              fontSize: 36,
              fontWeight: FontWeight.w700,
              color: const Color(0xff252525),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "To your $secString",
              style: GoogleFonts.montserrat(
                fontSize: 24,
                fontWeight: FontWeight.w300,
                color: const Color(0xff252525),
              ),
            ),
          ),
        )
      ],
    );
  }
}
