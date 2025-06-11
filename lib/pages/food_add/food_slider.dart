import 'package:flutter/material.dart';
import 'package:food_date/main.dart';

class FoodSlider extends StatefulWidget {
  const FoodSlider(this.value, this.onChanged, {Key? key}) : super(key: key);
  final int value;
  final Function(int) onChanged;

  @override
  State<FoodSlider> createState() => _FoodSliderState();
}

class _FoodSliderState extends State<FoodSlider> {
  Color activeTrackColor = primaryColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33,
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          activeTrackColor: activeTrackColor,
          inactiveTrackColor: const Color(0xffe5e5e5),
          thumbColor: activeTrackColor,
          overlayColor: const Color(0xffe5e5e5),
          valueIndicatorColor: activeTrackColor,
          trackHeight: 8,
          showValueIndicator: ShowValueIndicator.always,
        ),
        child: Slider(
          value: widget.value.toDouble(),
          min: 0,
          max: 100,
          divisions: 100,
          onChanged: (v) {
            widget.onChanged(v.toInt());
          },
        ),
      ),
    );
  }
}
