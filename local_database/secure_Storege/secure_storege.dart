import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorege extends StatefulWidget {
  const SecureStorege({Key? key}) : super(key: key);

  @override
  State<SecureStorege> createState() => _SecureStoregeState();
}

class _SecureStoregeState extends State<SecureStorege> {
  var email1 = "";
  var password2 = "";
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SecureStorege"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: email,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Email",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: password,
              decoration: const InputDecoration(
                hintText: "password",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  FlutterSecureStorage sot = FlutterSecureStorage();
                  sot.write(key: "email", value: email.text);
                  sot.write(key: "password", value: password.text);
                  email.clear();
                  password.clear();
                },
                child: Text("Save")),
            ElevatedButton(
                onPressed: () async {
                  FlutterSecureStorage ss = FlutterSecureStorage();
                  email1 = (await ss.read(key: "email"))!;
                  password2 = (await ss.read(key: "password"))!;
                  setState(() {});
                },
                child: Text("GetDatA")),
            Text(email1),
            Text(password2),
          ],
        ),
      ),
    );
  }
}
