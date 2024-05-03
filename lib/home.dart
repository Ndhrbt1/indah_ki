import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:indah_ki/crypt.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var tec1 = TextEditingController();
  var tec2 = TextEditingController();
  // ignore: prefer_typing_uninitialized_variables
  var encryptedText, plainText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10),
              width: 400,
              child: TextField(
                controller: tec1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Input text',
                  // hintText: 'Input text',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              width: 400,
              child: TextField(
                maxLength: 32,
                controller: tec2,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Input Custome Key (32 Caracter)',

                  // hintText: 'Input text',
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    plainText = tec1.text;
                    setState(() {
                      encryptedText = Crypt.encryptFernet(plainText, tec2.text);
                    });
                  },
                  child: const Text("encrypt"),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      encryptedText = Crypt.decryptFernet(encryptedText, tec2.text);
                    });
                  },
                  child: const Text("decrypt"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 400,
              child: Text(
                encryptedText == null
                    ? ''
                    : encryptedText is encrypt.Encrypted
                        ? encryptedText.base64
                        : encryptedText,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
