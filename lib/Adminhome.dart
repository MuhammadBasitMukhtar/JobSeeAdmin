import 'dart:ui';
import 'package:adminpanel/viewjobseeker.dart';
import 'package:adminpanel/viewjobupler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class adminHome extends StatefulWidget {
  const adminHome({Key? key}) : super(key: key);

  @override
  State<adminHome> createState() => _adminHomeState();
}

class _adminHomeState extends State<adminHome> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    print("$h x $w");

    return Scaffold(
      body: Stack(
        children: [
          // Image(
          //   image: AssetImage(
          //       'assets/sl-telehealth-smartphone-doctor-1200x600.jpeg'),
          //   height: h * 0.3,
          // ),

          ///body

          SlidingUpPanel(
            maxHeight: h * 0.75,
            defaultPanelState: PanelState.OPEN,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            body: Container(),
            panelBuilder: (c) {
              return Stack(children: [
                Padding(
                  padding: EdgeInsets.only(top: h * 0.024),
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: h * 0.065,
                        child: Text(
                          'Jobsee Admin Panel',
                          style: TextStyle(
                              fontSize: w * 0.09, fontWeight: FontWeight.bold),
                        ),
                      )),
                ),
                Divider(
                  thickness: 3,
                  height: h * 0.20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: GestureDetector(
                      
 onTap: () { Navigator.push(context,
                                MaterialPageRoute(builder: (context) => const adminViewjobsuploader()),
                                  );
                                 },
                        child: Container(
                          height: 100,
                          width: 200,
                          decoration: BoxDecoration(
                            color:Colors.red,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                child: const Icon(
                                  Icons.admin_panel_settings_outlined,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Jobs Uploader',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () { Navigator.push(context,
                                MaterialPageRoute(builder: (context) => const adminViewjobseeker()),
                                  );
                                 },
                      child: Container(
                        height: 100,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.admin_panel_settings_sharp,
                              color: Colors.white,
                            ),
                            Text('Jobs Seeker',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ]);
            },
          ),
        ],
      ),
    );
  }
}