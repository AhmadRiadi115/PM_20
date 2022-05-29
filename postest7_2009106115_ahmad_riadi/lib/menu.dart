import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:postest7_2009106115_ahmad_riadi/mainpage.dart';
import 'package:postest7_2009106115_ahmad_riadi/pesan.dart';
import 'package:postest7_2009106115_ahmad_riadi/tampilanForm.dart';

class menu extends StatelessWidget {
  const menu({Key? key}) : super(key: key);

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

    var sino = [
      "Dalam kunjungannya, Toni Stark tertangkap dan disandera oleh militan Afghanistan. Di dalam goa, diam-diam ia membangun sebuah senjata lapis baja anti peluru untuk melawan musuh dan meloloskan diri.",
      "Tony Stark berada di bawah tekanan dari berbagai pihak, termasuk pemerintah, untuk berbagi teknologinya dengan dunia. Ia harus menemukan cara menghadapi mereka dan juga melawan musuh-musuhnya.",
      "Tony Stark membangun sistem kecerdasan buatan bernama Ultron dengan bantuan Bruce Banner. Namun, Ultron mengambil alih kendali dan Avengers harus menghentikannya sebelum memusnahkan umat manusia.",
      "The Avengers dan sekutu mereka harus bersedia mengorbankan segalanya dalam upaya untuk mengalahkan Thanos yang kuat sebelum ia berhasil menghancurkan alam semesta.",
      "Melanjutkan Avengers Infinity War, dimana kejadian setelah Thanos berhasil mendapatkan semua infinity stones dan memusnahkan 50% semua mahluk hidup di alam semesta. Akankah para Avengers berhasil mengalahkan Thanos?"
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("2009106115_Ahmad Riadii"),
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
            // onTap: () => Get.to(Home()),
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
            // onTap: () => Get.to(pesan()),
          )
        ]),
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
                height: 40,
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
                      return InkWell(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext context) => detail(
                                    nama: karakter2[i],
                                    gambar: karakter[i],
                                    sino: sino[i]))),
                        child: Container(
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
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 20.0),
              // Container(
              //   //----------  Atur tombol ------------------
              //   padding: const EdgeInsets.symmetric(horizontal: 80.0),
              //   width: double.infinity,
              //   child: ElevatedButton(
              //       //aksi yang akan dijalankan saat tombol diklik/ditekan
              //       onPressed: () {
              //         Route route =
              //             MaterialPageRoute(builder: (context) => pesan());
              //         Navigator.push(context, route);
              //       },
              //       child: Text("Menuju Form")),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}

class detail extends StatelessWidget {
  String nama = "", gambar = "", sino;
  detail(
      {Key? key, required this.sino, required this.nama, required this.gambar})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("2009106115_Ahmad Riadii"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.black87,
            height: 350,
            child: Image.asset(gambar),
          ),
          Bagiannama(
            nama: nama,
          ),
          Bagianicon(),
          Sinopsis(
            sino: sino,
          ),
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
                child: Text("Reservasi Ticket !")),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}

class Bagiannama extends StatelessWidget {
  String nama = "";
  Bagiannama({required this.nama});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  nama,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                Text(
                  "Marvel Cinema Universe",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.star,
                size: 30,
                color: Color.fromARGB(255, 231, 190, 6),
              ),
              Text("4,5")
            ],
          )
        ],
      ),
    );
  }
}

class Bagianicon extends StatelessWidget {
  const Bagianicon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          icontext(
            icon: Icons.movie,
            textt: "IXX Movie",
          ),
          icontext(
            icon: Icons.download,
            textt: "Download",
          ),
          icontext(
            icon: Icons.rate_review,
            textt: "Best Movie",
          ),
        ],
      ),
    );
  }
}

class icontext extends StatelessWidget {
  IconData icon;
  String textt = "";
  icontext({required this.icon, required this.textt});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            size: 40,
            color: Colors.blueAccent,
          ),
          Text(
            textt,
            style: TextStyle(fontSize: 15, color: Colors.grey),
          )
        ],
      ),
    );
  }
}

class Sinopsis extends StatelessWidget {
  String sino;
  Sinopsis({required this.sino});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
        child: Text(
          sino,
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
