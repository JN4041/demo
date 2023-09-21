import 'package:flutter/material.dart';
import 'package:life/local_database/Shareprefer_small/shared_perfScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'coman_texfile.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({Key? key}) : super(key: key);

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Creat Tex")),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_MIAY5BGV_qWhzLP64OqDzRIAMM1TJBFS52KJuYD-MQ8FAO-AU58hxhyBny9TuTcfMPk&usqp=CAU"),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonTex(
                ontap: () {},
                prefixicon: const Icon(Icons.person),
                // color: Colors.red,
                controller: email,
                validator: (p0) {},
              ),
              const SizedBox(
                height: 10,
              ),
              CommonTex(
                ontap: () {},
                prefixicon: const Icon(Icons.security_rounded),
                controller: password,
                validator: (p0) {},
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () async {
                    SharedPreferences pp =
                        await SharedPreferences.getInstance();
                    pp
                        .setString('email', email.text)
                        .then((value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SharedScreen(),
                            )));
                    print("dont");
                  },
                  child: const Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
