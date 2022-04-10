import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Postest 1 Ahmad Riadi 2009106115',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var karakter = [
      "pict/Iron Man.jpg",
      "pict/Iron Man 2.jpg",
      "pict/Iron Man 3.jpg",
      "pict/AVG.jpg",
      "pict/AVG-Age of Ulron.jpg",
      "pict/AVG-Infinity War.jpg",
      "pict/AVG-End Game.jpg",
    ];
    var karakter2 = [
      "Iron Man",
      "Iron Man 2",
      "Iron Man 3",
      "Avangers",
      "Avangers - Age of Ulron",
      "Avangers - Infinity War",
      "Avangers - End Games"
    ];
    var lebar = MediaQuery.of(context).size.width;
    var panjang = MediaQuery.of(context).size.height;
    double textSize = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Postest 1 Ahmad Riadi'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
            //  2 columns jika portrait mode,
            //  3 columns jika landscape mode.

            crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            // panjang data sesuai isi karakter
            children: List.generate(karakter.length, (index) {
              return Center(
                child: Column(
                  children: [
                    Image(
                        image: AssetImage(karakter[index]),
                        height: panjang / 5,
                        width: lebar / 5),
                    Text(karakter2[index],
                        style: TextStyle(
                            color: Color.fromARGB(255, 10, 180, 24),
                            fontSize: textSize / 30))
                  ],
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
