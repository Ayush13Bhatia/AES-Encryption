import 'package:encrypted_app/ecrypted_text.dart';
import 'package:flutter/material.dart';

import 'fernet_encryption.dart';

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
                text: "Ecrypted AES Text:- ",
                style: const TextStyle(
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: EncryptData.encrypted != null ? EncryptData.encrypted!.base64 : '',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            RichText(
              text: TextSpan(
                text: "Decrypted AES Text:- ",
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
            const SizedBox(
              height: 20,
            ),
            const Text("Salsa algorithm"),
            RichText(
              text: TextSpan(
                text: "fernetEcrypted  Text:- ",
                style: const TextStyle(
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: FernetEcryption.fernetEncrypted != null ? FernetEcryption.fernetEncrypted!.base64 : '',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            RichText(
              text: TextSpan(
                text: "fernetDecrypted Text:- ",
                style: const TextStyle(
                  color: Colors.black,
                ),
                children: [
                  TextSpan(text: FernetEcryption.fernetDecrypted ?? ""),
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
                    });
                  },
                  child: const Text("AESEcrytp"),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      EncryptData.dencryptedAES(_controller.text);
                    });
                  },
                  child: const Text("AESDecrypt"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      FernetEcryption.encryptFernet(_controller.text);
                    });
                  },
                  child: const Text("FernetEcrytp"),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      FernetEcryption.decryptFernet(_controller.text);
                    });
                  },
                  child: const Text("FernetDecrypt"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
