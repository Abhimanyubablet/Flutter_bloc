import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean_articture/config/colors/colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final double height;
  const RoundButton({super.key, required this.title, required this.onPress,  this.height=40});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: AppColor.buttonColor,borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
