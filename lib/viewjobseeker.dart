import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class adminViewjobseeker extends StatefulWidget {
  const adminViewjobseeker({super.key});

  @override
  State<adminViewjobseeker> createState() => _adminViewjobseekerState();
}

class _adminViewjobseekerState extends State<adminViewjobseeker> {
  @override
  Widget build(BuildContext context) {
     var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    print("$h x $w");

    return Scaffold(
        body: Stack(children: [
      SizedBox(
        height: 0.02 * h,
      ),
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 0.33 * h,
              ),
              Card(),
              SizedBox(
                height: 0.03 * h,
              ),
              Card(),
              SizedBox(
                height: 0.03 * h,
              ),
              Card(),
              SizedBox(
                height: 0.03 * h,
              ),
              Card(),
            ],
          ),
        ),
      ),
      Container(
        height: 0.3 * h,
        width: double.infinity,
        //color: Colors.amber,
        decoration: new BoxDecoration(
            color: Colors.red, //new Color.fromRGBO(255, 0, 0, 0.0),
            borderRadius: new BorderRadius.only(
                bottomLeft: const Radius.circular(40.0),
                bottomRight: const Radius.circular(40.0))),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 0.07 * h, left: 0.05 * w),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                  
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 0.18 * w,
                  ),
                  Center(
                    child: Text(
                      "Admin Panel",
                      style: TextStyle(color: Colors.white, fontSize: 0.07 * w),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 0.1 * h,
            ),
            Text(
              "Job Seeker Details",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 0.07 * w,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    ])
        
        );
  }
}

class Card extends StatelessWidget {
  const Card({
    Key? key,
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
            'Gulam Mustafa',
            style: TextStyle(
              //  color: Colors.white,
              fontSize: 0.04 * w,
              //fontWeight: FontWeight.bold
            ),
          ),
          Text(
            "Id",
            style: TextStyle(
                //  color: Colors.white,
                fontSize: 0.06 * w,
                fontWeight: FontWeight.bold
                //
                //  fontWeight: FontWeight.bold
                ),
          ),
          Text(
            "#1000988",
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