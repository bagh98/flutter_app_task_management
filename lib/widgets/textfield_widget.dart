import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController textController;
  final double borderRadius;
  final int? maxLines;

  const TextFieldWidget(
      {super.key,
      required this.textController,
      required this.hintText,
      required this.borderRadius,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      controller: textController,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.textHolder,
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: Colors.white, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: Colors.white, width: 1),
        ),
      ),
    );
  }
}
