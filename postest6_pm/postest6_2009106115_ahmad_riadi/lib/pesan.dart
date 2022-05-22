import 'package:flutter/material.dart';
import 'package:postest6_2009106115_ahmad_riadi/mainpage.dart';
import 'package:postest6_2009106115_ahmad_riadi/menu.dart';
import 'package:postest6_2009106115_ahmad_riadi/controller/text_ctrl.dart';
import 'package:get/get.dart';
import 'package:postest6_2009106115_ahmad_riadi/tampilanForm.dart';

class pesan extends StatefulWidget {
  const pesan({Key? key}) : super(key: key);
  @override
  State<pesan> createState() => _pesanState();
}

class _pesanState extends State<pesan> {
  final TextController tc = Get.put(TextController());

  Future<dynamic> CustomAlert(BuildContext context, String pesan) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(pesan),
            actions: [
              OutlinedButton(
                onPressed: () => Get.to(TampilanForm()),
                child: Text("Ya"),
              ),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Batal")),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("2009106115_Ahmad Riadii"),
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
        children: [
          Container(
              //----------  Atur BAckground ---------------
              alignment: Alignment.bottomCenter,
              color: Colors.black87,
              child: const Image(
                image: AssetImage("pict/background_tampilan5.jpg"),
                fit: BoxFit.contain,
              )), //------------------------------------
          ListView(
            children: [
              Container(
                height: 80,
                alignment: Alignment.center,
                child: const Text(
                  "Isi Form Berikut",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20), // Margin Bohongan

                  TextField(
                    style: TextStyle(color: Colors.white),
                    maxLines: 4,
                    controller: tc.namaDepanCtrl,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      labelText: "Nama Lengkap",
                      hintStyle: TextStyle(color: Colors.white),
                      fillColor: Colors.white,
                      hintText: 'Isi Nama Lengkap',
                    ),
                  ),

                  const SizedBox(height: 20),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    maxLines: 4,
                    controller: tc.emailCtrl,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      labelText: "Email",
                      hintStyle: TextStyle(color: Colors.white),
                      fillColor: Colors.white,
                      hintText: 'Isi Email',
                    ),
                  ),

                  const SizedBox(height: 20), // Margin Bohongan
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    maxLines: 2,
                    controller: tc.namaTiketCtrl,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        hintText: 'Nama Tiket',
                        hintStyle: TextStyle(color: Colors.white),
                        fillColor: Colors.white,
                        labelText: "Isi Nama Tiket"),
                  ),
                ],
              ),
              SizedBox(height: 20), // Margin Bohongan

              ElevatedButton(
                onPressed: tc.onPressed,
                child: Text("Submit"),
              ),
              SizedBox(height: 20), // Marg
              ElevatedButton(
                onPressed: () {
                  CustomAlert(context, "Anda Yakin ?");
                },
                child: const Text("Tampilkan"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
