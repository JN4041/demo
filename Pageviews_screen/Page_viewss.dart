import 'package:flutter/material.dart';

class PageView123 extends StatefulWidget {
  const PageView123({Key? key}) : super(key: key);

  @override
  State<PageView123> createState() => _PageView123State();
}

class _PageView123State extends State<PageView123> {
  int selct = 0;
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: _height * 0.7,
            child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    selct = value;
                  });
                },
                clipBehavior: Clip.none,
                children: List.generate(
                    3,
                    (index) => Column(
                          children: [
                            Container(
                              height: _height * 0.2,
                              width: _width * 0.3,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.black),
                            ),
                            Text("Jaydip"),
                            SizedBox(
                              height: 10,
                            ),
                            MaterialButton(
                              onPressed: () {},
                              height: _height * 0.04,
                              minWidth: _width * 0.7,
                              color: Colors.red,
                            ),
                            SizedBox(
                              height: _height * 0.04,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                3,
                                (index) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 6),
                                  child: CircleAvatar(
                                    radius: 9,
                                    backgroundColor: selct != index
                                        ? Colors.redAccent.shade100
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ))),
          )
        ],
      ),
    );
  }
}
