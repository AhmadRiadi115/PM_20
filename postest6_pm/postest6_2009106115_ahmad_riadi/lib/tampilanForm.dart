import 'package:flutter/material.dart';
import 'package:postest6_2009106115_ahmad_riadi/mainpage.dart';
import 'package:postest6_2009106115_ahmad_riadi/menu.dart';
import 'package:postest6_2009106115_ahmad_riadi/pesan.dart';
import 'package:get/get.dart';
import 'package:postest6_2009106115_ahmad_riadi/controller/text_ctrl.dart';

class TampilanForm extends StatelessWidget {
  TampilanForm({Key? key}) : super(key: key);

  final TextController tc = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('2009106115_Ahmad Riadi'),
      ),
      drawer: Drawer(
        child: ListView(children: [
          const DrawerHeader(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("pict/spiderman.jpg"),
              fit: BoxFit.fitWidth,
            )),
            child: Text(
              "Bioskop Page",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.blue,
                      blurRadius: 2,
                      offset: Offset(2, 2),
                    )
                  ]),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Landing"),
            tileColor: Colors.blueAccent,
            onTap: () => Get.to(Home()),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            tileColor: Colors.green,
            onTap: () => Get.to(menu()),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text("Pesan"),
            tileColor: Colors.cyanAccent,
            onTap: () => Get.to(pesan()),
          )
        ]),
      ),
      body: Stack(
        //---  Atur Background akan dtindis oleh kotak utama -------
        children: <Widget>[
          Container(
              //----------  Atur BAckground ---------------
              alignment: Alignment.bottomCenter,
              color: Colors.black87,
              child: Image.asset(
                "pict/background_tampilan5.jpg",
                fit: BoxFit.contain,
              )), //------------------------------------

          ListView(
            children: [
              Container(
                // constraints: BoxConstraints.expand(height: 200.0),
                height: 80,
                alignment: Alignment.center,
                child: Text(
                  "Data Form",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                  child: Column(children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20),
                  child: Table(
                    defaultColumnWidth: FixedColumnWidth(150.0),
                    children: [
                      TableRow(children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nama Lengkap',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.left,
                              )
                            ]),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                " : ${tc.namaDepan}",
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.left,
                              )
                            ]),
                      ]),
                      TableRow(children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Email',
                                  style: TextStyle(color: Colors.white))
                            ]),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(" : ${tc.email}",
                                  style: TextStyle(color: Colors.white))
                            ]),
                      ]),
                      TableRow(children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Nama Tiket',
                                  style: TextStyle(color: Colors.white))
                            ]),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(" : ${tc.namaTiket}",
                                  style: TextStyle(color: Colors.white))
                            ]),
                      ]),
                    ],
                  ),
                ),
              ])),
            ],
          )
        ],
      ),
    );
  }
}
