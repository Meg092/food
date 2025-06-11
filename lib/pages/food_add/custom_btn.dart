import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn(
      {this.backgroundColor = const Color(0xffebebeb),
      this.textColor = const Color(0xff6a6a6a),
      this.title = 'Add',
      Key? key})
      : super(key: key);
  final Color backgroundColor;

  final Color textColor;

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(color: textColor, fontSize: 12),
      ),
    ).decorated(
      borderRadius: BorderRadius.circular(4),
      color: backgroundColor,
    );
  }
}
