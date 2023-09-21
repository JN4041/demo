import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class DCode extends StatefulWidget {
  const DCode({Key? key}) : super(key: key);

  @override
  State<DCode> createState() => _DCodeState();
}

class _DCodeState extends State<DCode> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  List<detial> elist = [];
  List colo1 = [
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purpleAccent,
    Colors.red,
    Colors.teal,
    Colors.white24,
    Colors.cyan
  ];

  @override
  void initState() {
    super.initState();

    AndroidInitializationSettings initializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final DarwinInitializationSettings darwinInitializationSettings =
        DarwinInitializationSettings(
            defaultPresentAlert: true,
            requestSoundPermission: true,
            requestBadgePermission: true);

    final LinuxInitializationSettings linuxInitializationSettings =
        LinuxInitializationSettings(defaultActionName: 'Open Notifications');

    final InitializationSettings initializationSettings1 =
        InitializationSettings(
            android: initializationSettings,
            linux: linuxInitializationSettings,
            iOS: darwinInitializationSettings);

    flutterLocalNotificationsPlugin.initialize(initializationSettings1);
  }

  shownotifications() {
    if (email.text.isEmpty || password.text.isEmpty) return;
    AndroidNotificationChannel channel = AndroidNotificationChannel(
        'chaneel', 'shownotifications',
        description: "this is most improtances",
        importance: Importance.max,
        playSound: true);
    flutterLocalNotificationsPlugin.show(
        0,
        email.text,
        password.text,
        NotificationDetails(
            android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          color: Colors.white,
          importance: Importance.high,
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          children: [
            const SizedBox(
              height: 53,
            ),
            TextField(
              controller: email,
              decoration: InputDecoration(
                  hintText: "Enter email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: password,
              onChanged: (value) {},
              decoration: InputDecoration(
                  hintText: "Enter password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
            ElevatedButton(
                onPressed: () {
                  String name = email.text;
                  String epassword = password.text;
                  setState(() {
                    elist.add(detial(edetial: name, epassword: epassword));
                  });
                  shownotifications();
                },
                child: const Text("Submit")),
            Expanded(
              child: ListView.builder(
                itemCount: elist.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: colo1[index],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      title: Text(elist[index].edetial),
                      subtitle: Text(elist[index].epassword),
                      trailing: InkWell(
                        onTap: () {
                          setState(() {
                            elist.removeAt(index);
                          });
                        },
                        child: Icon(Icons.delete),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class detial {
  String edetial;
  String epassword;

  detial({required this.edetial, required this.epassword});
}
