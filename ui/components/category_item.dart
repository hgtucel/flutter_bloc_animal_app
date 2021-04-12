import 'package:animals_app/ui/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String svgUrl;
  final void Function() onPress;
  CategoryItem({this.title, this.svgUrl, this.onPress});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: shadowColor,
                blurRadius: 17,
                spreadRadius: -10,
                offset: Offset(0, 17))
          ]),
      child: InkWell(
        onTap: onPress,
        child: Column(
          children: [
            Spacer(),
            SvgPicture.network(svgUrl, height: 100),
            Spacer(),
            Text(title)
          ],
        ),
      ),
    );
  }
}
