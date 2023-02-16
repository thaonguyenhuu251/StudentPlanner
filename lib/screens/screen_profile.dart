import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studentplanner/presentation/schedule_icons.dart' as IconsCustom;

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 243, 243, 243),
      child: ListView(
        padding: EdgeInsets.only(top: 80),
        children: [
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("БАКАЛАВРИАТС"),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text("БАКАЛАВРИАТС"),
                      ),
                      Text("БАКАЛАВРИАТС"),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Image.network(
                    "https://png.pngtree.com/png-vector/20191101/ourmid/pngtree-cartoon-color-simple-male-avatar-png-image_1934459.jpg",
                    fit: BoxFit.fill,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  selectedTileColor: Colors.blue,
                  leading: Icon(IconsCustom.Schedule.mark),
                  title: Align(
                    child: Text(
                      'Зачетная книжка',
                      style: TextStyle(fontFamily: 'alkes', fontSize: 18),
                    ),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                Divider(
                  height: 1,
                  color: Colors.grey,
                ),
                ListTile(
                  selectedTileColor: Colors.blue,
                  leading: Icon(IconsCustom.Schedule.mark),
                  title: Align(
                    child: Text(
                      'Зачетная книжка',
                      style: TextStyle(fontFamily: 'alkes', fontSize: 18),
                    ),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                ListTile(
                  selectedTileColor: Colors.blue,
                  leading: Icon(IconsCustom.Schedule.mark),
                  title: Align(
                    child: Text(
                      'Зачетная книжка',
                      style: TextStyle(fontFamily: 'alkes', fontSize: 18),
                    ),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                ListTile(
                  selectedTileColor: Colors.blue,
                  leading: Icon(IconsCustom.Schedule.mark),
                  title: Align(
                    child: Text(
                      'Зачетная книжка',
                      style: TextStyle(fontFamily: 'alkes', fontSize: 18),
                    ),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
