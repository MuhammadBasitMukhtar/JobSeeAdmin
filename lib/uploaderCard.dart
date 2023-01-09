import 'package:adminpanel/uploaderModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UploaderCard extends StatelessWidget {
  final Uploader uploader;
  const UploaderCard({Key? key, required this.uploader}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      height: 0.25 * h,
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
            uploader.title,
            style: TextStyle(
                //  color: Colors.white,
                fontSize: 0.06 * w,
                fontWeight: FontWeight.bold),
          ),
          Text(
            uploader.name,
            style: TextStyle(
              //  color: Colors.white,
              fontSize: 0.04 * w,
              //fontWeight: FontWeight.bold
            ),
          ),
          Text(
            "Company",
            style: TextStyle(
                //  color: Colors.white,
                fontSize: 0.06 * w,
                fontWeight: FontWeight.bold
                //
                //  fontWeight: FontWeight.bold
                ),
          ),
          Text(
            uploader.company,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 50,
                width: 150,
                //   width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    // side: BorderSide(
                    //   width: 1.0,
                    //   color: Colors.blueAccent,
                    // ),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Map<String, dynamic> data = {};
                    Firestore.instance
                        .collection('jobs')
                        .document(uploader.jobid)
                        .get()
                        .then((DocumentSnapshot documentSnapshot) {
                      if (documentSnapshot.exists) {
                        documentSnapshot.data.forEach(
                          (key, value) {
                            data[key] = value;
                          },
                        );
                      } else {
                        print('Document does not exist on the database');
                      }
                      data["status"] = 'rejected';

                      Firestore.instance
                          .collection('jobs')
                          .document(uploader.jobid)
                          .setData(data);
                      var snackdemo = SnackBar(
                        content: Text('Job Approved Succssfully!'),
                        backgroundColor: Colors.green,
                        elevation: 10,
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(5),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackdemo);
                    });
                  },
                  child: Text(
                    'Rejected',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 150,
                //   width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    // side: BorderSide(
                    //   width: 1.0,
                    //   color: Colors.blueAccent,
                    // ),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () async {
                    Map<String, dynamic> data = {};
                    Firestore.instance
                        .collection('jobs')
                        .document(uploader.jobid)
                        .get()
                        .then((DocumentSnapshot documentSnapshot) {
                      if (documentSnapshot.exists) {
                        documentSnapshot.data.forEach(
                          (key, value) {
                            data[key] = value;
                          },
                        );
                      } else {
                        print('Document does not exist on the database');
                      }
                      data["status"] = 'open';

                      Firestore.instance
                          .collection('jobs')
                          .document(uploader.jobid)
                          .setData(data);
                      var snackdemo = SnackBar(
                        content: Text('Job Approved Succssfully!'),
                        backgroundColor: Colors.green,
                        elevation: 10,
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(5),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackdemo);
                    });
                  },
                  child: Text(
                    'Accepted',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
