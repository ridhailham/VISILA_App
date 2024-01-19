import 'package:app_mobile/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          "animations/cam.png",
          height: 76,
          width: 76,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "VISILA cam",
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "Untuk terjemah bahasa \nisyaratmu",
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/bantuan");
          },
          child: Column(
            children: [
              const Icon(Icons.question_mark, color: secondaryColor, size: 40),
              Text(
                "Bantuan",
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
