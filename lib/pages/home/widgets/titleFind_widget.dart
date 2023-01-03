import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleFind extends StatelessWidget {
  const TitleFind({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Find Jobs',
      style: GoogleFonts.poppins(fontSize: 40, color: Colors.white),
    );
  }
}
