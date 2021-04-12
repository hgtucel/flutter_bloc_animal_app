import 'package:animals_app/ui/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * .35,
            decoration: BoxDecoration(color: blueLightColor),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  width: size.width,
                  height: size.height * .35,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Text("RESİM"), Text("Başlık")],
                  ),
                ),
                Container(
                  height: 90,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 17),
                            blurRadius: 23,
                            spreadRadius: -10,
                            color: shadowColor)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/dog.svg",
                        height: 75,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Köpek Adı",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("Açıklama kısmı")
                        ],
                      ),
                      Icon(Icons.delete_outline)
                    ],
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
