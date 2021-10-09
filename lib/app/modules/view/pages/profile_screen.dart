import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:pazar_iraq/app/core/constants.dart';
import 'package:pazar_iraq/app/modules/controller/auth_controller.dart';
import 'package:pazar_iraq/app/modules/view/widgets/beziercontainer.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final AuthController authController = Get.find();
  Widget infoCard(String title, String information) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.orange),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            Text(
              information,
              style: TextStyle(color: Colors.black, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: deviceHeight,
      width: deviceWidth,
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
              top: -deviceHeight * .01,
              right: -deviceWidth * .2,
              child: const BezierContainer()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                    child: Image.network(
                  authController.user.photoUrl ?? "",
                  fit: BoxFit.cover,
                  width: 120.0,
                  height: 120.0,
                )),
                infoCard("Name : ", authController.user.name ?? ""),
                infoCard(
                    "Phone :", authController.user.phone ?? "+9647515408773"),
                infoCard("Email : ", authController.user.email ?? ""),
                infoCard(
                    "Address : ", authController.user.address ?? "Erbil, Iraq"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
