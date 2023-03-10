import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'dart:convert';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  File? file;
  ImagePicker image = ImagePicker();
  Dio dio = Dio();
  String medText =
      'Press the button below for your information';

  @override
  Widget build(BuildContext context) {
    postData() async {
     // print("Check if this is running and it gets stuck at await");
      // file = getImage() as File?;

      // // INSERT URL FOR REST API HERE
      // var request =
      // http.MultipartRequest("POST", Uri.parse("http://127.0.0.1:5000/"));
      // request.files.add(http.MultipartFile.fromBytes(
      //     "picture", File(file!.path).readAsBytesSync(), filename: file!.path));

      // var res = await request.send();

      // var client = http.Client();
      // var uri = Uri.parse('http://10.0.2.2:5000');
      // var response = await client.get(
      //   uri,
      //   headers: {'Content-Type': 'application/json'},
      // );

      // var response = await dio.post('http://10.0.2.2:5000/picture',
      //     data: {"img_loc": "barcode_storage/6965131511316.png"});
      // print(response);

    //  medText = response as String;

      setState(() {
        medText = "Drug Name: \n  Isotretinoin \nConflicts: \n  acitretin; aminolevulinic acid; bexarotene; demeclocycline; doxycycline; eravacycline; etretinate; leflunomide; levoketoconazole; lomitapide; minocycline; mipomersen; omadacycline; oxytetracycline; pexidartinib; sarecycline; teriflunomide; tetracycline; tretinoin; vitamin a";
      });

    }
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(medText),
              ),
              MaterialButton(
                onPressed: postData,
                color: Colors.amber[900],
                child: const Text("Check Medication",
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ]),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<File> getImage() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    //TO convert Xfile into file
    File file = File(image!.path);
    return file;
  }
}
