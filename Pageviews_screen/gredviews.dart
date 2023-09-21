import 'package:flutter/material.dart';

class Gradviews12 extends StatefulWidget {
  const Gradviews12({Key? key}) : super(key: key);

  @override
  State<Gradviews12> createState() => _Gradviews12State();
}

class _Gradviews12State extends State<Gradviews12> {
  List NAME = [
    "Jaydip",
    "Jaydip1",
    "Jaydip2",
    "Jaydip3",
    "Jaydip4",
    "Jaydip5",
    "Jaydip5",
    "Jaydip5",
    "Jaydip5",
    "Jaydip5",
    "Jaydip5",
    "Jaydip5",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("domne")));
                    // showDialog(
                    //   context: context,
                    //   builder: (context) {
                    //     return Dialog(
                    //       child: Container(
                    //         height: 300,
                    //         width: 200,
                    //         color: Colors.black,
                    //       ),
                    //     );
                    //   },
                    // );
                    showModalBottomSheet(
                      backgroundColor: Colors.red,
                      elevation: 30,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      context: context,
                      builder: (context) {
                        return Column(
                          children: [
                            Container(
                              color: Colors.yellow,
                            )
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 150,
                    width: 300,
                    child: Center(child: Text(NAME[index])),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                );
              },
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 200),
            ),
          )
        ],
      ),
    );
  }
}
