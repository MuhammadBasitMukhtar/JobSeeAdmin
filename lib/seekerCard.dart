import 'dart:ui';
import 'package:adminpanel/seekerModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


class SeekerCard extends StatelessWidget {
  final Seeker seeker;
  const SeekerCard({
    Key? key,
    required this.seeker,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      height: 0.17 * h,
      width: 0.9 * w,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red,
          style: BorderStyle.solid,
          width: 1.0,
        ),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 0.01 * h,
          ),
          Text(
            'Name',
            style: TextStyle(
                //  color: Colors.white,
                fontSize: 0.06 * w,
                fontWeight: FontWeight.bold),
          ),
          Text(
            seeker.name,
            style: TextStyle(
              //  color: Colors.white,
              fontSize: 0.04 * w,
              //fontWeight: FontWeight.bold
            ),
          ),
          Text(
            "Email",
            style: TextStyle(
                //  color: Colors.white,
                fontSize: 0.06 * w,
                fontWeight: FontWeight.bold
                //
                //  fontWeight: FontWeight.bold
                ),
          ),
          Text(
            seeker.email,
            style: TextStyle(
              //  color: Colors.white,
              fontSize: 0.04 * w,
              //
              //  fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(
            height: 0.04 * h,
          ),
        ],
      ),
    );
  }
}