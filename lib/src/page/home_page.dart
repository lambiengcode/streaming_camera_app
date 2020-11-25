import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desktop_app_camera/src/widget/home_page/grid_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: StreamBuilder(
          stream: Firestore.instance
              .collection('users')
              .where('id', isEqualTo: 'testID')
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: snapshot.data.documents[0]['quantity'],
              itemBuilder: (context, index) {
                return GridItem(
                  index: index,
                  idCam: 'testID' + index.toString(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
