import 'dart:ui';
import 'package:adminpanel/seekerModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'seekerCard.dart';

class adminViewjobseeker extends StatefulWidget {
  const adminViewjobseeker({super.key});

  @override
  State<adminViewjobseeker> createState() => _adminViewjobseekerState();
}

class _adminViewjobseekerState extends State<adminViewjobseeker> {
  List<Seeker> listUploaders = [];
  Future<void> display() async {
    listUploaders = [];

    try {
      final List<Seeker> loadedProduct = [];
      var userData = await Firestore.instance
          .collection('users')
          .where("role", isEqualTo: "seeker")
          .getDocuments();
      userData.documents.forEach((element) {
        String title = "";
        String company = "";

        String uploaderName = "";
        String f_name = "";
        String l_name = "";
        Seeker upl = new Seeker('',"","",0);
        int timeStamp = 0;
        upl.sid = element.documentID;

        element.data.forEach((key, value) {
          if (key == "first_name") {
            f_name = value;
          }
          if (key == "last_name") {
            l_name = value;
          }
          if (key == "email") {
            upl.email = value;
          }
          if (key == "joining_date") {
            upl.joining_date = int.parse(value.toString());
          }
          
          // upl.sid = element.documentID;
        });
        setState(() {
          upl.name = f_name + " " + l_name;
          listUploaders.add(upl);
        });
      });
      // listjobs.addAll(loadedProduct);
      listUploaders.sort((a, b) => b.joining_date.compareTo(a.joining_date));

      print(listUploaders);

      // }
    } catch (e) {
      print(e.toString());
    }
  }

  void initState() {
    display();
    print("InitCalld");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    print("$h x $w");

    return Scaffold(
        body: Stack(children: [
      SizedBox(
        height: 0.32 * h,
      ),
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
              // margin: EdgeInsets.only(left: 1, bottom: 1, right: 1),
              margin: EdgeInsets.only(top: 210),
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.99,
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return SeekerCard(
                    seeker: listUploaders[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: listUploaders.length,
              ),
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

