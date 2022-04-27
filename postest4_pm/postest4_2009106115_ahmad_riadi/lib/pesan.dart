import 'package:flutter/material.dart';
import 'package:postest4_2009106115_ahmad_riadi/mainpage.dart';
import 'package:postest4_2009106115_ahmad_riadi/menu.dart';
import 'package:postest4_2009106115_ahmad_riadi/tampilanForm.dart';

class pesan extends StatefulWidget {
  const pesan({Key? key}) : super(key: key);
  @override
  State<pesan> createState() => _pesanState();
}

class _pesanState extends State<pesan> {
  final namaDepanCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final namaTiketCtrl = TextEditingController();

  String namaDepan = "", email = '', namaTiket = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    namaDepanCtrl.dispose();
    emailCtrl.dispose();
    namaTiketCtrl.dispose();
    super.dispose();
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
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return Home();
              }));
            },
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            tileColor: Colors.green,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return menu();
              }));
            },
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text("Pesan"),
            tileColor: Colors.cyanAccent,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return pesan();
              }));
            },
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
                    controller: namaDepanCtrl,
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
                    controller: emailCtrl,
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
                    controller: namaTiketCtrl,
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
              const SizedBox(height: 20), // Margin Bohongan
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    namaDepan = namaDepanCtrl.text;
                    email = emailCtrl.text;
                    namaTiket = namaTiketCtrl.text;
                  });
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TampilanForm(
                            Nama2: namaDepanCtrl.text,
                            Email2: emailCtrl.text,
                            NamaTiket2: namaTiketCtrl.text,
                          )));
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
