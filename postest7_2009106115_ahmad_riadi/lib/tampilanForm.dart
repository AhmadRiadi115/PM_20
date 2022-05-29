import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:postest7_2009106115_ahmad_riadi/controller/CrudController.dart';
import 'package:postest7_2009106115_ahmad_riadi/controller/FirestoreController.dart';
import 'package:postest7_2009106115_ahmad_riadi/controller/TextController.dart';

class TodoPage extends StatelessWidget {
  TodoPage({Key? key, this.isUpdate = false}) : super(key: key);

  bool isUpdate;

  @override
  Widget build(BuildContext context) {
    TextController tc = Get.put(TextController());

    FirestoreController fsc = Get.find();
    CrudController crudController = Get.find();

    // info update
    if (isUpdate) {
      // Lanjutan dari onTap di
      tc.namaCtrl.text = crudController.nama.value;
      tc.emailCtrl.text = crudController.email.value;
      tc.namaTiketCtrl.text = crudController.namaTiket.value;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("${this.isUpdate ? 'Update' : 'Tambah'} Data"),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              MyTextField(
                controller: tc.namaCtrl,
                labelText: "Nama",
              ),
              MyTextField(
                controller: tc.emailCtrl,
                labelText: "Email",
              ),
              MyTextField(
                labelText: "Nama Tiket",
                controller: tc.namaTiketCtrl,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Cek jika update atau enggak
                  if (this.isUpdate) {
                    // Query untuk update
                    fsc.users.value.doc(crudController.id.value).update({
                      'nama': tc.namaCtrl.text,
                      'email': tc.emailCtrl.text,
                      'namaTiket': tc.namaTiketCtrl.text,
                    });
                  } else {
                    // Query untuk create
                    fsc.users.value.add({
                      'nama': tc.namaCtrl.text,
                      'email': tc.emailCtrl.text,
                      'namaTiket': tc.namaTiketCtrl.text,
                    });
                  }
                  // Supaya keyboard nya hilang pas tombol ditekan
                  FocusScope.of(context).unfocus();
                  // Ini Snackbar
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Data nama ${tc.namaCtrl.text} dan email ${tc.emailCtrl.text} berhasil ${this.isUpdate ? 'Diupdate' : 'Ditambahkan'}",
                      ),
                    ),
                  );
                },
                child: Text(this.isUpdate ? 'Update' : 'Tambah'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    this.controller,
    required this.labelText,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  final TextEditingController? controller;
  final String labelText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
        ),
        keyboardType: keyboardType,
      ),
    );
  }
}
