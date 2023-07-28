
import 'package:cheff_restaurant/utils/color_styles.dart';
import 'package:flutter/material.dart';





class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({Key? key, this.color}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(color ?? ThemeConfig.primaryColor),
      ),
    );
  }
}
