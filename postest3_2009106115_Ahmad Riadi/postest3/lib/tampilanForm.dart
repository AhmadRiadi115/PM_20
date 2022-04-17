// ignore_for_file: non_constant_identifier_names

import 'dart:ui';

import 'package:flutter/material.dart';

class TampilanForm extends StatelessWidget {
  String Nama2 = "", Email2 = "", NamaTiket2 = "";
  TampilanForm(
      {Key? key,
      required this.Nama2,
      required this.Email2,
      required this.NamaTiket2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('2009106115_Ahmad Riadi'),
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
                                " : " + Nama2,
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
                              Text(" : " + Email2,
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
                              Text(" : " + NamaTiket2,
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
