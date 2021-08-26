import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

import 'aes.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController tec = TextEditingController();
  var encryptedText, plainText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AEScrypter")),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: tec,
              ),
            ),
            Column(
              children: [
                Text("Plain Text",style: TextStyle(fontSize: 25,color: Colors.blue[400],fontWeight: FontWeight.w600),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                child: Text(plainText == null ? "" : plainText),
                )
              ],
            ),

                Column(
                  children: [
                    Text("Encrypted Text ",style: TextStyle(fontSize: 25,color: Colors.blue[400],fontWeight: FontWeight.w600),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(encryptedText == null ? "" : encryptedText is encrypt.Encrypted ? encryptedText.base64 : encryptedText),
                    )
                  ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ignore: deprecated_member_use
                RaisedButton(onPressed: () {
                  plainText = tec.text;
                  setState(() {
                    encryptedText = AES.encryptAES(plainText);
                  });
                } ,
                  child: Text("Encrypt"),
                ),
                SizedBox(width: 10),
                // ignore: deprecated_member_use
                RaisedButton(onPressed: () {
                  setState(() {
                    encryptedText = AES.decryptAES(encryptedText);
                  });
                } ,
                  child: Text("Decrypt"),
                )
              ],
            )
          ],
        ),
      ),


    );
  }
}
