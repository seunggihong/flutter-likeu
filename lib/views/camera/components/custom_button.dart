import 'package:flutter/material.dart';
import 'package:flutter_likeu/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.function,
    required this.buttonName,
  });

  final void Function() function;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        minimumSize: const Size(150, 50),
        maximumSize: const Size(150, 50),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
        ),
      ),
      child: Text(
        buttonName,
        style: const TextStyle(color: Colors.black, fontSize: 20),
      ),
    );
  }
}
