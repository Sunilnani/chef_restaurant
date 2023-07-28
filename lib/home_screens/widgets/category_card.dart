
import 'package:flutter/material.dart';



class CategoryCard extends StatelessWidget {
  const CategoryCard({this.width,this.height,
    this.image,
    this.child,
    this.isSelected
  });
  final double? width;
  final double? height;
  final String? image;
  final Widget? child;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 0),
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(6),
      //     color: isSelected == true? ThemeConfig.primaryColor.withOpacity(0.4): Colors.white,
      //    // border: Border.all(color: ThemeConfig.blackColor.withOpacity(0.2))
      // ),
      child:child,
    );
  }
}