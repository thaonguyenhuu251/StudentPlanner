import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            decoration: BoxDecoration(color: Colors.white),
            child: Row(

              children: [
                Column(
                  children: [
                    Text("БАКАЛАВРИАТСуворова Дарья Андреевна2068999-06-ИСТ-22-19"),
                    Text("БАКАЛАВРИАТСуворова Дарья Андреевна2068999-06-ИСТ-22-19"),
                    Text("БАКАЛАВРИАТСуворова Дарья Андреевна2068999-06-ИСТ-22-19"),
                  ],
                ),
                Image.network(
                  "https://png.pngtree.com/png-vector/20191101/ourmid/pngtree-cartoon-color-simple-male-avatar-png-image_1934459.jpg",
                  height: 60,
                  width: 60,
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
