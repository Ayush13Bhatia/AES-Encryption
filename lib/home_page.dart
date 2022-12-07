import 'package:encrypted_app/ecrypted_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ecryption"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 3,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                text: "Ecrypted Text:- ",
                style: const TextStyle(
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: EncryptData.encrypted != null ? EncryptData.encrypted!.base64 : '',
                  ),

                  // TextSpan(text: "$encrypted" != null ? encrypted.base64 : ""),
                  // TextSpan(text: "${encrypter.encrypt(_controller.text, iv: iv)}"),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            RichText(
              text: TextSpan(
                text: "Decrypted Text:- ",
                style: const TextStyle(
                  color: Colors.black,
                ),
                children: [
                  TextSpan(text: EncryptData.decrypted ?? ""),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      EncryptData.encryptedAES(_controller.text);
                      // encrypter.encrypt(_controller.text, iv: iv);
                    });
                  },
                  child: const Text("Ecrytp"),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      EncryptData.dencryptedAES(_controller.text);
                      // encrypter.decrypt(encrypted, iv: iv);
                    });
                  },
                  child: const Text("Decrypt"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
