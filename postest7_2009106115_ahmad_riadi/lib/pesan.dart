import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:postest7_2009106115_ahmad_riadi/tampilanForm.dart';
import 'package:postest7_2009106115_ahmad_riadi/controller/CrudController.dart';
import 'package:postest7_2009106115_ahmad_riadi/controller/FirestoreController.dart';

class pesan extends StatelessWidget {
  pesan({Key? key}) : super(key: key);
  final FirestoreController fsc = Get.put(FirestoreController());
  final CrudController crudController = Get.put(CrudController());
  Widget builder(context, snapshot) {
    return (snapshot.hasData)
        ? Column(
            // perulangan database
            children: snapshot.data!.docs
                .map<Widget>(
                  (e) => MyListTile(
                    leadingText: e.get('namaTiket'),
                    title: e.get('nama'),
                    subtitle: e.get('email'),
                    onTap: () {
                      // ambil semua nilai untuk di update
                      crudController.id(e.id);
                      crudController.nama(e.get('nama'));
                      crudController.email(e.get('email').toString());
                      crudController.namaTiket(e.get('namaTiket'));
                      // informasi
                      Get.to(() => TodoPage(
                            isUpdate: true,
                          ));
                    },
                    // Tekan lama buat hapus
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (_) => CustomAlert(
                          id: e.id,
                        ),
                      );
                    },
                  ),
                )
                .toList(), //ubah jadi list
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
              ],
            ),
          );
  }

  // refresh otomatis
  panggilTerus() {
    return StreamBuilder<QuerySnapshot>(
      stream: fsc.users.value.orderBy('nama').snapshots(),
      builder: builder,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("2009106115_Ahmad Riadi"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            height: 60,
            child: Text(
              "Riwayat Pesanan",
              style: TextStyle(fontSize: 25),
            ),
          ),
          ListTile(
            leading: Text(
              "Nama Tiket",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            title: Text("User"),
          ),
          panggilTerus(),
        ],
      ),
      bottomNavigationBar: Container(
        child: ElevatedButton(
            onPressed: () => Get.to(() => TodoPage()),
            child: Text("Tambah Riwayat")),
      ),
    );
  }
}

// Alert Delete
class CustomAlert extends StatelessWidget {
  const CustomAlert({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    FirestoreController fsc = Get.find();
    return AlertDialog(
      title: const Text('Hapus Data'),
      content: const Text('Data tidak dapat dikembalikan'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            // Queary untuk delete
            fsc.users.value.doc(id).delete();
            Get.back();
          },
          child: const Text(
            'Hapus',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}

// Ini Custom ListTile
class MyListTile extends StatelessWidget {
  const MyListTile(
      {Key? key,
      required this.leadingText,
      required this.title,
      required this.subtitle,
      this.onTap,
      this.onLongPress})
      : super(key: key);

  final String leadingText;
  final String title;
  final String subtitle;
  final void Function()? onTap;
  final void Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        leadingText,
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}
