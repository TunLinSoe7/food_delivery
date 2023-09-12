import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.onTap, required this.buttonWidth, required this.text});
  final GestureTapCallback onTap;
  final double buttonWidth;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
          return InkWell(
            onTap:onTap,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              width: buttonWidth,
              padding: const EdgeInsets.all(10),
              child: Text(
                text,
                style: GoogleFonts.abyssinicaSil(color: Colors.white, fontSize: 18),
              ),
            ),
          );
        }
    );
  }
}
