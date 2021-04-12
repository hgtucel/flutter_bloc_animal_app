import 'package:animals_app/ui/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavItem extends StatelessWidget {
  final String title;
  final String svgUrl;
  final void Function() onTap;
  final bool isActive;
  BottomNavItem({this.title, this.svgUrl, this.onTap, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(svgUrl,
              color: isActive ? activeIconColor : textColor),
          Text(
            title,
            style: TextStyle(color: isActive ? activeIconColor : textColor),
          )
        ],
      ),
    );
  }
}
