import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:postest3/pesan.dart';

class menu extends StatefulWidget {
  const menu({Key? key}) : super(key: key);

  @override
  State<menu> createState() => _menuState();
}

class _menuState extends State<menu> {
  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    var karakter = [
      "pict/Iron Man.jpg",
      "pict/Iron Man 2.jpg",
      // "pict/Iron Man 3.jpg",
      // "pict/AVG.jpg",
      "pict/AVG-Age of Ulron.jpg",
      "pict/AVG-Infinity War.jpg",
      "pict/AVG-End Game.jpg",
    ];
    var karakter2 = [
      "Iron Man",
      "Iron Man 2",
      // "Iron Man 3",
      // "Avangers",
      "Avangers - Age of Ulron",
      "Avangers - Infinity War",
      "Avangers - End Games"
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("2009106115_Ahmad Riadii"),
      ),
      body: Stack(
        //---  Atur Background akan dtindis oleh kotak utama -------
        children: <Widget>[
          Container(
            //------------  Atur Background -----------------------
            alignment: Alignment.bottomCenter,
            color: Colors.black87,
            child: Image(image: AssetImage("pict/background_tampilan5.jpg")),
          ),
          Column(
            children: <Widget>[
              Container(
                // constraints: BoxConstraints.expand(height: 200.0),
                height: 80,
                alignment: Alignment.center,
                child: Text(
                  "Daftar Film Tebaik",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                  ),
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 450.0,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 4),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
                items: [
                  0,
                  1,
                  2,
                  3,
                  4,
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        alignment: Alignment.topCenter,
                        width: 270,
                        height: 400,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        // color: Colors.cyanAccent,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(karakter[i]))),
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            karakter2[i],
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 20.0),
              Container(
                //----------  Atur tombol ------------------
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                width: double.infinity,
                child: ElevatedButton(
                    //aksi yang akan dijalankan saat tombol diklik/ditekan
                    onPressed: () {
                      Route route =
                          MaterialPageRoute(builder: (context) => pesan());
                      Navigator.push(context, route);
                    },
                    child: Text("Menuju Form")),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
