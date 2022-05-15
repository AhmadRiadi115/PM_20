import 'dart:async';
import 'package:flutter/material.dart';
import 'package:postest5/menu.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    star();
  }

  star() {
    return Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "pict/Splash Screen.png",
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String background_tampilan = "pict/background_tampilan5.jpg";
  String gambar_utama = "pict/gambar_utama.jpg";
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
                background_tampilan,
                fit: BoxFit.contain,
              )), //------------------------------------

          Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              Expanded(
                  //----------  Atur gambar kotak utama ---------------
                  child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(1.0, 5.0),
                          blurRadius: 5.0)
                    ]),
                margin: EdgeInsets.all(48.0),
                child: Column(children: <Widget>[
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(gambar_utama), fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(11.0),
                        )),
                  )),
                  SizedBox(height: 20.0),
                  Text(
                    "Mov Ticket Premier",
                    style:
                        TextStyle(color: Colors.grey.shade700, fontSize: 22.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Situs Pembelian tiket Terbaik\nFilm Terbaru\n Kenyamanan nomor 1",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: Colors.grey.shade400, fontSize: 14.0),
                  ),
                  SizedBox(height: 30.0)
                ]),
              )), //---------------------------------------------

              Container(
                //----------  Atur tombol ------------------
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                width: double.infinity,
                child: ElevatedButton(
                    //aksi yang akan dijalankan saat tombol diklik/ditekan
                    onPressed: () {
                      Route route =
                          MaterialPageRoute(builder: (context) => menu());
                      Navigator.push(context, route);
                    },
                    child: Text("Get Start")),
              ), //----------------------------------------------

              SizedBox(height: 20.0),
            ],
          )
        ],
      ),
    );
  }
}
