// ignore_for_file: prefer_typing_uninitialized_variables, prefer_if_null_operators, prefer_const_constructors, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:myapp/screens/third.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController? _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        title: Text("Encrypt and Decrypt Data [ AES Algorithms ]"),
      ),
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Container(
              height: 280,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Card(
                elevation: 2,
                child: Container(
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Text',
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "EncryptText : ${EncryptData.decrypted != null ? EncryptData.encoded : ''}",
                        maxLines: 2,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Text(
                            "DecryptText : ${EncryptData.encrypted != null ? EncryptData.decrypted : ''}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(color: Colors.black, fontSize: 16)),
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.deepPurpleAccent, // background
                            ),
                            onPressed: () {
                              setState(() {
                                EncryptData.decryptAES(_controller!.text);
                              });
                            },
                            child: Text('Encryption'),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.deepPurpleAccent, // background
                            ),
                            onPressed: () {
                              setState(() {
                                EncryptData.encryptAES(_controller!.text);
                              });
                            },
                            child: Text('Decryption'),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
