import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:dtk_database_tekkom/silabus/pagematkuldesc.dart';
import 'package:dtk_database_tekkom/template/buttontemplate.dart';
import 'package:dtk_database_tekkom/template/headerfooter.dart';
import 'package:open_file/open_file.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class BankSoal extends StatefulWidget {
  @override
  _BankSoalState createState() => _BankSoalState();
}

class _BankSoalState extends State<BankSoal> {
  late Future<List<FirebaseFile>> futureFiles;

  @override
  void initState() {
    super.initState();

    futureFiles = FirebaseApi.listAll('files/');
  }

  UploadTask? task;
  File? file;

  TextEditingController jenisfile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Header(),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 350,
                height: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    color: Colors.blue),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "BANK SOAL DASAR PEMROGRAMAN",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              FutureBuilder<List<FirebaseFile>>(
                  future: futureFiles,
                  builder: (context, snapshot) {
                    final files = snapshot.data!;
                    return Expanded(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(children: [
                              Padding(padding: EdgeInsets.all(8.0)),
                              Expanded(
                                  child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                ),
                                itemCount: files.length,
                                itemBuilder: (context, index) {
                                  final file = files[index];

                                  return InkWell(
                                    onTap: () =>
                                        OpenFile.open(file.ref.toString()),
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                      color: Colors.yellow,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9)),
                                                  child: Icon(
                                                      Icons.picture_as_pdf))),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            file.name,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ))
                            ]),
                          )),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LongButton(
                          hinttext: "Back",
                          iconArrow: "Left",
                          dest: DescMatkul()),
                      SizedBox(
                        width: 100,
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: 60,
                          height: 60,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18)))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.add),
                              ],
                            ),
                            onPressed: () async {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Center(
                                      child: Material(
                                        type: MaterialType.transparency,
                                        child: Container(
                                          color: Colors.yellow,
                                          height: 300,
                                          width: 350,
                                          child: Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: Container(
                                              color: Colors.lightBlue,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  children: <Widget>[
                                                    Text(
                                                      "Upload File",
                                                      style: TextStyle(
                                                          fontSize: 30,
                                                          color: Colors.black),
                                                    ),
                                                    Row(
                                                      children: <Widget>[
                                                        Container(
                                                          height: 50,
                                                          width: 65,
                                                          child: Text(
                                                            "Jenis",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 24),
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 50,
                                                          width: 235,
                                                          child: TextFormField(
                                                            controller:
                                                                jenisfile,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal),
                                                            decoration:
                                                                InputDecoration(
                                                                    fillColor:
                                                                        Colors
                                                                            .white,
                                                                    filled:
                                                                        true,
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: Colors.white),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              25),
                                                                    )),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Row(
                                                      children: <Widget>[
                                                        Container(
                                                          height: 50,
                                                          width: 65,
                                                          child: Text(
                                                            "File",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 24),
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 50,
                                                          width: 75,
                                                          child: ElevatedButton(
                                                            onPressed:
                                                                () async {
                                                              await selecFiles();
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .add_photo_alternate_outlined,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                            style: ButtonStyle(
                                                                backgroundColor:
                                                                    MaterialStateProperty.all<
                                                                            Color>(
                                                                        Colors
                                                                            .white)),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 60,
                                                      height: 60,
                                                      child: ElevatedButton(
                                                        style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<
                                                                    RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            18)))),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(Icons.add),
                                                          ],
                                                        ),
                                                        onPressed: () async {
                                                          await uploadFiles();
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          BankSoal()));
                                                        },
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            },
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget gridFiles(PlatformFile file) {
    final kb = file.size / 1024;
    final mb = kb / 1024;
    final filesize =
        mb >= 1 ? '${mb.toStringAsFixed(2)} MB' : '${kb.toStringAsFixed(3)}';
    final extension = file.extension ?? 'none';

    return InkWell(
      //onTap: () => widget.onOpenedFile(file),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.yellow, borderRadius: BorderRadius.circular(9)),
              child: Text(
                '.$extension',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )),
            const SizedBox(
              height: 8,
            ),
            Text(
              file.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              filesize,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Future selecFiles() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }

  Future uploadFiles() async {
    if (file == null) return;

    final filename = basename(file!.path);
    final destination = 'files/$filename';

    task = FirebaseApi.uploadFiles(destination, file!);

    if (task == null) return;

    //final snapshot = await task!.whenComplete(() {});
    //final urlDownload = await snapshot.ref.getDownloadURL();
  }
}

class FirebaseApi {
  static Future<List<String>> _getDownloadLinks(List<Reference> refs) =>
      Future.wait(refs.map((ref) => ref.getDownloadURL()).toList());

  static Future<List<FirebaseFile>> listAll(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    final result = await ref.listAll();
    final urls = await _getDownloadLinks(result.items);

    return urls
        .asMap()
        .map((index, url) {
          final ref = result.items[index];
          final name = ref.name;
          final file = FirebaseFile(ref: ref, name: name, url: url);

          return MapEntry(index, file);
        })
        .values
        .toList();
  }

  static UploadTask? uploadFiles(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putFile(file);
      // ignore: unused_catch_clause
    } on FirebaseException catch (e) {
      return null;
    }
  }
}

class FirebaseFile {
  final Reference ref;
  final String name;
  final String url;

  const FirebaseFile(
      {required this.ref, required this.name, required this.url});
}
