import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  final String background_tampilan = "pict/background_tampilan5.jpg";
  final String gambar_utama = "pict/gambar_utama.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('2009106115_Ahmad Riadi'),
      ),
      body: Stack(
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
                    "Bioskop XXI",
                    style:
                        TextStyle(color: Colors.grey.shade700, fontSize: 24.0),
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
                child: RaisedButton(
                  padding: const EdgeInsets.all(16.0),
                  textColor: Colors.white,
                  color: Colors.blue.shade600,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                  onPressed: () {},
                  child: Text(
                    "Beli Sekarang!",
                    style:
                        TextStyle(fontWeight: FontWeight.w300, fontSize: 18.0),
                  ),
                ),
              ), //----------------------------------------------

              SizedBox(height: 20.0),
            ],
          )
        ],
      ),
    );
  }
}
