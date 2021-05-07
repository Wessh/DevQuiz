import 'package:devquiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color bgColor;
  final Color fontColor;
  final Color borderColor;
  final Color clickedColor;
  final VoidCallback onTap;

  NextButtonWidget({
    required this.label,
    required this.bgColor,
    required this.fontColor,
    required this.borderColor,
    required this.clickedColor,
    required this.onTap,
  });

  NextButtonWidget.green({required String label, required onTap})
      : this.bgColor = AppColors.darkGreen,
        this.fontColor = AppColors.white,
        this.borderColor = AppColors.green,
        this.clickedColor = Colors.green.shade400,
        this.onTap = onTap,
        this.label = label;
  NextButtonWidget.purple({required String label, required onTap})
      : this.bgColor = AppColors.purple,
        this.fontColor = AppColors.white,
        this.borderColor = AppColors.green,
        this.clickedColor = Colors.green.shade400,
        this.onTap = onTap,
        this.label = label;
  NextButtonWidget.white({required String label, required onTap})
      : this.bgColor = AppColors.white,
        this.fontColor = AppColors.grey,
        this.borderColor = AppColors.border,
        this.clickedColor = AppColors.lightGrey,
        this.onTap = onTap,
        this.label = label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              this.bgColor,
            ),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            side:
                MaterialStateProperty.all(BorderSide(color: this.borderColor)),
            overlayColor: MaterialStateProperty.all<Color>(this.clickedColor)),
        onPressed: onTap,
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w600,
            color: this.fontColor,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
